//
//  ScenarioDataModel.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 28/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScenarioDataModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *scenarioDescription;
@property (nonatomic, strong) NSArray *triggers;
@property (nonatomic, strong) NSArray *actions;

@end
