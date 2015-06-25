//
//  AddActionDataModel.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 25/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddActionDataModel : NSObject

@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSDictionary *actions;
@property (nonatomic, strong) NSDictionary *barColors;

@end
