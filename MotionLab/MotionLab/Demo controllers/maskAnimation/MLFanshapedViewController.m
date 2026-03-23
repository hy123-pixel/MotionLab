//
//  MLFanshapedViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 16/8/24.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLFanshapedViewController.h"
#import "MLFanShapedView.h"

@interface MLFanshapedViewController ()

@property (nonatomic, strong) MLFanShapedView *fanshapedView;
@property (nonatomic, strong) UIButton *fanShapedbutton;
@end

@implementation MLFanshapedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扇形展开动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.fanShapedbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    _fanShapedbutton.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0 + 100);
    [_fanShapedbutton setTitle:@"扇形展开" forState:UIControlStateNormal];
    _fanShapedbutton.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    [_fanShapedbutton addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_fanShapedbutton];
    
    [self.fanshapedView showInParentView:self.view WithType:MLFanShapedShowTypeExpand];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonTouched:(UIButton *)sender
{
    static NSInteger type = 0;
    type++;
    if (type % 2 == 0) {
        [_fanShapedbutton setTitle:@"扇形收起" forState:UIControlStateNormal];
    } else {
        [_fanShapedbutton setTitle:@"扇形展开" forState:UIControlStateNormal];
    }
    [self.fanshapedView setShowType:type % 2];
}

- (MLFanShapedView *)fanshapedView
{
    if (!_fanshapedView) {
        self.fanshapedView = [[MLFanShapedView alloc] init];
        _fanshapedView.frame = CGRectMake(0, 0, 300, 150);
        _fanshapedView.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0 - 100);        
    }
    
    return _fanshapedView;
}

@end
