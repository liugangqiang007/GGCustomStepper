# GGCustomStepper

仿照 UIStepper 的计量控件，中间显示 value 值。类似京东淘宝的商品加减控件  
  
    
# 概述

仿照 iOS 的 UIStepper 的计量控件，中间显示 value 值，支持文本输入。类似淘宝京东的商品加减控件 
 
![image](https://github.com/251143492/GGCustomStepper/blob/master/GGCustomStepper.png)

# Usage

先引入头文件：  

	#import "GGCustomStepper.h"

外观设置
	
    stepper.textFont = [UIFont systemFontOfSize:15]; // 文本字号
    stepper.textColor = [UIColor redColor];          // 文本颜色
    stepper.amountLabelScale = 0.4;                  // 文本label宽度与整个控件宽的比例，默认0.4
    stepper.lineColor = [UIColor blueColor];         // 边线，分割线颜色
    stepper.lineWidth = 1;                           // 边线，分割线宽度，默认0.5
    
    // 统一设置字号，字体颜色方法
    // [stepper setTextFont:[UIFont systemFontOfSize:15] textColor:[UIColor redColor]];
    
    // 设置按钮背景图
    [stepper setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    // 设置按钮纯色背景图
    [stepper setBackgroundImageWithColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    // 设置加量按钮图片
    [stepper setIncrementImage:[UIImage imageNamed:@"btn_add_d"] forState:UIControlStateNormal];
    [stepper setDecrementImage:[UIImage imageNamed:@"btn_jian_d"] forState:UIControlStateNormal];

![image](https://github.com/251143492/GGCustomStepper/blob/master/GGCustomStepper2.png)

数值设置

	stepper.autorepeat = YES;  // 长按是否连续改变值，默认YES
    stepper.minimumValue = 10; // 最小值，默认0.0
    stepper.maximumValue = 20; // 最大值，默认100.0
    stepper.stepValue = 2;     // 步幅，默认1.0
    stepper.value = 5;         // 值，默认0.0

代理和 block 回调设置一个即可， block 的优先级高于代理方法

	stepper.delegate = self;
	
	- (void)customStepper:(GGCustomStepper *)customStepper changeValue:(double)newValue oldValue:(double)oldValue {
    NSLog(@"delegate:oldValue--%.0f, newValue--%.0f", oldValue, newValue);
	}
或者

    stepper.valueChange = ^(double oldValue, double newValue) {
        NSLog(@"block:oldValue--%.0f, newValue--%.0f", oldValue, newValue);
    };

