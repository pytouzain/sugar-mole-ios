//
//  CompatibilitiesTableViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "CompatibilitiesTableViewController.h"
#import "CompatibilityItemCell.h"

@interface CompatibilitiesTableViewController ()

@end

@implementation CompatibilitiesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backToHome:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CompatibilityItemCell *cell;
    
    if (indexPath.section == 0)
        cell = [tableView dequeueReusableCellWithIdentifier:@"compatibleCellIdentifier" forIndexPath:indexPath];
    else if (indexPath.section == 1)
        cell = [tableView dequeueReusableCellWithIdentifier:@"addCompatibilityCellIdentifier" forIndexPath:indexPath];
    
    [cell configureCellForIndex:indexPath.section];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

@end
