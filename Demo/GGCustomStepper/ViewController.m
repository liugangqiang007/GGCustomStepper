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
    
    GGCustomStepper *stepper = [[GGCustomStepper alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    
    // 属性设置
    stepper.autorepeat = YES;  // 长按是否连续改变值，默认YES
    stepper.minimumValue = 10; // 最小值，默认0.0
    stepper.maximumValue = 20; // 最大值，默认100.0
    stepper.stepValue = 2;     // 步幅，默认1.0
    stepper.value = 5;         // 值，默认0.0
    
    
    
    // 外观设置
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
