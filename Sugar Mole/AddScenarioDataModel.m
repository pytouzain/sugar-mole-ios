//
//  AddScenarioDataModel.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddScenarioDataModel.h"

@implementation AddScenarioDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.triggers = [[NSMutableArray alloc] init];
        
        [self.triggers addObject:@"test"];
        [self.triggers addObject:@"test"];
        [self.triggers addObject:@"test"];
        
        
        self.actions = [[NSMutableArray alloc] init];
        
        [self.actions addObject:@"test"];
        [self.actions addObject:@"test"];
        [self.actions addObject:@"test"];
        
    }
    return self;
}

- (NSUInteger)count {
    return [_triggers count] + [_actions count];
}

@end
