//
//  SettingsViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 14/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

@end
