//
//  ViewController.m
//  GGCustomStepper
//
//  Created by LGQ on 16/3/2.
//  Copyright © 2016年 LGQ. All rights reserved.
//

#import "ViewController.h"
#import "GGCustomStepper.h"

@interface ViewController ()<GGCustomStepperDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    
    [self stepper1];
    [self stepper2];
    [self stepper3];
}
- (void)stepper1 {
    GGCustomStepper *stepper = [[GGCustomStepper alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    stepper.delegate = self;
    stepper.inputValue = NO;
    [self.view addSubview:stepper];
}

- (void)stepper2 {
    GGCustomStepper *stepper = [[GGCustomStepper alloc] initWithFrame:CGRectMake(100, 200, 100, 25)];
    // 属性设置
    stepper.autorepeat = YES;  // 长按是否连续改变值，默认YES
    stepper.minimumValue = 2;  // 最小值，默认0.0
    stepper.maximumValue = 20; // 最大值，默认100.0
    stepper.stepValue = 2;     // 步幅，默认1.0
    stepper.value = 5;         // 值，默认0.0
    
    // 外观设置
    stepper.textFont = [UIFont systemFontOfSize:15]; // 文本字号
    stepper.textColor = [UIColor blackColor];        // 文本颜色
    stepper.amountLabelScale = 0.5;                  // 文本label宽度与整个控件宽的比例，默认0.4
    stepper.lineWidth = 0;                           // 边线，分割线宽度，默认0.5
    //    stepper.lineColor = [UIColor lightGrayColor];    // 边线，分割线颜色
    
    // 统一设置字号，字体颜色方法
    // [stepper setTextFont:[UIFont systemFontOfSize:15] textColor:[UIColor redColor]];
    
    // 设置按钮背景图
    //    [stepper setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    // 设置按钮纯色背景图
    //    [stepper setBackgroundImageWithColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    // 设置加量按钮图片
    //    [stepper setIncrementImage:[UIImage imageNamed:@"btn_add_d"] forState:UIControlStateNormal];
    //    [stepper setDecrementImage:[UIImage imageNamed:@"btn_jian_d"] forState:UIControlStateNormal];
    
    /** 代理和 block 回调设置一个即可， block 的优先级高于代理方法 **/
    //    stepper.delegate = self;
    stepper.valueChange = ^(double oldValue, double newValue) {
        NSLog(@"block:oldValue--%.0f, newValue--%.0f", oldValue, newValue);
    };
    
    
    [self.view addSubview:stepper];
}

- (void)stepper3 {
    GGCustomStepper *stepper = [[GGCustomStepper alloc] initWithFrame:CGRectMake(100, 300, 100, 25)];
    
    
    // 外观设置
    stepper.backgroundColor = [UIColor clearColor];
    stepper.textFont = [UIFont systemFontOfSize:15]; // 文本字号
    stepper.textColor = [UIColor blackColor];        // 文本颜色
    stepper.lineWidth = 0;                           // 边线，分割线宽度，默认0.5
    
    // 统一设置字号，字体颜色方法
    // [stepper setTextFont:[UIFont systemFontOfSize:15] textColor:[UIColor redColor]];
    
    // 设置按钮背景图
    //    [stepper setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    // 设置按钮纯色背景图
    [stepper setBackgroundImageWithColor:[UIColor clearColor] forState:UIControlStateNormal];
    [stepper setBackgroundImageWithColor:[UIColor clearColor] forState:UIControlStateDisabled];
    
    // 设置加量按钮图片
    [stepper setIncrementImage:[UIImage imageNamed:@"increase_eleme"] forState:UIControlStateNormal];
    [stepper setIncrementImage:[UIImage imageNamed:@"increase_eleme"] forState:UIControlStateDisabled];
    [stepper setDecrementImage:[UIImage imageNamed:@"decrease_eleme"] forState:UIControlStateNormal];
    [stepper setDecrementImage:[UIImage imageNamed:@"decrease_eleme"] forState:UIControlStateDisabled];
    
    /** 代理和 block 回调设置一个即可， block 的优先级高于代理方法 **/
    //    stepper.delegate = self;
    stepper.valueChange = ^(double oldValue, double newValue) {
        NSLog(@"block:oldValue--%.0f, newValue--%.0f", oldValue, newValue);
    };
    
    
    [self.view addSubview:stepper];
}



- (void)customStepper:(GGCustomStepper *)customStepper changeValue:(double)newValue oldValue:(double)oldValue {
    NSLog(@"delegate:oldValue--%.0f, newValue--%.0f", oldValue, newValue);
}



@end
