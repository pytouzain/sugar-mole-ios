//
//  ActionDataModel.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 24/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ActionDataModel.h"

@implementation ActionDataModel

- (instancetype)initWithImage:(UIImage *)image descriptionItem:(NSString *)descriptionItem {
    self = [super init];
    if (self) {
        self.image = image;
        self.descriptionItem = descriptionItem;
    }
    return self;
}

@end
