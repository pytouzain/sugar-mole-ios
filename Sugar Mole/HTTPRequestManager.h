//
//  HTTPRequestManager.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTTPRequestManagerDelegate <NSObject>

- (void)signInDidSucceed:(NSDictionary *)response;
- (void)signInDidFail:(NSNumber *)errorCode;

- (void)signUpDidSucceed:(NSDictionary *)response;
- (void)signUpDidFail:(NSNumber *)errorCode;

- (void)getHousesSucceed:(NSDictionary *)response;
- (void)getHouseSucceed:(NSDictionary *)response;
- (void)createHouseSucceed:(NSDictionary *)response;
- (void)performActionSucceed:(NSDictionary *)response;
- (void)performActionFail:(NSNumber *)errorCode;

- (void)getApiDetailsSucceed:(NSDictionary *)response;

- (void)getDevicesInfosSucceed:(NSDictionary *)response;

@end

@interface HTTPRequestManager : NSObject

@property (nonatomic, weak) id<HTTPRequestManagerDelegate> delegate;

- (void)signIn:(NSDictionary *)parameters;
- (void)signUp:(NSDictionary *)parameters;

- (void)getHouses:(NSString *)token;
- (void)getHouse:(NSString *)uuid token:(NSString *)token;
- (void)createHouse:(NSString *)token;
- (void)performAction:(NSString *)action toScenario:(NSString *)scenarioName onHouse:(NSString *)uuid token:(NSString *)token;

- (void)getApiDetails:(NSString *)token;
- (void)getDevicesInfos:(NSString *)token;

@end

