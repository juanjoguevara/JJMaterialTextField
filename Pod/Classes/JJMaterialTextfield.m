//
//  CustomLabel.m
//  rointe
//
//  Created by Juanjo Guevara on 22/5/15.
//  Copyright (c) 2015 Juanjo Guevara. All rights reserved.
//

#import "JJMaterialTextfield.h"

@interface JJMaterialTextfield ()
{
    UIView *line;
    UILabel *placeHolderLabel;
    BOOL showError;
}
@end

@implementation JJMaterialTextfield
@synthesize errorColor,lineColor;

#define DEFAULT_ALPHA_LINE 0.8

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self commonInit];
    
}

- (void)commonInit
{
    lineColor = [UIColor lightGrayColor];
    errorColor = [UIColor colorWithRed:0.910 green:0.329 blue:0.271 alpha:1.000]; // FLAT RED COLOR
    line = [[UIView alloc] init];
    line.backgroundColor = [lineColor colorWithAlphaComponent:DEFAULT_ALPHA_LINE];
    [self addSubview:line];
    self.clipsToBounds = NO;
    [self setEnableMaterialPlaceHolder:self.enableMaterialPlaceHolder];
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textFieldDidChange:self];
}

- (IBAction)textFieldDidChange:(id)sender
{
    if (self.enableMaterialPlaceHolder) {
        
        if (!self.text || self.text.length > 0) {
            placeHolderLabel.alpha = 1;
            self.attributedPlaceholder = nil;
        }
//        else {
//            self.attributedPlaceholder = nil;
//        }
        
        CGFloat duration = 0.5;
        CGFloat delay = 0;
        CGFloat damping = 0.6;
        CGFloat velocity = 1;
        
        [UIView animateWithDuration:duration
                              delay:delay
             usingSpringWithDamping:damping
              initialSpringVelocity:velocity
                            options:UIViewAnimationOptionCurveEaseInOut animations:^{

                                if (!self.text || self.text.length <= 0) {
                                    placeHolderLabel.transform = CGAffineTransformIdentity;
                                }
                                else {
                                    placeHolderLabel.transform = CGAffineTransformMakeTranslation(0, -placeHolderLabel.frame.size.height - 5);
                                }
                                
                            }
                         completion:^(BOOL finished) {
                             
                         }];
       
    }
}

-(IBAction)clearAction:(id)sender
{
    self.text = @"";
    [self textFieldDidChange:self];
}

-(void)highlight
{
    
    [UIView animateWithDuration: 0.3 // duración
                          delay: 0 // sin retardo antes de comenzar
                        options: UIViewAnimationOptionCurveEaseInOut //opciones
                     animations:^{
                         
                         if (showError) {
                             line.backgroundColor=errorColor;
                         }
                         else {
                             line.backgroundColor=lineColor;
                         }
                         
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             //finalizacion
                         }
                     }];
    
}

-(void)unhighlight
{
    [UIView animateWithDuration: 0.3 // duración
                          delay: 0 // sin retardo antes de comenzar
                        options: UIViewAnimationOptionCurveEaseInOut //opciones
                     animations:^{
                         
                         if (showError) {
                             line.backgroundColor = errorColor;
                         }
                         else {
                             line.backgroundColor = [lineColor colorWithAlphaComponent:DEFAULT_ALPHA_LINE];
                         }

                         
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             //finalizacion
                         }
                     }];

  }

- (void)setPlaceholderAttributes:(NSDictionary *)placeholderAttributes
{
    _placeholderAttributes = placeholderAttributes;
    [self setPlaceholder:self.placeholder];
}

-(void)setPlaceholder:(NSString *)placeholder
{
    [super setPlaceholder:placeholder];
    
    NSDictionary *atts = @{NSForegroundColorAttributeName: [self.textColor colorWithAlphaComponent:0.8],
                           NSFontAttributeName : [self.font fontWithSize: self.font.pointSize]};
    
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder ?: @"" attributes: self.placeholderAttributes ?: atts];

    [self setEnableMaterialPlaceHolder:self.enableMaterialPlaceHolder];
}

- (void)setEnableMaterialPlaceHolder:(BOOL)enableMaterialPlaceHolder
{
    _enableMaterialPlaceHolder = enableMaterialPlaceHolder;
    
    if (!placeHolderLabel) {
        placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 6, 0, self.frame.size.height)];
        [self addSubview:placeHolderLabel];
    }
    placeHolderLabel.alpha = 0;
    placeHolderLabel.attributedText = self.attributedPlaceholder;
    [placeHolderLabel sizeToFit];
    
}

- (BOOL)becomeFirstResponder
{
    BOOL returnValue = [super becomeFirstResponder];
    
    [self highlight];
    
    return returnValue;
}

- (BOOL)resignFirstResponder
{
    BOOL returnValue = [super resignFirstResponder];
   
    [self unhighlight];
    
    return returnValue;
}

- (void)showError
{
    showError = YES;
    line.backgroundColor = errorColor;
}

- (void)hideError
{
    showError = NO;
    line.backgroundColor = lineColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    line.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
}

@end
