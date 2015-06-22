//
//  CompatibilitiesTableViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "CompatibilitiesTableViewController.h"
#import "CompatibilityItemCell.h"

#import "SpacingTableViewCell.h"

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
    if (indexPath.row % 2 == 0) {
        SpacingTableViewCell *cell = (SpacingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"spacingReuseIdentifier" forIndexPath:indexPath];
        
        [cell.contentView setAlpha:0];
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setUserInteractionEnabled:NO];
        return cell;
    }
    
    CompatibilityItemCell *cell;
    
    if (indexPath.row == 1)
        cell = [tableView dequeueReusableCellWithIdentifier:@"compatibleCellIdentifier" forIndexPath:indexPath];
    else if (indexPath.row == 3)
        cell = [tableView dequeueReusableCellWithIdentifier:@"addCompatibilityCellIdentifier" forIndexPath:indexPath];
    
    [cell configureCellForIndex:indexPath.section];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return NUMBER_OF_ROW(2);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0)
        return 20;
    return 50;
}

@end
