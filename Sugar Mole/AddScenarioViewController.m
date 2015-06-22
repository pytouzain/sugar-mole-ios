//
//  AddScenarioViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 21/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddScenarioViewController.h"
#import "AddScenarioDataModel.h"

@interface AddScenarioViewController ()

@property (nonatomic, strong) AddScenarioDataModel *model;

@end

@implementation AddScenarioViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.model = [[AddScenarioDataModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return NUMBER_OF_ROW([self.model.triggers count]);
    }
    return NUMBER_OF_ROW([self.model.actions count]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //create AddScenario HeaderView
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
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
