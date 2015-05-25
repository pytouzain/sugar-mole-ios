//
//  ViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 14/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "RegisterViewController.h"

#import "RequestHandler.h"

@interface RegisterViewController ()

@property (nonatomic, weak) IBOutlet UITextField *emailTextfield;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextfield;
@property (nonatomic, weak) IBOutlet UITextField *confirmPasswordTextfield;

@property (nonatomic, weak) IBOutlet UILabel *errorStatusLabel;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signUpDidSucceed:) name:@"signUpDidSucceed" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signUpDidSucceed:) name:@"signUpDidFail" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)signUpTouched:(id)sender
{
    if ([self textFieldsParametersChecking] == YES) {
        [[RequestHandler sharedHandler] signUpWithEmail:_emailTextfield.text password:_passwordTextfield.text];
    }
}

- (BOOL)textFieldsParametersChecking
{
    if (_passwordTextfield.text && _confirmPasswordTextfield.text && [_passwordTextfield.text isEqualToString:_confirmPasswordTextfield.text] == NO)
    {
        _errorStatusLabel.text = @"Passwords aren't corresponding";
        return NO;
    }
    return YES;
}

#pragma NSNotification Methods

- (void)signUpDidSucceed:(NSNotification *)notification
{
    
}

- (void)signUpDidFail:(NSNotification *)notification
{
    
}


#pragma UITextfieldDelegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _errorStatusLabel.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
