//
//  MLHeartBeatPulseViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 2016/11/16.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLHeartBeatPulseViewController.h"
#import "MLHeartBeatPulseView.h"

@interface MLHeartBeatPulseViewController ()

@property (nonatomic, strong) MLHeartBeatPulseView *heartBeatPulseView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *pauseButton;

@end

@implementation MLHeartBeatPulseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"心跳动画";
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.heartBeatPulseView];
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.pauseButton];
}

- (void)startHeartBaet:(UIButton *)sender
{
    [_heartBeatPulseView startHeartBeat];
}

- (void)pauseHeartBaet:(UIButton *)sender
{
    [_heartBeatPulseView pauseHeartBeat];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_heartBeatPulseView stopHeartBeat];
    [_heartBeatPulseView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getters

- (MLHeartBeatPulseView *)heartBeatPulseView
{
    if (!_heartBeatPulseView) {
        self.heartBeatPulseView = [[MLHeartBeatPulseView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 300)];
        [_heartBeatPulseView setHeartBeatSpeed:2];
    }
    
    return _heartBeatPulseView;
}

- (UIButton *)startButton
{
    if (!_startButton) {
        self.startButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 450, 80, 40)];
        [_startButton setTitle:@"开始" forState:UIControlStateNormal];
        [_startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startHeartBaet:) forControlEvents:UIControlEventTouchUpInside];
        [_startButton setBackgroundColor:[UIColor blueColor]];
    }
    
    return _startButton;
}

- (UIButton *)pauseButton
{
    if (!_pauseButton) {
        self.pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 450, 80, 40)];
        [_pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
        [_pauseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pauseButton addTarget:self action:@selector(pauseHeartBaet:) forControlEvents:UIControlEventTouchUpInside];
        [_pauseButton setBackgroundColor:[UIColor blueColor]];
    }
    
    return _pauseButton;
}

@end
