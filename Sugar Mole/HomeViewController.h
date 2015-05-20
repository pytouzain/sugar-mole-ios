//
//  HomeViewController.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 14/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *decorationView;
@property (weak, nonatomic) IBOutlet UIButton *myScenariosButton;
@property (weak, nonatomic) IBOutlet UIButton *actionsButton;
@property (weak, nonatomic) IBOutlet UIButton *compatibilityButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) IBOutlet UIButton *vocalControlButton;

@property (strong, nonatomic) UIButton *touchedButton;

@end
