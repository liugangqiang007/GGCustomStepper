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
