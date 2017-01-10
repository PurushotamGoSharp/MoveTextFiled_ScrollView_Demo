//
//  ViewController.m
//  scrollLoginDemo
//
//  Created by Jenkins on 06/09/16.
//  Copyright © 2016 srinivas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtUsername;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)action:(id)sender;

- (IBAction)tappedAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *aScrollview;


@property (strong, nonatomic) IBOutlet UIView *activeField;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"All textfiled and button is moving up when keyborad appear and textfield moving down when keyboard hide.");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:)name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:)name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets=UIEdgeInsetsZero;
    self.aScrollview.contentInset = contentInsets;
    self.aScrollview.scrollIndicatorInsets = contentInsets;
}


- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height+92.0, 0.0);
    self.aScrollview
    .contentInset = contentInsets;
    self.aScrollview.scrollIndicatorInsets = contentInsets;
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, _activeField.frame.origin))
    {
        [self.aScrollview scrollRectToVisible:_activeField.frame animated:YES];
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
 //   _txtUsername.text = @"";
 //   _txtPassword.text = @"";
}




- (IBAction)tappedAction:(id)sender {
    
    [_txtUsername resignFirstResponder];
    [_txtPassword resignFirstResponder];
}
- (IBAction)controlAction:(id)sender {
    
 //   [self.view endEditing:YES];
}
@end
