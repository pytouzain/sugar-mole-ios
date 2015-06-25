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
    return @{@"Security" : @[[[ActionDataModel alloc] initWithImage:nil descriptionItem:@"Open the front door"],
                             [[ActionDataModel alloc] initWithImage:nil descriptionItem:@"Close the front door"]
                             ],
             @"Lamps" : @[[[ActionDataModel alloc] initWithImage:nil descriptionItem:@"Turn on living room lamp"],
                          [[ActionDataModel alloc] initWithImage:nil descriptionItem:@"Turn off living room lamp"]
                          ],
             @"Air conditionning" : @[[[ActionDataModel alloc] initWithImage:nil descriptionItem:@"Turn on the bedroom AC"],
                                      [[ActionDataModel alloc] initWithImage:nil descriptionItem:@"Turn off the bedroom AC"]
                                      ],
             @"Heater" : @[[[ActionDataModel alloc] initWithImage:nil descriptionItem:@"Turn on the kids bedroom heater"],
                           [[ActionDataModel alloc] initWithImage:nil descriptionItem:@"Turn off the kids bedroom heater"]]
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
