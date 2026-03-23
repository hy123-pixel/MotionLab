//
//  MLCarouselTitleViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 2017/2/28.
//  Copyright © 2017年 ML. All rights reserved.
//

#import "MLCarouselTitleViewController.h"
#import "MLCarouselTitleView.h"

@interface MLCarouselTitleViewController ()

@property (nonatomic, strong) MLCarouselTitleView *shortTitleView;
@property (nonatomic, strong) MLCarouselTitleView *longTitleView;

@end

@implementation MLCarouselTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"轮播标题动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.shortTitleView = [[MLCarouselTitleView alloc] initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width - 100 * 2, 40)];
    _shortTitleView.title = @"静态--标题比较短";
    [self.view addSubview:_shortTitleView];
    
    self.longTitleView = [[MLCarouselTitleView alloc] initWithFrame:CGRectMake(100, 200, self.view.bounds.size.width - 100 * 2, 40)];
    _longTitleView.title = @"轮播--标题要长长长长长长长长长长长长长长长长长长长长长";
    [self.view addSubview:_longTitleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
