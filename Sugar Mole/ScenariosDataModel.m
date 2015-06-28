//
//  ScenariosDataModel.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 28/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ScenariosDataModel.h"

@implementation ScenariosDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scenarios = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
