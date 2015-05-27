//
//  RequestHandler.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "RequestHandler.h"
#import "NSString+MD5.h"

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

- (void)signInWithEmail:(NSString *)email password:(NSString *)password
{
    [_httpRequestManager signIn:@{@"username" : email, @"password" : [password md5]}];
}

- (void)signUpWithEmail:(NSString *)email password:(NSString *)password
{
    [_httpRequestManager signUp:@{@"username" : email, @"password" : [password md5]}];
}

- (void)signOut
{
    [_dataManager resetDatas];
}

- (void)getDevicesInfos
{
    [_httpRequestManager getDevicesInfos:_dataManager.token];
}

#pragma mark HTTPRequestManagerDelegate Methods

#pragma Authentification

- (void)signInDidSucceed:(NSDictionary *)response
{
    [_dataManager authentificationSucceed:[response objectForKey:@"token"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"signInDidSucceed" object:nil];
}

- (void)signInDidFail:(NSNumber *)errorCode;
{
    NSString *errorString;
    
    switch ([errorCode integerValue]) {
        case 400:
            errorString = @"An error occured, please retry";
            break;
        case 401:
            errorString = @"Incorrect password";
            break;
            
        default:
            errorString = @"Unexpected error";
            break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"signInDidFail" object:errorString];
}

- (void)signUpDidSucceed:(NSDictionary *)response
{
    [_dataManager authentificationSucceed:[response objectForKey:@"token"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"signUpDidSucceed" object:nil];
}

- (void)signUpDidFail:(NSNumber *)errorCode
{
    NSString *errorString;
    
    switch ([errorCode integerValue]) {
        case 400:
            errorString = @"An error occured, please retry";
            break;
            
        default:
            errorString = @"Unexpected error";
            break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"signUpDidFail" object:errorString];
}

#pragma House

- (void)getHousesSucceed:(NSDictionary *)response
{
    
}

- (void)getHouseSucceed:(NSDictionary *)response
{
    
}

- (void)createHouseSucceed:(NSDictionary *)response
{
    
}

- (void)performActionSucceed:(NSDictionary *)response
{
    
}

- (void)performActionFail:(NSNumber *)errorCode
{
    switch ([errorCode integerValue]) {
        case 404:
            break;
            
        default:
            break;
    }
}

#pragma API Details

- (void)getApiDetailsSucceed:(NSDictionary *)response
{
    
}

#pragma Devices Infos

- (void)getDevicesInfosSucceed:(NSDictionary *)response
{
    [_dataManager persistDevicesInfos:response];
}

@end
