//
//  ActionItemCell.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "BaseItemCell.h"

@interface ActionItemCell : BaseItemCell

@property (weak, nonatomic) IBOutlet UIImageView *actionStateImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
