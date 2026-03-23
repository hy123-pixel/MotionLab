//
//  MLVoiceWaveViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 16/8/24.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLVoiceWaveViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "MLVoiceWaveView.h"
#import "MLVoiceLoadingCircleView.h"

#import "MLNewVoiceWaveView.h"

@interface MLVoiceWaveViewController ()

@property (nonatomic, strong) AVAudioRecorder *recorder;
@property (nonatomic, strong) MLVoiceWaveView *voiceWaveView;
@property (nonatomic,strong) UIView *voiceWaveParentView;
@property (nonatomic, strong) MLVoiceLoadingCircleView *loadingView;
@property (nonatomic, strong) NSTimer *updateVolumeTimer;
@property (nonatomic, strong) UIButton *voiceWaveShowButton;

@property (nonatomic, strong) MLNewVoiceWaveView *voiceWaveViewNew;
@property (nonatomic,strong) UIView *voiceWaveParentViewNew;
@end

@implementation MLVoiceWaveViewController

- (void)dealloc
{
    [_voiceWaveView removeFromParent];
    [_loadingView stopLoading];
    _voiceWaveView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"语音波形动画";
    
    [self setupRecorder];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view insertSubview:self.voiceWaveParentView atIndex:0];
    [self.voiceWaveView showInParentView:self.voiceWaveParentView];
    [self.voiceWaveView startVoiceWave];
    
    [self.view insertSubview:self.voiceWaveParentViewNew atIndex:1];
    [self.voiceWaveViewNew showInParentView:self.voiceWaveParentViewNew];
    [self.voiceWaveViewNew startVoiceWave];
    
    [[NSRunLoop currentRunLoop] addTimer:self.updateVolumeTimer forMode:NSRunLoopCommonModes];
    
    [self.view addSubview:self.voiceWaveShowButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateVolume:(NSTimer *)timer
{
    [self.recorder updateMeters];
    CGFloat normalizedValue = pow (10, [self.recorder averagePowerForChannel:0] / 20);
    [_voiceWaveView changeVolume:normalizedValue];
    
    [_voiceWaveViewNew changeVolume:normalizedValue];
}

- (void)voiceWaveShowButtonTouched:(UIButton *)sender
{
    static NSInteger status = 1;
    status++;
    if (status % 2 == 0) {
        [_voiceWaveShowButton setTitle:@"显示" forState:UIControlStateNormal];
        [self.voiceWaveView stopVoiceWaveWithShowLoadingViewCallback:^{
            [self.updateVolumeTimer invalidate];
            _updateVolumeTimer = nil;
            [self.loadingView startLoadingInParentView:self.view];
        }];
    } else {
        [_voiceWaveShowButton setTitle:@"隐藏" forState:UIControlStateNormal];
        [self.loadingView stopLoading];
        [self.voiceWaveView showInParentView:self.voiceWaveParentView];
        [self.voiceWaveView startVoiceWave];
        [[NSRunLoop currentRunLoop] addTimer:self.updateVolumeTimer forMode:NSRunLoopCommonModes];
    }
}

-(void)setupRecorder
{
    NSURL *url = [NSURL fileURLWithPath:@"/dev/null"];
    NSDictionary *settings = @{AVSampleRateKey:          [NSNumber numberWithFloat: 44100.0],
                               AVFormatIDKey:            [NSNumber numberWithInt: kAudioFormatAppleLossless],
                               AVNumberOfChannelsKey:    [NSNumber numberWithInt: 2],
                               AVEncoderAudioQualityKey: [NSNumber numberWithInt: AVAudioQualityMin]};
    
    NSError *error;
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
    if(error) {
        NSLog(@"无法创建录音器: %@", error);
        return;
    }
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    if (error) {
        NSLog(@"设置音频会话分类失败: %@", [error description]);
    }
    [self.recorder prepareToRecord];
    [self.recorder setMeteringEnabled:YES];
    [self.recorder record];
}

#pragma mark - getters

- (MLVoiceWaveView *)voiceWaveView
{
    if (!_voiceWaveView) {
        self.voiceWaveView = [[MLVoiceWaveView alloc] init];
    }
    
    return _voiceWaveView;
}

- (UIView *)voiceWaveParentView
{
    if (!_voiceWaveParentView) {
        self.voiceWaveParentView = [[UIView alloc] init];
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _voiceWaveParentView.frame = CGRectMake(0, 0, screenSize.width, 320);
//        _voiceWaveParentView.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
    }
    
    return _voiceWaveParentView;
}

- (MLNewVoiceWaveView *)voiceWaveViewNew
{
    if (!_voiceWaveViewNew) {
        self.voiceWaveViewNew = [[MLNewVoiceWaveView alloc] init];
        [_voiceWaveViewNew setVoiceWaveNumber:6];
    }
    
    return _voiceWaveViewNew;
}

- (UIView *)voiceWaveParentViewNew
{
    if (!_voiceWaveParentViewNew) {
        self.voiceWaveParentViewNew = [[UIView alloc] init];
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _voiceWaveParentViewNew.frame = CGRectMake(0, 330, screenSize.width, 320);
//        _voiceWaveParentViewNew.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
    }
    
    return _voiceWaveParentViewNew;
}

- (MLVoiceLoadingCircleView *)loadingView
{
    if (!_loadingView) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        CGPoint loadViewCenter = CGPointMake(screenSize.width / 2.0, 160);
        self.loadingView = [[MLVoiceLoadingCircleView alloc] initWithCircleRadius:25 center:loadViewCenter];
    }
    
    return _loadingView;
}

- (UIButton *)voiceWaveShowButton
{
    if (!_voiceWaveShowButton) {
        self.voiceWaveShowButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _voiceWaveShowButton.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0 + 200);
        [_voiceWaveShowButton setTitle:@"隐藏" forState:UIControlStateNormal];
        _voiceWaveShowButton.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        [_voiceWaveShowButton addTarget:self action:@selector(voiceWaveShowButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _voiceWaveShowButton;
}

- (NSTimer *)updateVolumeTimer
{
    if (!_updateVolumeTimer) {
        self.updateVolumeTimer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(updateVolume:) userInfo:nil repeats:YES];
    }
    
    return _updateVolumeTimer;
}

@end
