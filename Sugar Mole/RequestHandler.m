//
//  RequestHandler.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "RequestHandler.h"

@interface RequestHandler ()

@property (nonatomic, strong) HTTPRequestManager *httpRequestManager;
@property (nonatomic, strong) DataManager *dataManager;

@end

@implementation RequestHandler

static RequestHandler *requestHandler = nil;

+ (instancetype)sharedHandler
{
    if (requestHandler == nil)
        requestHandler = [[RequestHandler alloc] init];
    return requestHandler;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _httpRequestManager = [[HTTPRequestManager alloc] init];
        _dataManager = [[DataManager alloc] init];
        
        _httpRequestManager.delegate = self;
    }
    return self;
}

- (void)signUpWithEmail:(NSString *)email password:(NSString *)password
{
    [_httpRequestManager signUp:@{@"username" : email, @"password" : password}];
}

#pragma HTTPRequestManagerDelegate Methods

- (void)signInDidSucceed:(NSDictionary *)response
{
    
}

- (void)signInDidFail:(NSError *)error
{
    
}

- (void)signUpDidSucceed:(NSDictionary *)response
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"signUpDidSucceed" object:nil];
}

- (void)signUpDidFail:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"signUpDidFail" object:nil]; 
}

@end
