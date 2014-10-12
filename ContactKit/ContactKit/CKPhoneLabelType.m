//
//  CKPhoneLabelType.m
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import "CKPhoneLabelType.h"

@implementation CKPhoneLabelType

@synthesize phone,label;

- (id)initWithPhone:(NSString *)phoneNumber withLabel:(NSString *)phoneLabel {
    self = [super init];
    if (self) {
        phone = phoneNumber;
        label = phoneLabel;
    }
    return self;
}

@end
