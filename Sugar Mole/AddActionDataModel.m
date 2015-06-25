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
                             [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Lock 2-100_white"] descriptionItem:@"Close the front door"]
                             ],
             @"Lamps" : @[[[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100"] descriptionItem:@"Turn on living room lamp"],
                          [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Idea-100_switch_off"] descriptionItem:@"Turn off living room lamp"]
                          ],
             @"Air conditionning" : @[[[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Winter-100_fat"] descriptionItem:@"Turn on the bedroom AC"],
                                      [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Winter-100_thin"] descriptionItem:@"Turn off the bedroom AC"]
                                      ],
             @"Heater" : @[[[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Heating Room Filled-100"] descriptionItem:@"Turn on the kids bedroom heater"],
                           [[ActionDataModel alloc] initWithImage:[UIImage imageNamed:@"Heating Room-100"] descriptionItem:@"Turn off the kids bedroom heater"]]
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
