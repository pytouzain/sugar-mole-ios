//
//  ActionsViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "ActionsViewController.h"
#import "ActionsTypeTableViewController.h"

#define LIGHT_BUTTON_TAG    0
#define SECURITY_BUTTON_TAG 1
#define PLUG_BUTTON_TAG     2
#define HEATER_BUTTON_TAG   3
#define AC_BUTTON_TAG       4
#define CAPTOR_BUTTON_TAG   5


@interface ActionsViewController ()

@end

@implementation ActionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backToHomeView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UIButton *touchedButton = (UIButton *)sender;
    ActionsTypeTableViewController *vc = (ActionsTypeTableViewController *)[segue destinationViewController];
    
    switch (touchedButton.tag) {
        case LIGHT_BUTTON_TAG:
            vc.cellIdentifier = @"lightCellIdentifier";
            vc.topButton.titleLabel.text = @"Lumieres";
            vc.topButton.imageView.image = touchedButton.imageView.image;
            break;
            
        case SECURITY_BUTTON_TAG:
            vc.cellIdentifier = @"securityCellIdentifier";
            vc.topButton.titleLabel.text = @"Securites";
            vc.topButton.imageView.image = touchedButton.imageView.image;
            break;
            
        case PLUG_BUTTON_TAG:
            vc.cellIdentifier = @"plugCellIdentifier";
            vc.topButton.titleLabel.text = @"Prises";
            vc.topButton.imageView.image = touchedButton.imageView.image;
            break;
            
        case HEATER_BUTTON_TAG:
            vc.cellIdentifier = @"heaterCellIdentifier";
            vc.topButton.titleLabel.text = @"Chauffages";
            vc.topButton.imageView.image = touchedButton.imageView.image;
            break;
            
        case AC_BUTTON_TAG:
            vc.cellIdentifier = @"ACCellIdentifier";
            vc.topButton.titleLabel.text = @"Climatisations";
            vc.topButton.imageView.image = touchedButton.imageView.image;
            break;
            
        case CAPTOR_BUTTON_TAG:
            vc.cellIdentifier = @"captorCellIdentifier";
            vc.topButton.titleLabel.text = @"Capteurs";
            vc.topButton.imageView.image = touchedButton.imageView.image;
            break;
            
        default:
            break;
    }
}


@end
