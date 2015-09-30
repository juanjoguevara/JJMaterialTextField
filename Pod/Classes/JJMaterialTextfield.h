//
//  CustomLabel.h
//  rointe
//
//  Created by Juanjo Guevara on 22/5/15.
//  Copyright (c) 2015 Juanjo Guevara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJMaterialTextfield : UITextField

@property (nonatomic,strong) UIColor *errorColor;
@property (nonatomic,strong) UIColor *lineColor;

-(void)showError;
-(void)hideError;
-(void)enableMaterialPlaceHolder:(BOOL)enable;

@end
