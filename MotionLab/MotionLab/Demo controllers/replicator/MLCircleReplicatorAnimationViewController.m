//
//  MLCircleReplicatorAnimationViewController.m
//  MotionLabDemo
//
//  Created by 工作号 on 16/8/28.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLCircleReplicatorAnimationViewController.h"
#import "MLMatrixCircleAnimationView.h"

@interface MLCircleReplicatorAnimationViewController ()

@property (nonatomic, strong) MLMatrixCircleAnimationView *matrixCircleView;

@end

@implementation MLCircleReplicatorAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.matrixCircleView = [[MLMatrixCircleAnimationView alloc] initWithFrame:CGRectMake(0, 0, 300, 300) xNum:8 yNum:8];
    _matrixCircleView.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
    
    [self.view addSubview:_matrixCircleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
