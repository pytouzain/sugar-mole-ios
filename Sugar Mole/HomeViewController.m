//
//  HomeViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 14/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.initialFrames = [[NSArray alloc] initWithObjects:[NSValue valueWithCGRect:_decorationView.frame],
                                                            [NSValue valueWithCGRect:_myScenariosButton.frame],
                                                            [NSValue valueWithCGRect:_actionsButton.frame],
                                                            [NSValue valueWithCGRect:_compatibilityButton.frame],
                                                            [NSValue valueWithCGRect:_settingsButton.frame],
                                                            [NSValue valueWithCGRect:_vocalControlButton.frame],
                                                            nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)buttonTouched:(id)sender {
    _touchedButton = (UIButton *)sender;
}


#pragma mark - Temporary method

- (IBAction)backToConnexion:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
