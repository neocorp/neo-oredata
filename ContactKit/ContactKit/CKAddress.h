//
//  CKAddress.h
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKAddress : NSObject

@property (nonatomic, readonly) NSString *street;
@property (nonatomic, readonly) NSString *zip;
@property (nonatomic, readonly) NSString *city;
@property (nonatomic, readonly) NSString *state;
@property (nonatomic, readonly) NSString *country;
@property (nonatomic, readonly) NSString *countryCode;

- (id)initWithDictionaryOfAddress:(NSDictionary *)dictionaryOfAddress;

@end
