//
//  ContactKit.m
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import "CKAddressBook.h"
#import "CKAccessType.h"
#import "CKContact.h"
#import <AddressBook/AddressBook.h>

@interface CKAddressBook ()

//Address book reference
@property (nonatomic, readonly) ABAddressBookRef addressBook;

//Local queue to hold contacts from address book when fetched
@property (nonatomic, readonly) dispatch_queue_t localQueue;

//Block for observing changes in address book
@property (nonatomic, copy) void (^changeCallback)();
@end

@implementation CKAddressBook

@synthesize addressBook, localQueue, changeCallback;

+ (id)sharedAddressBook {
    static CKAddressBook *singleAddressBook = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleAddressBook = [[self alloc] init];
    });
    return singleAddressBook;
}

- (id)init {
    self = [super init];
    if (self)
    {
        CFErrorRef *error = NULL;
        addressBook = ABAddressBookCreateWithOptions(NULL, error);
        if (error)
        {
            NSLog(@"%@", (__bridge_transfer NSString *)CFErrorCopyFailureReason(*error));
            return nil;
        }
        NSString *name = [NSString stringWithFormat:@"com.neo.contactkit.%ld",
                         (long)self.hash];
        localQueue = dispatch_queue_create([name cStringUsingEncoding:NSUTF8StringEncoding], Nil);
        self.fieldsMask = CKContactFieldDefault;
    }
    return self;
}

- (id)initContactListWithDefaultAccess {
    
    return self;
}

- (id)initContactListWithAccessGranted {
    
    return self;
}

- (CKAddressBookAccess)checkForAddressBookAccess {
    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
    switch (status)
    {
        case kABAuthorizationStatusDenied:
        case kABAuthorizationStatusRestricted:
            return CKAddressBookAccessDenied;
            
        case kABAuthorizationStatusAuthorized:
            return CKAddressBookAccessGranted;
            
        default:
            return CKAddressBookAccessUnknown;
    }
}

- (void)promptForAddressBookAccess {
    
}

- (void)loadContacts:(void (^)(NSArray *contacts, NSError *error))callbackBlock
{
    [self loadContactsOnQueue:dispatch_get_main_queue() completion:callbackBlock];
}

- (void)loadContactsOnQueue:(dispatch_queue_t)queue
                 completion:(void (^)(NSArray *contacts, NSError *error))completionBlock
{
    CKContactField fieldMask = self.fieldsMask;
    NSArray *descriptors = self.sortDescriptors;
    CKContactFilterBlock filterBlock = self.filterBlock;
    
    ABAddressBookRequestAccessWithCompletion(self.addressBook, ^(bool granted, CFErrorRef errorRef)
                                             {
                                                 dispatch_async(self.localQueue, ^
                                                                {
                                                                    NSArray *array = nil;
                                                                    NSError *error = nil;
                                                                    if (granted)
                                                                    {
                                                                        CFArrayRef peopleArrayRef = ABAddressBookCopyArrayOfAllPeople(self.addressBook);
                                                                        NSUInteger contactCount = (NSUInteger)CFArrayGetCount(peopleArrayRef);
                                                                        NSMutableArray *contacts = [[NSMutableArray alloc] init];
                                                                        for (NSUInteger i = 0; i < contactCount; i++)
                                                                        {
                                                                            ABRecordRef recordRef = CFArrayGetValueAtIndex(peopleArrayRef, i);
                                                                            CKContact *contact = [[CKContact alloc] initWithRecordRef:recordRef fieldMask:fieldMask];
                                                                            if (!filterBlock || filterBlock(contact))
                                                                            {
                                                                                [contacts addObject:contact];
                                                                            }
                                                                        }
                                                                        [contacts sortUsingDescriptors:descriptors];
                                                                        array = contacts.copy;
                                                                        CFRelease(peopleArrayRef);
                                                                    }
                                                                    else if (errorRef)
                                                                    {
                                                                        error = (__bridge NSError *)errorRef;
                                                                    }
                                                                    
                                                                    dispatch_async(queue, ^
                                                                                   {
                                                                                       if (completionBlock)
                                                                                       {
                                                                                           completionBlock(array, error);
                                                                                       }
                                                                                   });
                                                                });
                                             });
}

- (void)startObserveChangesWithCallback:(void (^)())callback
{
    if (callback)
    {
        if (!self.changeCallback)
        {
            ABAddressBookRegisterExternalChangeCallback(self.addressBook,
                                                        CKAddressBookExternalChangeCallback,
                                                        (__bridge void *)(self));
        }
        self.changeCallback = callback;
    }
}

- (void)stopObserveChanges
{
    if (self.changeCallback)
    {
        self.changeCallback = nil;
        ABAddressBookUnregisterExternalChangeCallback(self.addressBook,
                                                      CKAddressBookExternalChangeCallback,
                                                      (__bridge void *)(self));
    }
}

void CKAddressBookExternalChangeCallback(ABAddressBookRef __unused addressBookRef,
                                         CFDictionaryRef __unused info,
                                         void *context)
{
    CKAddressBook *addressBook = (__bridge CKAddressBook *)(context);
    addressBook.changeCallback ? addressBook.changeCallback() : nil;
}

@end
