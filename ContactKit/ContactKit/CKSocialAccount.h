//
//  CKSocialAccount.h
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import <Foundation/Foundation.h>

//Social Profile types enumeration
typedef NS_ENUM(NSUInteger, CKSocialAccounts) {
    CKSocialAccountUnknown = 0,
    CKSocialAccountFacebook = 1,
    CKSocialAccountTwitter = 2,
    CKSocialAccountLinkedIn = 3
};

@interface CKSocialAccount : NSObject

//Social Profile properties for the Contact
@property (nonatomic, readonly) CKSocialAccounts socialAccount;
@property (nonatomic, readonly) NSString *userName;
@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, readonly) NSURL *url;

//Dictionary with the contents of Social Profiles
- (instancetype)initWithDictionaryOfSocialAccounts:(NSDictionary *)dictionaryOfSocialAccounts;

@end
