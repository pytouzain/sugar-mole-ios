//
//  ScenarioDataModel.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 28/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ScenarioDataModel.h"

#import "TriggerDataModel.h"
#import "ActionDataModel.h"

@implementation ScenarioDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIImage *)image {
    if ([self.actions count] > 0) {
        ActionDataModel *actionModel = [self.actions objectAtIndex:0];
        return actionModel.image;
    }
    return nil;
}

- (NSString *)scenarioDescription {
    NSString *description = @"";
    
    description = [description stringByAppendingFormat:@"Trigger%@:\n", [self.triggers count] > 1 ? @"s" : @""];
    for (TriggerDataModel *triggerModel in self.triggers) {
        description = [description stringByAppendingFormat:@"- %@\n", triggerModel.descriptionItem];
    }
    
    description = [description stringByAppendingFormat:@"\nAction%@:\n", [self.actions count] > 1 ? @"s" : @""];
    
    for (ActionDataModel *actionModel in self.actions) {
        description = [description stringByAppendingFormat:@"- %@", actionModel.descriptionItem];
        if (actionModel != [self.actions lastObject]) {
            description = [description stringByAppendingString:@"\n"];
        }
    }
    return description;
}

@end
