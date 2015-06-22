//
//  ItemsTableViewController.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NUMBER_OF_ROW(n) (n * 2)
#define INDEX_OF_ROW(n) (n - 1) / 2

@interface ItemsTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, strong) NSArray *dataSource;

@end
