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
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Sign in Error : %@", error);
        
        if (_delegate && [_delegate respondsToSelector:@selector(signInDidFail:)]) {
            [_delegate signInDidFail:[NSNumber numberWithInteger:[operation.response statusCode]]];
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

#pragma mark House

- (void)getHouses:(NSString *)token
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Token %@", token] forHTTPHeaderField:@"Authorization"];
    
    [manager GET:[NSString stringWithFormat:@"%@/%@/", API_BASE_URL, @"house"] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"Get Houses Success : %@", response);
        
        if (_delegate && [_delegate respondsToSelector:@selector(getHousesSucceed:)]) {
            [_delegate getHousesSucceed:response];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Get Houses Error : %@", error);
        
    }];
}

- (void)getHouse:(NSString *)uuid token:(NSString *)token
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Token %@", token] forHTTPHeaderField:@"Authorization"];
    
    [manager GET:[NSString stringWithFormat:@"%@/%@/%@", API_BASE_URL, @"house", uuid] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"Get House Success : %@", response);
        
        if (_delegate && [_delegate respondsToSelector:@selector(getHouseSucceed:)]) {
            [_delegate getHouseSucceed:response];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Get House Error : %@", error);
        
    }];
}

- (void)createHouse:(NSString *)token
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Token %@", token] forHTTPHeaderField:@"Authorization"];
    
    [manager POST:[NSString stringWithFormat:@"%@/%@/", API_BASE_URL, @"house"] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"Create house Success : %@", response);
        
        if (_delegate && [_delegate respondsToSelector:@selector(createHouseSucceed:)]) {
            [_delegate createHouseSucceed:response];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Create House Error : %@", error);
        
    }];
}

- (void)performAction:(NSString *)action toScenario:(NSString *)scenarioName onHouse:(NSString *)uuid token:(NSString *)token
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"scenario_name":scenarioName, @"option":action};
    
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Token %@", token] forHTTPHeaderField:@"Authorization"];
    
    [manager PUT:[NSString stringWithFormat:@"%@/%@/%@", API_BASE_URL, @"house", uuid] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"Perform Action Success : %@", response);
        
        if (_delegate && [_delegate respondsToSelector:@selector(performActionSucceed:)]) {
            [_delegate performActionSucceed:response];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Perform Action Error : %@", error);
        
        if (_delegate && [_delegate respondsToSelector:@selector(performActionFail:)]) {
            [_delegate performActionFail:[NSNumber numberWithInteger:[operation.response statusCode]]];
        }
        
    }];
}

@end
