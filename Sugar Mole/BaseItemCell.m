//
//  BaseItemCell.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "BaseItemCell.h"

@implementation BaseItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.contentView.frame;
    frame.origin.x = 20;
    frame.size.width -= 40;
    self.contentView.frame = frame;
    [self.contentView setBackgroundColor:[UIColor greenColor]];
}

@end
