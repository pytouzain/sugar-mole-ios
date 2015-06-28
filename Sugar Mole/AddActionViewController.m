//
//  AddActionViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 25/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddActionViewController.h"

#import "AddActionHeaderView.h"

#import "SpacingTableViewCell.h"
#import "AddActionCell.h"

#import "AddActionDataModel.h"
#import "ActionDataModel.h"

@interface AddActionViewController ()

@property (nonatomic, strong) AddActionDataModel *model;
@property (nonatomic, strong) NSMutableArray *selectedActions;

@end

@implementation AddActionViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.model = [[AddActionDataModel alloc] init];
        self.cellIdentifier = @"addActionIdentifier";
        self.selectedActions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addButtonTouched:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(addActionsFromArray:)]) {
        [_delegate addActionsFromArray:self.selectedActions];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.model.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return NUMBER_OF_ROW([[self.model.actions objectForKey:[self.model.sections objectAtIndex:section]] count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        SpacingTableViewCell *cell = (SpacingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"spacingReuseIdentifier" forIndexPath:indexPath];
        
        [cell.contentView setAlpha:0];
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setUserInteractionEnabled:NO];
        return cell;
    }
    
    AddActionCell *cell = (AddActionCell *)[tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    ActionDataModel *actionModel = [[self.model.actions objectForKey:[self.model.sections objectAtIndex:indexPath.section]] objectAtIndex:INDEX_OF_ROW(indexPath.row)];
    
    cell.image = actionModel.image;
    cell.descriptionItem = actionModel.descriptionItem;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ActionDataModel *actionModel = [[self.model.actions objectForKey:[self.model.sections objectAtIndex:indexPath.section]] objectAtIndex:INDEX_OF_ROW(indexPath.row)];
    [_selectedActions addObject:actionModel];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ActionDataModel *actionModel = [[self.model.actions objectForKey:[self.model.sections objectAtIndex:indexPath.section]] objectAtIndex:INDEX_OF_ROW(indexPath.row)];
    [_selectedActions removeObject:actionModel];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    AddActionHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"AddActionHeaderView" owner:self options:nil] firstObject];
    
    headerView.title = [self.model.sections objectAtIndex:section];
    headerView.titleBarColor = [self.model.barColors objectForKey:[self.model.sections objectAtIndex:section]];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)
        return 5.f;
    return 50.f;
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
