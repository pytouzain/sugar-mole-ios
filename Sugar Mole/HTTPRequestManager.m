//
//  HTTPRequestManager.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "HTTPRequestManager.h"

#define API_BASE_URL @"http://54.72.214.104/api"

@implementation HTTPRequestManager

#pragma mark Authentification

- (void)signIn:(NSDictionary *)parameters
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager PUT:[NSString stringWithFormat:@"%@/%@/", API_BASE_URL, @"user"] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"Sign in success : %@", response);
        
        if (_delegate && [_delegate respondsToSelector:@selector(signInDidSucceed:)]) {
            [_delegate signInDidSucceed:response];
        }
        
//        NSMutableDictionary *persistentsDatas = [[NSMutableDictionary alloc] initWithDictionary:parameters];
//        [persistentsDatas addEntriesFromDictionary:response];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"signInSuccess" object:persistentsDatas];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Sign in Error : %@", error);
        
        if (_delegate && [_delegate respondsToSelector:@selector(signInDidFail:)]) {
            [_delegate signInDidFail:error];
        }
    }];
}

- (void)signUp:(NSDictionary *)parameters
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:[NSString stringWithFormat:@"%@/%@/", API_BASE_URL, @"user"] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"Sign up uccess : %@", response);
        
        if (_delegate && [_delegate respondsToSelector:@selector(signInDidSucceed:)]) {
            [_delegate signUpDidSucceed:response];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Sign up Error : %@", error);
        
        if (_delegate && [_delegate respondsToSelector:@selector(signInDidFail:)]) {
            [_delegate signUpDidFail:[NSNumber numberWithInteger:[operation.response statusCode]]];
        }
    }];
}



@end
