//
//  CKAddress.m
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "CKAddress.h"

@implementation CKAddress

@synthesize street,state,zip,city,country,countryCode;

- (id)initWithDictionaryOfAddress:(NSDictionary *)dictionaryOfAddress {
    self = [super init];
    if (self) {
        street = dictionaryOfAddress[(__bridge NSString *) kABPersonAddressStreetKey];
        state = dictionaryOfAddress[(__bridge NSString *) kABPersonAddressStateKey];
        zip = dictionaryOfAddress[(__bridge NSString *) kABPersonAddressZIPKey];
        city = dictionaryOfAddress[(__bridge NSString *) kABPersonAddressCityKey];
        country = dictionaryOfAddress[(__bridge NSString *) kABPersonAddressCountryKey];
        countryCode = dictionaryOfAddress[(__bridge NSString *) kABPersonAddressCountryCodeKey];
    }
    return self;
}

@end
