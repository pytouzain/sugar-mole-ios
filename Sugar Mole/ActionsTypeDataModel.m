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
        model1.descriptionItem = @"Kids bedroom light";
        model1.value = 20;
        [_actionsType addObject:model1];
        
        ActionTypeDataModel *model2 = [[ActionTypeDataModel alloc] init];
        model2.image = [UIImage imageNamed:@"Idea-100"];
        model2.descriptionItem = @"Parents bedroom light";
        model2.value = 65;
        [_actionsType addObject:model2];
        
        ActionTypeDataModel *model3 = [[ActionTypeDataModel alloc] init];
        model3.image = [UIImage imageNamed:@"Idea-100"];
        model3.descriptionItem = @"Living room lamp";
        model3.value = 40;
        [_actionsType addObject:model3];
        
        ActionTypeDataModel *model4 = [[ActionTypeDataModel alloc] init];
        model4.image = [UIImage imageNamed:@"Idea-100"];
        model4.descriptionItem = @"Kitchen light";
        model4.value = 0;
        [_actionsType addObject:model4];
        
        ActionTypeDataModel *model5 = [[ActionTypeDataModel alloc] init];
        model5.image = [UIImage imageNamed:@"Idea-100"];
        model5.descriptionItem = @"Bathroom light";
        model5.value = 0;
        [_actionsType addObject:model5];
    }
    else if ([_identifier isEqualToString:@"ACCellIdentifier"]) {
        ActionTypeDataModel *model1 = [[ActionTypeDataModel alloc] init];
        model1.image = [UIImage imageNamed:@"Winter-100_fat"];
        model1.descriptionItem = @"Parents bedroom AC";
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
