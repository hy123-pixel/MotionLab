//
//  MLWaveAnimationViewController.m
//  AnimationLearn
//
//  Created by yushichao on 16/8/19.
//  Copyright © 2016年 yushichao. All rights reserved.
//

#import "MLWaveAnimationViewController.h"
#import "MLWaveView.h"

@interface MLWaveAnimationViewController ()

@property (nonatomic, strong) MLWaveView *waveView;

@end

@implementation MLWaveAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"通用波形动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *pusleButton = [[UIButton alloc] initWithFrame:CGRectMake(20 , 320, 150, 50)];
    [pusleButton setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.5]];
    [pusleButton setTitle:@"脉冲效果" forState:UIControlStateNormal];
    [pusleButton addTarget:self action:@selector(pusleButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pusleButton];
    
    UIButton *waveButton = [[UIButton alloc] initWithFrame:CGRectMake(200 , 320, 150, 50)];
    [waveButton setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.5]];
    [waveButton setTitle:@"语音波形" forState:UIControlStateNormal];
    [waveButton addTarget:self action:@selector(waveButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:waveButton];
    
    UIButton *movedWaveButton = [[UIButton alloc] initWithFrame:CGRectMake(20 , 400, 150, 50)];
    [movedWaveButton setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.5]];
    [movedWaveButton setTitle:@"移动波形" forState:UIControlStateNormal];
    [movedWaveButton addTarget:self action:@selector(movedWaveButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:movedWaveButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pusleButtonTouched:(id)sender
{
    [self removeSubViews];
    [self.view addSubview:self.waveView];
    [_waveView showWaveViewWithType:MLWaveTypePulse];
}

- (void)waveButtonTouched:(id)sender
{
    [self removeSubViews];
    [self.view addSubview:self.waveView];
    [_waveView showWaveViewWithType:MLWaveTypeVoice];
}

- (void)movedWaveButtonTouched:(id)sender
{
    [self removeSubViews];
    [self.view addSubview:self.waveView];
    [_waveView showWaveViewWithType:MLWaveTypeMovedVoice];
}

- (void)removeSubViews
{
    if (_waveView.superview == self.view) {
        [_waveView removeFromParentView];
    }
}

- (MLWaveView *)waveView
{
    if (!_waveView) {
        self.waveView = [[MLWaveView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
        _waveView.backgroundColor = [UIColor grayColor];
    }
    
    return _waveView;
}

@end
