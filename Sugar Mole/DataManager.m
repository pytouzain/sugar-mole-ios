//
//  DataManager.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "DataManager.h"

@interface DataManager ()

@property (nonatomic, strong) NSString *token;

@end

@implementation DataManager

- (void)authentificationSucceed:(NSString *)token
{
    _token = token;
}

@end
