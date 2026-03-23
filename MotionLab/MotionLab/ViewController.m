//
//  ViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 16/8/22.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "ViewController.h"
#import "MotionLabDemoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MotionLabDemoViewController *demoMainViewController = [[MotionLabDemoViewController alloc] init];
    [self pushViewController:demoMainViewController animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
