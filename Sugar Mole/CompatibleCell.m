//
//  CompatibleCell.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "CompatibleCell.h"

@implementation CompatibleCell

- (void)configureCellForIndex:(NSUInteger)index
{
    self.nameLabel.text = @"SEN.SE";
    self.versionLabel.text = @"v 1.0.0.1";
}

@end
