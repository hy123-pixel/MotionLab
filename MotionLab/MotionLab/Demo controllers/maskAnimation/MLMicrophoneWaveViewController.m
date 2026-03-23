//
//  MLMicrophoneWaveViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 16/8/23.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLMicrophoneWaveViewController.h"
#import "MLMicrophoneWaveView.h"

@interface MLMicrophoneWaveViewController ()

@end

@implementation MLMicrophoneWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    MLMicrophoneWaveView *microphoneWaveView = [[MLMicrophoneWaveView alloc] init];
    [microphoneWaveView showMicrophoneWaveInParentView:self.view withFrame:self.view.bounds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
