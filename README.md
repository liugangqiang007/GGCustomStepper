# GGCustomStepper

仿照iOS UIStepper 的计量控件，中间显示 value 值。类似京东/淘宝的商品计数  
  
    
# 概述

![image](https://github.com/251143492/GGCustomStepper/blob/master/GGCustomStepper.png)
使用方式类似于 UIStepper，可定制度高
* 支持键盘输入数值
* 支持设置最大值/最小值
* 支持设置单次加/减的量
* 支持分别自定义加/减按钮各种状态下的图片
* 支持自定义加/减按钮各种状态下的背景图片，可使用图片和纯色
* 支持自定义边框宽度，颜色
* 支持修改字体颜色，字号
* 使用block和代理两种方式回调，block优先级高于代理

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

![image](https://github.com/251143492/GGCustomStepper/blob/master/GGCustomStepper2.jpeg)

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

