//
//  ActionDataModel.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 24/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemDataModel.h"

@interface ActionDataModel : ItemDataModel

- (instancetype)initWithImage:(UIImage *)image descriptionItem:(NSString *)descriptionItem;

@end
