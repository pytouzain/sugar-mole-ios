//
//  VocalControlViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 24/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "VocalControlViewController.h"

@interface VocalControlViewController ()

@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@property (weak, nonatomic) IBOutlet UIButton *vocalControlButton;

@end

@implementation VocalControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _vocalControlButton.layer.masksToBounds = YES;
    _vocalControlButton.layer.cornerRadius = _vocalControlButton.frame.size.height / 2.f;
    _vocalControlButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _vocalControlButton.layer.borderWidth = 8.f;
}

- (IBAction)vocalControlButtonTouched:(id)sender {
    _instructionLabel.text = @"Listening...";
}

- (IBAction)backToHomeView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
