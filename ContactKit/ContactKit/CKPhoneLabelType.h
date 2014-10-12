//
//  CKPhoneLabelType.h
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKPhoneLabelType : NSObject

@property (nonatomic, readonly) NSString *phone;
@property (nonatomic, readonly) NSString *label;

- (id)initWithPhone:(NSString *)phoneNumber withLabel:(NSString *)phoneLabel;

@end
