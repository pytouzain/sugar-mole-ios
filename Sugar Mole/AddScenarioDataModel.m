//
//  AddScenarioDataModel.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddScenarioDataModel.h"
#import "TriggerDataModel.h"

@implementation AddScenarioDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.triggers = [[NSMutableArray alloc] init];
        
//        [self.triggers addObject:@"test"];
//        [self.triggers addObject:@"test"];
//        [self.triggers addObject:@"test"];
        
        
        self.actions = [[NSMutableArray alloc] init];
        
//        [self.actions addObject:@"test"];
//        [self.actions addObject:@"test"];
//        [self.actions addObject:@"test"];
        
    }
    return self;
}

- (void)createTriggerForType:(TriggerType)type detail:(DetailTrigger)detail value:(int)value {
    NSString *description;
    UIImage *image;
    
    if (type == TriggerTypeTemperature) {
        description = @"Temperature ";
        image = [UIImage imageNamed:@"Temperature Filled-100"];
        if (detail == DetailTriggerInferior) {
            description = [description stringByAppendingFormat:@"lower than %02d°C", value];
        }
        else if (detail == DetailTriggerEqual) {
            description = [description stringByAppendingFormat:@"equal to %02d°C", value];
        }
        else if (detail == DetailTriggerSuperior) {
            description = [description stringByAppendingFormat:@"greater than %02d°C", value];
        }
    }
    else if (type == TriggerTypeTime) {
        image = [UIImage imageNamed:@"Clock-100"];
        if (detail == DetailTriggerInferior) {
            description = [NSString stringWithFormat:@"Before %@", [self transformValueToTime:value]];
        }
        else if (detail == DetailTriggerEqual) {
            description = [NSString stringWithFormat:@"At %@", [self transformValueToTime:value]];
        }
        else if (detail == DetailTriggerSuperior) {
            description = [NSString stringWithFormat:@"After %@", [self transformValueToTime:value]];
        }
    }
    else if (type == TriggerTypeHumidity) {
        description = @"Humidity ";
        image = [UIImage imageNamed:@"Wet-100"];
        if (detail == DetailTriggerInferior) {
            description = [description stringByAppendingFormat:@"lower than %02d%%", value];
        }
        else if (detail == DetailTriggerEqual) {
            description = [description stringByAppendingFormat:@"equal to %02d%%", value];
        }
        else if (detail == DetailTriggerSuperior) {
            description = [description stringByAppendingFormat:@"greater than %02d%%", value];
        }
    }
    TriggerDataModel *model = [[TriggerDataModel alloc] init];
    model.descriptionItem = description;
    model.image = image;
    model.type = type;
    model.detail = detail;
    model.value = value;
    [_triggers addObject:model];
}

- (NSString *)transformValueToTime:(int)value {
    int hours = value / 6;
    int minutes = hours > 0 ? (value % (hours * 6)) * 10 : value * 10;
    
    return [NSString stringWithFormat:@"%02d : %02d", hours, minutes];
}

- (NSUInteger)count {
    return [_triggers count] + [_actions count];
}

@end
