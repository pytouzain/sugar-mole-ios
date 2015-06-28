//
//  ScenarioItemCell.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ScenarioItemCell.h"

@interface ScenarioItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *scenarioImageView;
@property (weak, nonatomic) IBOutlet UILabel *scenarioDescriptionLabel;


@end

@implementation ScenarioItemCell

- (void)setScenarioDescription:(NSString *)scenarioDescription {
    _scenarioDescriptionLabel.text = scenarioDescription;
}

- (void)setImage:(UIImage *)image {
    _scenarioImageView.image = image;
    
    CGRect imageFrame = _scenarioImageView.frame;
    imageFrame.origin.y = (self.frame.size.height / 2) - (imageFrame.size.height / 2);
    _scenarioImageView.frame = imageFrame;
}

//- (void)configureCellForIndex:(NSUInteger)index
//{
//    switch (index) {
//        case 0:
//            _scenarioIcon.image = [UIImage imageNamed:@"Sun-100"];
//            _scenarioDescription.text = @"When it's sunny outside, open the blinds of the living room";
//            break;
//        
//        case 1:
//            _scenarioIcon.image = [UIImage imageNamed:@"Rain-100"];
//            _scenarioDescription.text = @"If the temperature goes below 20°, turn on the heater of the bedrooms";
//            break;
//            
//        default:
//            break;
//    }
//}

@end
