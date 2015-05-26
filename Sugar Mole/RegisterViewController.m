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

@property (nonatomic, weak) IBOutlet UIScrollView *container;
@property (nonatomic, strong) UITextField *activeTextField;

@property (nonatomic, assign) CGSize kbSize;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signUpDidSucceed:) name:@"signUpDidSucceed" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signUpDidFail:) name:@"signUpDidFail" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (IBAction)signUpTouched:(id)sender
{
    if ([self textFieldsParametersChecking] == YES) {
        [[RequestHandler sharedHandler] signUpWithEmail:_emailTextfield.text password:_passwordTextfield.text];
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
    else if ([_confirmPasswordTextfield.text isEqualToString:@""])
    {
        _errorStatusLabel.text = @"Please confirm your password";
        return NO;
    }
    else if ([_passwordTextfield.text isEqualToString:_confirmPasswordTextfield.text] == NO)
    {
        _errorStatusLabel.text = @"Passwords aren't corresponding";
        return NO;
    }
    return YES;
}

- (void)clearTextFields
{
    _emailTextfield.text = @"";
    _passwordTextfield.text = @"";
    _confirmPasswordTextfield.text = @"";
}

#pragma NSNotification Methods

- (void)signUpDidSucceed:(NSNotification *)notification
{
    [self clearTextFields];
    [self performSegueWithIdentifier:@"signUpSucceed" sender:nil];
}

- (void)signUpDidFail:(NSNotification *)notification
{
    _errorStatusLabel.text = (NSString *)notification.object;
}

#pragma UIKeyboard notifications methods

- (void)scrollViewsAwayFromKeyBoard
{
    CGRect aRect = self.view.frame;
    aRect.size.height -= _kbSize.height;
    if ((_activeTextField.frame.origin.y + _activeTextField.frame.size.height + 10) > aRect.size.height) {
        [self.container setContentSize:CGSizeMake(self.container.frame.size.width, self.container.frame.size.height + _kbSize.height)];
        [self.container scrollRectToVisible:_activeTextField.frame animated:YES];
    }
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    _kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, _kbSize.height + 10, 0.0);
    _container.contentInset = contentInsets;
    _container.scrollIndicatorInsets = contentInsets;
    
    [self scrollViewsAwayFromKeyBoard];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _container.contentInset = contentInsets;
    _container.scrollIndicatorInsets = contentInsets;
    [self.container setContentSize:CGSizeMake(self.container.frame.size.width, self.container.frame.size.height)];
}

#pragma UITextfieldDelegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _errorStatusLabel.text = @"";
    _activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _activeTextField = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger nextTag = textField.tag + 1;
    
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
        [self scrollViewsAwayFromKeyBoard];
    } else {
        [textField resignFirstResponder];
    }
    return NO;
}

@end
