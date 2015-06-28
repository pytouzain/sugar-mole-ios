//
//  ScenariosTableViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ScenariosTableViewController.h"
#import "AddScenarioViewController.h"

#import "SpacingTableViewCell.h"
#import "ScenarioItemCell.h"

#import "ScenariosDataModel.h"

@interface ScenariosTableViewController ()

@property (nonatomic, strong) ScenariosDataModel *model;

@end

@implementation ScenariosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellIdentifier = @"scenarioCellIdentifier";
    self.model = [[ScenariosDataModel alloc] init];
}

- (IBAction)backToHomeView:(id)sender {
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
    
    ScenarioItemCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    ScenarioDataModel *scenarioModel = [self.model.scenarios objectAtIndex:INDEX_OF_ROW(indexPath.row)];
    
    cell.image = scenarioModel.image;
    cell.scenarioDescription = scenarioModel.scenarioDescription;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return NUMBER_OF_ROW([self.model.scenarios count]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)
        return 20;
    
    ScenarioDataModel *scenarioModel = [self.model.scenarios objectAtIndex:INDEX_OF_ROW(indexPath.row)];
    
    
    CGRect labelRect = [scenarioModel.scenarioDescription boundingRectWithSize:CGSizeMake(197, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil];
    
    NSLog(@"Width : %f", labelRect.size.width);
    NSLog(@"Height : %f", ceil(labelRect.size.height));
    
    return ceil(labelRect.size.height) + 16;
}

#pragma mark -
#pragma mark ScenariosList protocol methods

- (void)addScenario:(ScenarioDataModel *)scenario {
    [self.model.scenarios addObject:scenario];
    [self.tableView reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AddScenarioViewController *vc = (AddScenarioViewController *)[segue destinationViewController];
    vc.delegate = self;
}


@end
