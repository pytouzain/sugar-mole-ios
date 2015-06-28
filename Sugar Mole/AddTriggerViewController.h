//
//  AddTriggerViewController.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 24/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AddScenarioViewController.h"
#import "AddScenarioDataModel.h"

@interface AddTriggerViewController : UIViewController

@property (nonatomic, assign) id<AddItemProtocol> delegate;

@end
