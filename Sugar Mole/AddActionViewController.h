//
//  AddActionViewController.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 25/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "AddScenarioViewController.h"

@interface AddActionViewController : ItemsTableViewController

@property (nonatomic, assign) id<AddItemProtocol> delegate;

@end
