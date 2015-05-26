//
//  LoginViewController.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 16/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "LoginViewController.h"
#import "RequestHandler.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@property (weak, nonatomic) IBOutlet UILabel *errorStatusLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signInDidSucceed:) name:@"signInDidSucceed" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signInDidFail:) name:@"signInDidFail" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (IBAction)signInTouched:(id)sender {
     if ([self textFieldsParametersChecking] == YES) {
         [[RequestHandler sharedHandler] signInWithEmail:_emailTextfield.text password:_passwordTextfield.text];
     }
}

- (BOOL)textFieldsParametersChecking
{
    if ([_emailTextfield.text isEqualToString:@""])
    {
        _errorStatusLabel.text = @"Email adress missing";
        return NO;
    }
    else if ([_passwordTextfield.text isEqualToString:@""])
    {
        _errorStatusLabel.text = @"Password missing";
        return NO;
    }
    return YES;
}

- (void)clearTextFields
{
    _emailTextfield.text = @"";
    _passwordTextfield.text = @"";
}

#pragma NSNotification Methods

- (void)signInDidSucceed:(NSNotification *)notification
{
    [self clearTextFields];
    [self performSegueWithIdentifier:@"signInSucceed" sender:nil];
}

- (void)signInDidFail:(NSNotification *)notification
{
    _errorStatusLabel.text = (NSString *)notification.object;
}

#pragma UITextfieldDelegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _errorStatusLabel.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger nextTag = textField.tag + 1;
    
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return NO;
}

@end
