# JJMaterialTextField

A subclass of UITextfield based on Material Design in Objective C

[![Version](https://img.shields.io/cocoapods/v/JJMaterialTextField.svg?style=flat)](http://cocoapods.org/pods/JJMaterialTextField)
[![License](https://img.shields.io/cocoapods/l/JJMaterialTextField.svg?style=flat)](http://cocoapods.org/pods/JJMaterialTextField)
[![Platform](https://img.shields.io/cocoapods/p/JJMaterialTextField.svg?style=flat)](http://cocoapods.org/pods/JJMaterialTextField)

![screenshot](http://imgur.com/dQVlPlu.jpg)
[Show Appetize.io DEMO](https://appetize.io/app/4pxj983yx74p19duwf249xpguw?device=iphone5s&scale=75&orientation=portrait&osVersion=9.2)
## Example project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* ARC
* iOS 7

## Installation

JJMaterialTextField is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JJMaterialTextField"
```

## Usage

**Import**

```ObjectiveC

#import "JJMaterialTextField.h"

```
**Initialize textfield and configure**

```ObjectiveC


JJMaterialTextfield *textField =[[JJMaterialTextfield alloc] initWithFrame:CGRectMake(40, 120, self.view.frame.size.width-80, 34)];
textField.textColor=[UIColor whiteColor];
textField.enableMaterialPlaceHolder:YES;
textField.errorColor=[UIColor colorWithRed:0.910 green:0.329 blue:0.271 alpha:1.000]; // FLAT RED COLOR
textField.lineColor=[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000];
textField.tintColor=[UIColor colorWithRed:0.482 green:0.800 blue:1.000 alpha:1.000];
textField.placeholder=@"Username";
[self.view addSubview:textField];

```

**Use placeholder Attributes**
```ObjectiveC

  textField.placeholderAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:20],
                                            NSForegroundColorAttributeName : [[UIColor grayColor] colorWithAlphaComponent:.8]};
                                            
 ```

## Author

Juanjo Guevara, juanjoguevara@gmail.com

## License

JJMaterialTextField is available under the MIT license. See the LICENSE file for more info.
