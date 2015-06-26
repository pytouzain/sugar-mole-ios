//
//  AddTriggerViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 24/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "AddTriggerViewController.h"

@interface AddTriggerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *temperatureButton;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UIButton *humidityButton;

@property (weak, nonatomic) IBOutlet UIButton *inferiorButton;
@property (weak, nonatomic) IBOutlet UIButton *equalButton;
@property (weak, nonatomic) IBOutlet UIButton *superiorButton;

@property (weak, nonatomic) IBOutlet UISlider *valueSlider;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@end

@implementation AddTriggerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backToHome:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)triggerTypeButtonTouched:(UIButton *)sender {
    if (sender == _temperatureButton) {
        [self changeState:!_temperatureButton.tag forButton:_temperatureButton];
        [self changeState:NO forButton:_timeButton];
        [self changeState:NO forButton:_humidityButton];
    }
    else if (sender == _timeButton) {
        [self changeState:NO forButton:_temperatureButton];
        [self changeState:!_timeButton.tag forButton:_timeButton];
        [self changeState:NO forButton:_humidityButton];
    }
    else if (sender == _humidityButton) {
        [self changeState:NO forButton:_temperatureButton];
        [self changeState:NO forButton:_timeButton];
        [self changeState:!_humidityButton.tag forButton:_humidityButton];
    }
}

- (IBAction)detailButtonTouched:(UIButton *)sender {
    if (sender == _inferiorButton) {
        [self changeState:!_inferiorButton.tag forButton:_inferiorButton];
        [self changeState:NO forButton:_equalButton];
        [self changeState:NO forButton:_superiorButton];
    }
    else if (sender == _equalButton) {
        [self changeState:NO forButton:_inferiorButton];
        [self changeState:!_equalButton.tag forButton:_equalButton];
        [self changeState:NO forButton:_superiorButton];
    }
    else if (sender == _superiorButton) {
        [self changeState:NO forButton:_inferiorButton];
        [self changeState:NO forButton:_equalButton];
        [self changeState:!_superiorButton.tag forButton:_superiorButton];
    }
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    int value = sender.value;
    int hours = value / 6;
    int minutes = hours > 0 ? (value % (hours * 6)) * 10 : value * 10;
    
    _testLabel.text = [NSString stringWithFormat:@"%d", hours];
    _valueLabel.text = [NSString stringWithFormat:@"%d", minutes];
}

- (void)changeState:(BOOL)state forButton:(UIButton *)button {
    button.backgroundColor = state ? [UIColor lightGrayColor] : [UIColor whiteColor];
    button.tag = state;
}

- (void)adaptToTemperature {
    
}

- (void)adaptToTime {
    
}

- (void)adaptToHumidity {
    
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
