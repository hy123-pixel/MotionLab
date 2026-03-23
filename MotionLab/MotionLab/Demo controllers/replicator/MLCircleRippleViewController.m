//
//  MLCircleRippleViewController.m
//  MotionLabDemo
//
//  Created by 工作号 on 16/8/28.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLCircleRippleViewController.h"
#import "MLCircleRippleView.h"

@interface MLCircleRippleViewController ()

@property (nonatomic, strong) MLCircleRippleView *rippleView;

@end

@implementation MLCircleRippleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.rippleView = [[MLCircleRippleView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _rippleView.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
    [self.view addSubview:_rippleView];
    _rippleView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.4];
    [_rippleView startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
