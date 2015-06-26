//
//  AddActionCell.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 25/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "BaseItemCell.h"

@interface AddActionCell : BaseItemCell

@property (nonatomic, strong) NSString *descriptionItem;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) BOOL isCellSelected;

@end
