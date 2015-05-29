//
//  PlugsItemCell.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "PlugItemCell.h"

@implementation PlugItemCell

- (void)configureCellForIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            self.actionStateImage.image = [UIImage imageNamed:@"Electricity-100_fat"];
            self.descriptionLabel.text = @"TV";
            break;
            
        case 1:
            self.actionStateImage.image = [UIImage imageNamed:@"Electricity-100_thin"];
            self.descriptionLabel.text = @"Laptop";
            break;
            
        case 2:
            self.actionStateImage.image = [UIImage imageNamed:@"Electricity-100_fat"];
            self.descriptionLabel.text = @"Coffee Machine";
            break;
            
        default:
            break;
    }
}

@end
