//
//  RequestHandler.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HTTPRequestManager.h"
#import "DataManager.h"

@interface RequestHandler : NSObject <HTTPRequestManagerDelegate>

+ (instancetype)sharedHandler;

- (void)signUpWithEmail:(NSString *)email password:(NSString *)password;

@end
