//
//  AddScenarioHeaderView.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddScenarioHeaderView.h"

@interface AddScenarioHeaderView ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIView *titleBarView;

@end

@implementation AddScenarioHeaderView

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (void)setTitleBarColor:(UIColor *)titleBarColor {
    _titleBarView.backgroundColor = titleBarColor;
}

- (IBAction)addButtonTouched:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(addButtonTouchedForTag:)]) {
        [_delegate addButtonTouchedForTag:self.headerViewTag];
    }
}

@end
