//
//  MLRippleView.m
//  AnimationLearn
//
//  Created by yushichao on 16/2/17.
//  Copyright © 2016年 yushichao. All rights reserved.
//

#import "MLRippleView.h"

@interface MLRippleView ()

@property (nonatomic, strong) UIButton *rippleButton;
@property (nonatomic, strong) NSTimer *rippleTimer;
@property (nonatomic, assign) MLRippleType type;

@end

@implementation MLRippleView

static const CGFloat MLRippleButtonSize = 50.0;
static const CGFloat MLRippleInset = 300.0;
static const NSTimeInterval MLRippleInterval = 1.0;
static const NSTimeInterval MLRippleDuration = 5.0;

- (void)removeFromParentView
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(removeRippleLayer:) object:nil];
    
    if (self.superview) {
        [_rippleButton removeFromSuperview];
        [self closeRippleTimer];
        [self removeAllSubLayers];
        [self removeFromSuperview];
        [self.layer removeAllAnimations];
    }
}

- (void)removeAllSubLayers
{
    for (NSInteger i = 0; [self.layer sublayers].count > 0; i++) {
        [[[self.layer sublayers] firstObject] removeFromSuperlayer];
    }
}

- (void)showWithRippleType:(MLRippleType)type
{
    _type = type;
    [self setUpRippleButton];
    [self closeRippleTimer];
    
    self.rippleTimer = [NSTimer timerWithTimeInterval:MLRippleInterval target:self selector:@selector(addRippleLayer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_rippleTimer forMode:NSRunLoopCommonModes];
}

- (void)setUpRippleButton
{
    if (!_rippleButton) {
        _rippleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, MLRippleButtonSize, MLRippleButtonSize)];
        [_rippleButton addTarget:self action:@selector(rippleButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rippleButton];
    }
    
    _rippleButton.bounds = CGRectMake(0, 0, MLRippleButtonSize, MLRippleButtonSize);
    _rippleButton.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    _rippleButton.layer.backgroundColor = [UIColor blueColor].CGColor;
    _rippleButton.layer.cornerRadius = MLRippleButtonSize / 2.0;
    _rippleButton.layer.masksToBounds = YES;
    _rippleButton.layer.borderColor = [UIColor yellowColor].CGColor;
    _rippleButton.layer.borderWidth = 2;
}

- (void)rippleButtonTouched:(id)sender
{
    [self closeRippleTimer];
    [self addRippleLayer];
}

- (CGRect)makeEndRect
{
    CGRect endRect = CGRectMake(_rippleButton.frame.origin.x, _rippleButton.frame.origin.y, MLRippleButtonSize, MLRippleButtonSize);
    endRect = CGRectInset(endRect, -MLRippleInset, -MLRippleInset);
    return endRect;
}

- (void)addRippleLayer
{
    CAShapeLayer *rippleLayer = [[CAShapeLayer alloc] init];
    rippleLayer.frame = self.bounds;
    rippleLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:_rippleButton.frame];
    rippleLayer.path = path.CGPath;
    rippleLayer.strokeColor = [UIColor greenColor].CGColor;
    if (MLRippleTypeRing == _type) {
        rippleLayer.lineWidth = 5;
    } else {
        rippleLayer.lineWidth = 1.5;
    }
    
    if (MLRippleTypeLine == _type || MLRippleTypeRing == _type) {
        rippleLayer.fillColor = [UIColor clearColor].CGColor;
    } else if (MLRippleTypeCircle == _type) {
        rippleLayer.fillColor = [UIColor greenColor].CGColor;
    } else if (MLRippleTypeMixed == _type) {
        rippleLayer.fillColor = [UIColor grayColor].CGColor;
    }
    
    [self.layer insertSublayer:rippleLayer below:_rippleButton.layer];
    
    //addRippleAnimation
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithOvalInRect:_rippleButton.frame];
    CGRect endRect = CGRectInset([self makeEndRect], -100, -100);
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:endRect];
    
    rippleLayer.path = endPath.CGPath;
    rippleLayer.opacity = 0.0;
    
    CABasicAnimation *rippleAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    rippleAnimation.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    rippleAnimation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    rippleAnimation.duration = MLRippleDuration;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.6];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.duration = MLRippleDuration;
    
    [rippleLayer addAnimation:opacityAnimation forKey:@""];
    [rippleLayer addAnimation:rippleAnimation forKey:@""];
    
    [self performSelector:@selector(removeRippleLayer:) withObject:rippleLayer afterDelay:MLRippleDuration];
}

- (void)removeRippleLayer:(CAShapeLayer *)rippleLayer
{
    [rippleLayer removeFromSuperlayer];
    rippleLayer = nil;
}

- (void)closeRippleTimer
{
    if (_rippleTimer) {
        if ([_rippleTimer isValid]) {
            [_rippleTimer invalidate];
        }
        _rippleTimer = nil;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (_rippleButton) {
        _rippleButton.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    }
}

- (void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self closeRippleTimer];
}

@end
