//
//  ContactKit.h
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import "CKAccessType.h"

@class CKContact;

@interface CKAddressBook : NSObject

//Reference property for Contacts
@property (nonatomic, assign) ABAddressBookRef *addressBookRef;

//Field mask for defining how and what to fetch within the address book entity
@property (nonatomic, assign) CKContactField fieldsMask;

//Block for filtering contacts
@property (nonatomic, copy) CKContactFilterBlock filterBlock;

//Sort descriptor for sorting fetched contacts with a cloumns
@property (nonatomic, strong) NSArray *sortDescriptors;


//Singleton for managing all the contact operations
+ (id)sharedAddressBook;

//initialize contact list with default access status (do not request if none)
- (id)initContactListWithDefaultAccess;

//initialize contact list with access level granted
- (id)initContactListWithAccessGranted;

//Check address book access status
- (CKAddressBookAccess)checkForAddressBookAccess;

//Prompt for address book access if needed
- (void)promptForAddressBookAccess;

//Load contacts with block
- (void)loadContacts:(void (^)(NSArray *contacts, NSError *error))callbackBlock;

//Load contacts with block to the dispatch_queue
- (void)loadContactsOnQueue:(dispatch_queue_t)queue
                 completion:(void (^)(NSArray *contacts, NSError *error))completionBlock;

//Notification for observing external changes to the address book
- (void)startObserveChangesWithCallback:(void (^)())callback;

//Stop observing on dealloc or destruction
- (void)stopObserveChanges;

@end
