//
//  ScenarioItemCell.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ScenarioItemCell.h"

@interface ScenarioItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *scenarioIcon;
@property (weak, nonatomic) IBOutlet UILabel *scenarioDescription;


@end

@implementation ScenarioItemCell

- (void)configureCellForIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            _scenarioIcon.image = [UIImage imageNamed:@"Sun-100"];
            _scenarioDescription.text = @"When it's sunny outside, open the blinds of the living room";
            break;
        
        case 1:
            _scenarioIcon.image = [UIImage imageNamed:@"Rain-100"];
            _scenarioDescription.text = @"If the temperature goes below 20°, turn on the heater of the bedrooms";
            break;
            
        default:
            break;
    }
}

@end
