//
//  ScenariosTableViewController.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "ScenarioDataModel.h"

@protocol ScenariosListProtocol <NSObject>

- (void)addScenario:(ScenarioDataModel *)scenario;

@end

@interface ScenariosTableViewController : ItemsTableViewController <ScenariosListProtocol>

@end
