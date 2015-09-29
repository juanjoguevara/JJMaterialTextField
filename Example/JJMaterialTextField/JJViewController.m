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
    JJMaterialTextfield *materialTextField =[[JJMaterialTextfield alloc] initWithFrame:CGRectMake(20, 60, 300, 32)];
    materialTextField.lineColor=[UIColor lightGrayColor];
    materialTextField.errorColor=[UIColor redColor];
    [materialTextField clearButtonTintColor:[UIColor greenColor]];
    [materialTextField enableMaterialPlaceHolder:YES];
    materialTextField.placeholder=@"TextField Example";
    
    [self.view addSubview:materialTextField];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
