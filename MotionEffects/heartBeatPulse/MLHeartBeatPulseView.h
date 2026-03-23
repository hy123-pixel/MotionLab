//
//  MLHeartBeatPulseView.h
//  MotionLabDemo
//
//  Created by yushichao on 2016/11/8.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLHeartBeatPulseView : UIView

- (void)startHeartBeat;

- (void)pauseHeartBeat;

- (void)stopHeartBeat;

- (void)setHeartBeatSpeed:(NSInteger)speed;

@end
