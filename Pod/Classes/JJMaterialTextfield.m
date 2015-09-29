//
//  CustomLabel.m
//  rointe
//
//  Created by Juanjo Guevara on 22/5/15.
//  Copyright (c) 2015 Juanjo Guevara. All rights reserved.
//

#import "JJMaterialTextfield.h"
@interface JJMaterialTextfield (){
    
    UIView *line;
    UIButton *clearButton;
    UILabel *movedPlaceHolderLabel;
    BOOL enablePlaceHolder;
    NSAttributedString *_attString;

}
@end
@implementation JJMaterialTextfield
@synthesize errorColor,lineColor;

#define DEFAULT_ALPHA_LINE 0.6

-(void)commonInit{
    lineColor=[UIColor lightGrayColor];
    line=[[UIView alloc] init];
    line.backgroundColor=[lineColor colorWithAlphaComponent:DEFAULT_ALPHA_LINE];
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearButton setImage:[[UIImage imageNamed:@"edit_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    [clearButton setFrame:CGRectMake(0.0f, 0.0f, 15.0f, 15.0f)]; // Required for iOS7
    [clearButton addTarget:self action:@selector(clearbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.rightView = clearButton;
    self.rightViewMode = UITextFieldViewModeWhileEditing;
    [self addSubview:line];
    self.clipsToBounds=NO;
    [self enableMaterialPlaceHolder:NO];
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}
-(void)setText:(NSString *)text{
    [super setText:text];
    [self textFieldDidChange:self];
    
}
-(IBAction)textFieldDidChange:(id)sender{

    if (enablePlaceHolder) {
        if (self.text.length>0) {
            movedPlaceHolderLabel.alpha=1;
        }else{
            self.attributedPlaceholder=nil;
        }
        
        
        [UIView animateWithDuration: 0.3 // duración
                              delay: 0 // sin retardo antes de comenzar
                            options: UIViewAnimationOptionCurveEaseInOut //opciones
                         animations:^{
                             
                             //animacion
                             if (self.text.length<=0) {
                                 movedPlaceHolderLabel.transform=CGAffineTransformIdentity;
                             }else{
                                 movedPlaceHolderLabel.transform=CGAffineTransformMakeTranslation(0, -movedPlaceHolderLabel.frame.size.height);
                             }
                         }
                         completion:^(BOOL finished) {
                             self.attributedPlaceholder=movedPlaceHolderLabel.attributedText;
                             if (self.text.length<=0) {
                                 movedPlaceHolderLabel.alpha=0;
                             }
                         }];

    }
   }
-(void)clearButtonTintColor:(UIColor*)clearButtonTintColor{
    
    clearButton.tintColor=clearButtonTintColor;
}
-(IBAction)clearbuttonAction:(id)sender{
    self.text=@"";
    [self textFieldDidChange:self];
}
-(void)highlight{
    
    [UIView animateWithDuration: 0.3 // duración
                          delay: 0 // sin retardo antes de comenzar
                        options: UIViewAnimationOptionCurveEaseInOut //opciones
                     animations:^{
                         
                        line.backgroundColor=lineColor;
                         
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             //finalizacion
                         }
                     }];
    
}

-(void)unhighlight{
    [UIView animateWithDuration: 0.3 // duración
                          delay: 0 // sin retardo antes de comenzar
                        options: UIViewAnimationOptionCurveEaseInOut //opciones
                     animations:^{
                         
                         line.backgroundColor=[lineColor colorWithAlphaComponent:DEFAULT_ALPHA_LINE];

                         
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             //finalizacion
                         }
                     }];

  }

-(void)setPlaceholder:(NSString *)placeholder{
    [super setPlaceholder:placeholder];
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: [self.textColor colorWithAlphaComponent:0.5]}];
    [self enableMaterialPlaceHolder:enablePlaceHolder];
    if (_attString.length==0) {
           _attString=self.attributedPlaceholder;
    }
 
}
-(void)enableMaterialPlaceHolder:(BOOL)enable{
    if (!movedPlaceHolderLabel) {
          movedPlaceHolderLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 6, 0, self.frame.size.height)];
         [self addSubview:movedPlaceHolderLabel];
    }
    enablePlaceHolder=enable;
    movedPlaceHolderLabel.alpha=0;
    movedPlaceHolderLabel.attributedText=self.attributedPlaceholder;
    [movedPlaceHolderLabel sizeToFit];
   
    
}

- (BOOL)becomeFirstResponder
{
    BOOL returnValue = [super becomeFirstResponder];
    
        [self highlight];
    
    return returnValue;
}

-(BOOL)resignFirstResponder{
    BOOL returnValue = [super resignFirstResponder];
   
    [self unhighlight];
    
    return returnValue;
}

-(void)showError{
    if (errorColor) {
        line.backgroundColor=errorColor;
    }else{
        line.backgroundColor=[lineColor colorWithAlphaComponent:DEFAULT_ALPHA_LINE];
    }
}

-(void)hideError{
    line.backgroundColor=lineColor;
}

-(id)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
   [self commonInit];
  
}

-(void)layoutSubviews{
    [super layoutSubviews];
    line.frame=CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
}

@end
