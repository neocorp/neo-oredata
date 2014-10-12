//
//  CKAccessType.h
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CKContact;

typedef NS_ENUM(NSUInteger, CKAddressBookAccess)
{
    CKAddressBookAccessUnknown = 0,
    CKAddressBookAccessGranted = 1,
    CKAddressBookAccessDenied  = 2
};

typedef BOOL(^CKContactFilterBlock)(CKContact *contact);

typedef NS_OPTIONS(NSUInteger , CKContactField)
{
    CKContactFieldFirstName        = 1 << 0,
    CKContactFieldLastName         = 1 << 1,
    CKContactFieldCompany          = 1 << 2,
    CKContactFieldPhones           = 1 << 3,
    CKContactFieldEmails           = 1 << 4,
    CKContactFieldPhoto            = 1 << 5,
    CKContactFieldThumbnail        = 1 << 6,
    CKContactFieldPhonesWithLabels = 1 << 7,
    CKContactFieldCompositeName    = 1 << 8,
    CKContactFieldAddresses        = 1 << 9,
    CKContactFieldRecordID         = 1 << 10,
    CKContactFieldCreationDate     = 1 << 11,
    CKContactFieldModificationDate = 1 << 12,
    CKContactFieldMiddleName       = 1 << 13,
    CKContactFieldSocialProfiles   = 1 << 14,
    CKContactFieldDefault          = CKContactFieldFirstName | CKContactFieldLastName | CKContactFieldPhones,
    CKContactFieldAll              = 0xFFFF
};

