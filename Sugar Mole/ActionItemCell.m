//
//  ActionItemCell.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ActionItemCell.h"

@implementation ActionItemCell

- (IBAction)sliderValueChanged:(UISlider *)sender {
    _valueLabel.text = [NSString stringWithFormat:@"%02d%%", (int)sender.value];
}

- (void)setSliderValue:(NSUInteger)value {
    [_valueSlider setValue:value];
    _valueLabel.text = [NSString stringWithFormat:@"%02d%%", (int)_valueSlider.value];
}

@end
