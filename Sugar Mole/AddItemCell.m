//
//  AddItemCell.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 24/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddItemCell.h"

@interface AddItemCell ()

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *itemImageView;

@end

@implementation AddItemCell

- (void)setDescriptionItem:(NSString *)descriptionItem {
    _descriptionLabel.text = descriptionItem;
}

- (void)setImage:(UIImage *)image {
    _itemImageView.image = image;
}

@end
