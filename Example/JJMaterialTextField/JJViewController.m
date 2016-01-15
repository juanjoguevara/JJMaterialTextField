//
//  JJViewController.m
//  JJMaterialTextField
//
//  Created by Juanjo Guevara on 09/29/2015.
//  Copyright (c) 2015 Juanjo Guevara. All rights reserved.
//

#import "JJViewController.h"

@interface JJViewController ()

@end

@implementation JJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    JJMaterialTextfield *userNameTextfield =[[JJMaterialTextfield alloc] initWithFrame:CGRectMake(40, 120, self.view.frame.size.width-80, 34)];
    userNameTextfield.textColor=[UIColor whiteColor];
    [userNameTextfield enableMaterialPlaceHolder:YES];
    userNameTextfield.errorColor=[UIColor colorWithRed:0.910 green:0.329 blue:0.271 alpha:1.000]; // FLAT RED COLOR
    userNameTextfield.lineColor=[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000];
    userNameTextfield.tintColor=[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000];
    userNameTextfield.placeholder=@"Username";
    userNameTextfield.delegate=self;
    userNameTextfield.returnKeyType=UIReturnKeyNext;
    userNameTextfield.tag=1;
    [self.view addSubview:userNameTextfield];
    
    JJMaterialTextfield *passTextField =[[JJMaterialTextfield alloc] initWithFrame:CGRectMake(40, 200, self.view.frame.size.width-80, 34)];
    passTextField.textColor=[UIColor whiteColor];

    [passTextField enableMaterialPlaceHolder:YES];
    
    passTextField.errorColor=[UIColor colorWithRed:0.910 green:0.329 blue:0.271 alpha:1.000]; // FLAT RED COLOR
    passTextField.lineColor=[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000];
    passTextField.tintColor=[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000];
    passTextField.placeholder=@"Password";
    passTextField.delegate=self;
    passTextField.secureTextEntry=YES;
    passTextField.returnKeyType=UIReturnKeyDone;
    passTextField.tag=2;
    passTextField.font = [UIFont systemFontOfSize:15];
    passTextField.textColor = [UIColor whiteColor];
    passTextField.placeholderAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:20],
                                            NSForegroundColorAttributeName : [[UIColor grayColor] colorWithAlphaComponent:.8]};
    [self.view addSubview:passTextField];
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(40, 300, self.view.frame.size.width-80, 60)];
    [button setTitle:@"Submit" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000]];
    [self.view addSubview:button];

}


-(void)textFieldDidEndEditing:(JJMaterialTextfield *)textField{
    if (textField.text.length==0) {
        [textField showError];
    }else{
        [textField hideError];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    UIView *view = [self.view viewWithTag:textField.tag + 1];
    if (!view)
        [textField resignFirstResponder];
    else
        [view becomeFirstResponder];
    return YES;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
