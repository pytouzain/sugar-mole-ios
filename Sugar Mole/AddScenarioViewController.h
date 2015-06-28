//
//  AddScenarioViewController.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 21/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ItemsTableViewController.h"

#import "AddScenarioHeaderView.h"

@protocol AddItemProtocol <NSObject>

- (void)addTriggerWithType:(TriggerType)type detail:(DetailTrigger)detail value:(int)value;
- (void)addActionsFromArray:(NSArray *)actions;

@end

@interface AddScenarioViewController : ItemsTableViewController <AddScenarioHeaderViewProtocol, AddItemProtocol>

@end
