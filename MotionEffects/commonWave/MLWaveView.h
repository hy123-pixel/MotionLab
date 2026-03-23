//
//  MLWaveView.h
//  AnimationLearn
//
//  Created by yushichao on 16/2/19.
//  Copyright © 2016年 yushichao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MLWaveType) {
    MLWaveTypePulse,
    MLWaveTypeMovedVoice,
    MLWaveTypeVoice,
};

@interface MLWaveView : UIView

- (void)removeFromParentView;

- (void)showWaveViewWithType:(MLWaveType)type;

- (void)setWaveWidth:(CGFloat)width;

@end
