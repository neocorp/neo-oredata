//
//  CKNetworkManager.m
//  ContactKit
//
//  Created by Niyazi on 12/10/14.
//  Copyright (c) 2014 Niyazi Erdogan. All rights reserved.
//

#import "CKNetworkManager.h"

static NSString * const kCKAPIBaseURLString = @"YOUR_BASE_URL";
static NSString * const kCKFParseAPIKey = @"YOUR_BASE_URL_KEY_IF_NEEDED";

@interface CKNetworkManager ()

@property (nonatomic, assign) NSMutableDictionary *defaultHeaders;

@end

@implementation CKNetworkManager

@synthesize defaultHeaders, syncInProgress;

+ (CKNetworkManager *)sharedManager {
    static CKNetworkManager * sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[CKNetworkManager alloc] initWithBaseURL:[NSURL URLWithString:kCKAPIBaseURLString]];
    });
    return sharedManager;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super init];
    if (self) {
        [self setParameterEncoding:@"ENCODING_TYPE_YOU_WANT"];
        [self setDefaultHeader:@"DEFAULT_HEADER" value:@"HEADER_VALUE"];
        [self setDefaultHeader:@"ANOTHER_HEADER" value:@"ANOTHER_HEADER_VALUE"];
    }
    
    return self;
}

- (NSArray *)listAvailableWebMethods {
    //Implement here
    return nil;
}

- (NSMutableURLRequest *)GETRequestForClass:(NSString *)className parameters:(NSDictionary *)parameters {
    //Implement here
    return nil;
}

- (NSMutableURLRequest *)GETRequestForAllRecordsOfClass:(NSString *)className updatedAfterDate:(NSDate *)updatedDate {
    //Implement here
    return nil;
}

- (NSMutableURLRequest *)POSTRequestForClass:(NSString *)className parameters:(NSDictionary *)parameters {
    //Implement here
    return nil;
}

- (NSMutableURLRequest *)DELETERequestForClass:(NSString *)className forObjectWithId:(NSString *)objectId {
    //Implement here
    return nil;
}

- (void)enqueueBatchOfHTTPRequestOperationsWithRequests:(NSArray *)requests
                                          progressBlock:(void (^)(NSUInteger numberOfCompletedOperations, NSUInteger totalNumberOfOperations))progressBlock
                                        completionBlock:(void (^)(NSArray *operations))completionBlock {
    //Implement enqueueing of requests and run the failover mechanism here
}

- (void)setParameterEncoding:(NSString *)encoding {
    //Implement parameter encoding set
}

- (void)setDefaultHeader:(NSString *)header value:(NSString *)value {
    [defaultHeaders setValue:value forKey:header];
}

- (void)startNetworkOperation {
    //Implemnet network operation with above methods
    if (!syncInProgress) {
        [self willChangeValueForKey:@"syncInProgress"];
        syncInProgress = YES;
        [self didChangeValueForKey:@"syncInProgress"];
        //Get address book entities from global queue with an async operation
        dispatch_async((__bridge dispatch_queue_t)(dispatch_get_specific(@"ADDRESS_BOOK_QUEUE_AFTER_LOADING")), ^{
            //Manage external operations after dispatch
        });
    }
}

@end
