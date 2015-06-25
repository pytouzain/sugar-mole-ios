//
//  AddActionCell.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 25/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddActionCell.h"

@interface AddActionCell ()

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *itemImageView;

@end

@implementation AddActionCell

- (void)setDescriptionItem:(NSString *)descriptionItem {
    _descriptionLabel.text = descriptionItem;
}

- (void)setImage:(UIImage *)image {
    _itemImageView.image = image;
}

@end
