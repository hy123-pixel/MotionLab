//
//  MLTableRefreshCurveView.m
//  MotionLabDemo
//
//  Created by yushichao on 2017/1/18.
//  Copyright © 2017年 MMS. All rights reserved.
//

#import "MLTableRefreshCurveView.h"
#import "MLTableRefreshCurveLayer.h"

@interface MLTableRefreshCurveView()

@property (nonatomic,strong)MLTableRefreshCurveLayer *curveLayer;

@end

@implementation MLTableRefreshCurveView


+ (Class)layerClass
{
    return [MLTableRefreshCurveLayer class];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)resetData
{
    [self.curveLayer resetData];
}

-(void)setProgress:(CGFloat)progress
{
    self.curveLayer.progress = progress;
    [self.curveLayer setNeedsDisplay];
}

- (void)showInRotateLinePath
{
    [self.curveLayer showInRotateLinePath];
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.curveLayer = [MLTableRefreshCurveLayer layer];
    self.curveLayer.frame = self.bounds;
    self.curveLayer.contentsScale = [UIScreen mainScreen].scale;
    self.curveLayer.progress = 0.0f;
    [self.curveLayer setNeedsDisplay];
    [self.layer addSublayer:self.curveLayer];
    
}


@end


