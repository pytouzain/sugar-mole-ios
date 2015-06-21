//
//  AddScenarioViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 21/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddScenarioViewController.h"

@interface AddScenarioViewController ()

@end

@implementation AddScenarioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
