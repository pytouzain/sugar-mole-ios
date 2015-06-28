//
//  AddActionDataModel.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 25/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddActionDataModel.h"
#import "ActionDataModel.h"

@implementation AddActionDataModel

- (NSArray *)sections {
    return @[@"Security", @"Lamps", @"Air conditionning", @"Heater"];
}

- (NSDictionary *)actions {
    return @{@"Security" : @[[[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Unlock-100"] descriptionItem:@"Open the front door"],
                             [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Lock 2-100_white"] descriptionItem:@"Close the front door"],
                             [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Unlock-100"] descriptionItem:@"Open the back door"],
                             [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Lock 2-100_white"] descriptionItem:@"Close the back door"],
                             [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Unlock-100"] descriptionItem:@"Open the garage door"],
                             [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Lock 2-100_white"] descriptionItem:@"Close the garage door"]
                             ],
             @"Lamps" : @[[[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100"] descriptionItem:@"Turn on the kids bedroom light"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100_switch_off"] descriptionItem:@"Turn off the kids bedroom light"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100"] descriptionItem:@"Turn on the parents bedroom light"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100_switch_off"] descriptionItem:@"Turn off the parents bedroom light"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100"] descriptionItem:@"Turn on the living room lamp"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100_switch_off"] descriptionItem:@"Turn off the living room lamp"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100"] descriptionItem:@"Turn on the kitchen light"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100_switch_off"] descriptionItem:@"Turn off the kitchen light"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100"] descriptionItem:@"Turn on the bathroom light"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100_switch_off"] descriptionItem:@"Turn off the bathroom light"]
                          ],
             @"Air conditionning" : @[[[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Winter-100_fat"] descriptionItem:@"Turn on the parents bedroom AC"],
                                      [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Winter-100_thin"] descriptionItem:@"Turn off the parents bedroom AC"],
                                      [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Winter-100_fat"] descriptionItem:@"Turn on the living room AC"],
                                      [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Winter-100_thin"] descriptionItem:@"Turn off the living room AC"]
                                      ],
             @"Heater" : @[[[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Heating Room Filled-100"] descriptionItem:@"Turn on the kids bedroom heater"],
                           [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Heating Room-100"] descriptionItem:@"Turn off the kids bedroom heater"],
                           [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Heating Room Filled-100"] descriptionItem:@"Turn on the parents bedroom heater"],
                           [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Heating Room-100"] descriptionItem:@"Turn off the parents bedroom heater"],
                           [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Heating Room Filled-100"] descriptionItem:@"Turn on the living room heater"],
                           [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Heating Room-100"] descriptionItem:@"Turn off the living room heater"]]
             };
}

- (NSDictionary *)barColors {
    return @{@"Security" : kSugarMoleColorYellow,
             @"Lamps" : kSugarMoleColorTurquoise,
             @"Air conditionning" : kSugarMoleColorBlue,
             @"Heater" : kSugarMoleColorOrange
             };
}

@end
