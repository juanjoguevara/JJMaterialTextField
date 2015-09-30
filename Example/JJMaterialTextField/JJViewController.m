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
    userNameTextfield.lineColor=[UIColor whiteColor];
    [userNameTextfield enableMaterialPlaceHolder:YES];
    userNameTextfield.errorColor=[UIColor redColor];
    userNameTextfield.tintColor=[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000];
    userNameTextfield.placeholder=@"Username";

    [self.view addSubview:userNameTextfield];
    
    JJMaterialTextfield *passTextField =[[JJMaterialTextfield alloc] initWithFrame:CGRectMake(40, 200, self.view.frame.size.width-80, 34)];
    passTextField.textColor=[UIColor whiteColor];
    passTextField.lineColor=[UIColor whiteColor];
    [passTextField enableMaterialPlaceHolder:YES];
    passTextField.errorColor=[UIColor redColor];
    passTextField.tintColor=[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000];
    passTextField.placeholder=@"Password";
    
    [self.view addSubview:passTextField];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
