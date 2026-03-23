//
//  MLRippleAnimationViewController.m
//  AnimationLearn
//
//  Created by yushichao on 16/8/19.
//  Copyright © 2016年 yushichao. All rights reserved.
//

#import "MLRippleAnimationViewController.h"
#import "MLRippleView.h"

@interface MLRippleAnimationViewController ()

@property (nonatomic, strong) MLRippleView *rippleView;

@end

@implementation MLRippleAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"波纹动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *lineRippleButton = [[UIButton alloc] initWithFrame:CGRectMake(20 , 320, 150, 50)];
    [lineRippleButton setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.5]];
    [lineRippleButton setTitle:@"单线波纹" forState:UIControlStateNormal];
    [lineRippleButton addTarget:self action:@selector(lineRippleButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lineRippleButton];
    
    UIButton *ringRippleButton = [[UIButton alloc] initWithFrame:CGRectMake(200 , 320, 150, 50)];
    [ringRippleButton setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.5]];
    [ringRippleButton setTitle:@"圆环波纹" forState:UIControlStateNormal];
    [ringRippleButton addTarget:self action:@selector(ringRippleButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ringRippleButton];
    
    UIButton *circleRippleButton = [[UIButton alloc] initWithFrame:CGRectMake(20 , 400, 150, 50)];
    [circleRippleButton setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.5]];
    [circleRippleButton setTitle:@"圆形波纹" forState:UIControlStateNormal];
    [circleRippleButton addTarget:self action:@selector(circleRippleButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:circleRippleButton];
    
    UIButton *mixedRippleButton = [[UIButton alloc] initWithFrame:CGRectMake(200 , 400, 150, 50)];
    [mixedRippleButton setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.5]];
    [mixedRippleButton setTitle:@"混合波纹" forState:UIControlStateNormal];
    [mixedRippleButton addTarget:self action:@selector(mixedRippleButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mixedRippleButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)lineRippleButtonTouched:(id)sender
{
    [self removeSubViews];
    [self.view addSubview:self.rippleView];
    [_rippleView showWithRippleType:MLRippleTypeLine];
}
- (void)ringRippleButtonTouched:(id)sender
{
    [self removeSubViews];
    [self.view addSubview:self.rippleView];
    [_rippleView showWithRippleType:MLRippleTypeRing];
}
- (void)circleRippleButtonTouched:(id)sender
{
    [self removeSubViews];
    [self.view addSubview:self.rippleView];
    [_rippleView showWithRippleType:MLRippleTypeCircle];
}
- (void)mixedRippleButtonTouched:(id)sender
{
    [self removeSubViews];
    [self.view addSubview:self.rippleView];
    [_rippleView showWithRippleType:MLRippleTypeMixed];
}

- (void)removeSubViews
{
    if (_rippleView.superview == self.view) {
        [_rippleView removeFromParentView];
    }
}

- (MLRippleView *)rippleView
{
    if (!_rippleView) {
        self.rippleView = [[MLRippleView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    }
    
    return _rippleView;
}

@end
