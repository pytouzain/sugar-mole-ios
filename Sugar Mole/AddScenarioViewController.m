//
//  AddScenarioViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 21/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddScenarioViewController.h"
#import "AddScenarioDataModel.h"

#import "AddScenarioHeaderView.h"

#import "SpacingTableViewCell.h"
#import "AddItemCell.h"

#define kTriggersHeaderViewTag  0
#define kActionsHeaderViewTag   1

#define kTriggersBarTitleColor  [UIColor colorWithRed:0.91 green:0.71 blue:0.19 alpha:1] /*#E7B531*/
#define kActionsBarTitleColor   [UIColor colorWithRed:0.20 green:0.87 blue:0.65 alpha:1] /*#33DDA5*/

@interface AddScenarioViewController ()

@property (nonatomic, strong) AddScenarioDataModel *model;

@end

@implementation AddScenarioViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.model = [[AddScenarioDataModel alloc] init];
        self.cellIdentifier = @"addItemIdentifier";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

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
        return NUMBER_OF_ROW([self.model.triggers count]) + 1;
    }
    return NUMBER_OF_ROW([self.model.actions count]) + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        SpacingTableViewCell *cell = (SpacingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"spacingReuseIdentifier" forIndexPath:indexPath];
        
        [cell.contentView setAlpha:0];
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setUserInteractionEnabled:NO];
        return cell;
    }
    
    AddItemCell *cell = (AddItemCell *)[tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    //[cell configureCellForIndex:INDEX_OF_ROW(indexPath.row)];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)
        return 20;
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 98.;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    AddScenarioHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"AddScenarioHeaderView" owner:self options:nil] firstObject];
    
    if (section == 0) {
        headerView.title = @"TRIGGERS";
        headerView.titleBarColor = kTriggersBarTitleColor;
        headerView.headerViewTag = kTriggersHeaderViewTag;
    }
    else if (section == 1) {
        headerView.title = @"ACTIONS";
        headerView.titleBarColor = kActionsBarTitleColor;
        headerView.headerViewTag = kActionsHeaderViewTag;
    }
    
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
