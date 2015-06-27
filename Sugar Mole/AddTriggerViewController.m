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

@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (weak, nonatomic) IBOutlet UISlider *valueSlider;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@end

@implementation AddTriggerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)backToHome:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)triggerTypeButtonTouched:(UIButton *)sender {
    if (sender == _temperatureButton) {
        [self adaptToTemperature];
        [self changeState:!_temperatureButton.tag forButton:_temperatureButton];
        [self changeState:NO forButton:_timeButton];
        [self changeState:NO forButton:_humidityButton];
    }
    else if (sender == _timeButton) {
        [self adaptToTime];
        [self changeState:NO forButton:_temperatureButton];
        [self changeState:!_timeButton.tag forButton:_timeButton];
        [self changeState:NO forButton:_humidityButton];
    }
    else if (sender == _humidityButton) {
        [self adaptToHumidity];
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
    if (_temperatureButton.tag) {
        _valueLabel.text = [NSString stringWithFormat:@"%d°C", (int)_valueSlider.value];
    }
    else if (_timeButton.tag) {
        _valueLabel.text = [self transformValueToTime:sender.value];
    }
    else if (_humidityButton.tag) {
        _valueLabel.text = [NSString stringWithFormat:@"%02d%%", (int)_valueSlider.value];
    }
}

- (NSString *)transformValueToTime:(int)value {
    int hours = value / 6;
    int minutes = hours > 0 ? (value % (hours * 6)) * 10 : value * 10;
    
    return [NSString stringWithFormat:@"%02d : %02d", hours, minutes];
}

- (void)changeState:(BOOL)state forButton:(UIButton *)button {
    button.backgroundColor = state ? [UIColor lightGrayColor] : [UIColor whiteColor];
    button.tag = state;
}

- (void)adaptToTemperature {
    CGRect sliderFrame = _valueSlider.frame;
    sliderFrame.size.width = 236;
    _valueSlider.frame = sliderFrame;
    
    CGRect labelFrame = _valueLabel.frame;
    labelFrame.size.width = 48;
    labelFrame.origin.x = _valueSlider.frame.origin.x + _valueSlider.frame.size.width + 8;
    _valueLabel.frame = labelFrame;
    
    _valueSlider.minimumValue = -40;
    _valueSlider.maximumValue = 60;
    _valueSlider.value = 20;
    _valueLabel.text = [NSString stringWithFormat:@"%d°C", (int)_valueSlider.value];
}

- (void)adaptToTime {
    CGRect sliderFrame = _valueSlider.frame;
    sliderFrame.size.width = 224;
    _valueSlider.frame = sliderFrame;
    
    CGRect labelFrame = _valueLabel.frame;
    labelFrame.size.width = 60;
    labelFrame.origin.x = _valueSlider.frame.origin.x + _valueSlider.frame.size.width + 8;
    _valueLabel.frame = labelFrame;
    
    _valueSlider.minimumValue = 0;
    _valueSlider.maximumValue = 144;
    _valueSlider.value = 72;
    _valueLabel.text = [self transformValueToTime:_valueSlider.value];
}

- (void)adaptToHumidity {
    CGRect sliderFrame = _valueSlider.frame;
    sliderFrame.size.width = 236;
    _valueSlider.frame = sliderFrame;
    
    CGRect labelFrame = _valueLabel.frame;
    labelFrame.size.width = 40;
    labelFrame.origin.x = _valueSlider.frame.origin.x + _valueSlider.frame.size.width + 8;
    _valueLabel.frame = labelFrame;
    
    _valueSlider.minimumValue = 0;
    _valueSlider.maximumValue = 100;
    _valueSlider.value = 50;
    _valueLabel.text = [NSString stringWithFormat:@"%02d%%", (int)_valueSlider.value];
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
