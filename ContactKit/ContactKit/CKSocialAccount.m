//
//  CKSocialAccount.m
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "CKSocialAccount.h"

@interface CKSocialAccount ()

//Social Profile properties
@property (nonatomic, readwrite) CKSocialAccounts socialAccount;
@property (nonatomic, readwrite) NSString *userName;
@property (nonatomic, readwrite) NSString *identifier;
@property (nonatomic, readwrite) NSURL *url;

@end

//kABPersonSocialProfile implementation to be used within the API
@implementation CKSocialAccount

@synthesize socialAccount,userName,identifier,url;

//init with a dictionary of social accounts with network types and identifiers
- (instancetype)initWithDictionaryOfSocialAccounts:(NSDictionary *)dictionaryOfSocialAccounts {
    self = [super init];
    if (self) {
        NSString *userNameKey = (__bridge_transfer NSString *)kABPersonSocialProfileUsernameKey;
        NSString *identifierKey = (__bridge_transfer NSString *)kABPersonSocialProfileUserIdentifierKey;
        NSString *urlKey = (__bridge_transfer NSString *)kABPersonSocialProfileURLKey;
        userName = dictionaryOfSocialAccounts[userNameKey];
        identifier = dictionaryOfSocialAccounts[identifierKey];
        url = [NSURL URLWithString:dictionaryOfSocialAccounts[urlKey]];
    }
    return self;
}

@end
