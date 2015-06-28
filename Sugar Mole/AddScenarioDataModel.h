//
//  AddScenarioDataModel.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddScenarioDataModel : NSObject

@property (nonatomic, strong) NSMutableArray *triggers;
@property (nonatomic, strong) NSMutableArray *actions;

- (NSUInteger)count;
- (void)createTriggerForType:(TriggerType)type detail:(DetailTrigger)detail value:(int)value;

@end
