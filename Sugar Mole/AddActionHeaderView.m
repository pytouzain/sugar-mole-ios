//
//  AddActionHeaderView.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 25/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddActionHeaderView.h"

@interface AddActionHeaderView ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIView *titleBarView;

@end

@implementation AddActionHeaderView

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (void)setTitleBarColor:(UIColor *)titleBarColor {
    _titleBarView.backgroundColor = titleBarColor;
}

@end
