//
//  ActionsTableViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ActionsTypeTableViewController.h"

#import "ActionItemCell.h"
#import "SpacingTableViewCell.h"

#import "ActionsTypeDataModel.h"
#import "ActionTypeDataModel.h"

@interface ActionsTypeTableViewController ()

@property (nonatomic, strong) ActionsTypeDataModel *model;

@end

@implementation ActionsTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[ActionsTypeDataModel alloc] init];
    self.model.identifier = self.cellIdentifier;
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return NUMBER_OF_ROW([self.model.actionsType count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        SpacingTableViewCell *cell = (SpacingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"spacingReuseIdentifier" forIndexPath:indexPath];
        
        [cell.contentView setAlpha:0];
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setUserInteractionEnabled:NO];
        return cell;
    }
    
    ActionItemCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    ActionTypeDataModel *actionTypeModel = [self.model.actionsType objectAtIndex:INDEX_OF_ROW(indexPath.row)];
    
    //cell.imageView.image = actionTypeModel.image;
    cell.descriptionLabel.text = actionTypeModel.descriptionItem;
    [cell setSliderValue:actionTypeModel.value];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)
        return 20;
    return 75;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ActionItemCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
//    
//    [cell configureCellForIndex:indexPath.section];
//    
//    return cell;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 75;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
