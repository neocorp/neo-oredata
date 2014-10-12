//
//  CKNetworkManager.h
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKAddressBook.h"

@interface CKNetworkManager : NSObject

//BOOL to control the status of atomic operation of HTTP Request
@property (atomic, readonly) BOOL syncInProgress;

//Singleton instance for managing network operations
+ (CKNetworkManager *)sharedManager;

//Initialize the connection with a base URL
- (id)initWithBaseURL:(NSURL *)url;

//List available web methods to be implemented such as GET, POST, UPDATE etc.
- (NSArray *)listAvailableWebMethods;

//GET request implementation for an instance of CKAddressBook
- (NSMutableURLRequest *)GETRequestForClass:(NSString *)className parameters:(NSDictionary *)parameters;

//GET request implementation for all instances of CKAddressBook
- (NSMutableURLRequest *)GETRequestForAllRecordsOfClass:(NSString *)className updatedAfterDate:(NSDate *)updatedDate;

//POST request implementation for an instance of CKAddressBook
- (NSMutableURLRequest *)POSTRequestForClass:(NSString *)className parameters:(NSDictionary *)parameters;

//DELETE request implementation for an instance of CKAddressBook
- (NSMutableURLRequest *)DELETERequestForClass:(NSString *)className forObjectWithId:(NSString *)objectId;

//Handle all network operation with the help of singleton
- (void)startNetworkOperation;

@end
