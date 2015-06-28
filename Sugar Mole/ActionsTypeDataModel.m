//
//  ActionTypeDataModel.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 29/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ActionsTypeDataModel.h"
#import "ActionTypeDataModel.h"

@implementation ActionsTypeDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.actionsType = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setIdentifier:(NSString *)identifier {
    _identifier = identifier;
    if ([_identifier isEqualToString:@"lightCellIdentifier"]) {
        ActionTypeDataModel *model1 = [[ActionTypeDataModel alloc] init];
        model1.image = [UIImage imageNamed:@"Idea-100"];
        model1.descriptionItem = @"Kitchen light";
        model1.value = 20;
        [_actionsType addObject:model1];
        
        ActionTypeDataModel *model2 = [[ActionTypeDataModel alloc] init];
        model2.image = [UIImage imageNamed:@"Idea-100"];
        model2.descriptionItem = @"Living room lamp";
        model2.value = 65;
        [_actionsType addObject:model2];
    }
    else if ([_identifier isEqualToString:@"ACCellIdentifier"]) {
        ActionTypeDataModel *model1 = [[ActionTypeDataModel alloc] init];
        model1.image = [UIImage imageNamed:@"Winter-100_fat"];
        model1.descriptionItem = @"Bedroom AC";
        model1.value = 80;
        [_actionsType addObject:model1];
        
        ActionTypeDataModel *model2 = [[ActionTypeDataModel alloc] init];
        model2.image = [UIImage imageNamed:@"Winter-100_fat"];
        model2.descriptionItem = @"Living room AC";
        model2.value = 42;
        [_actionsType addObject:model2];
    }
}

@end
