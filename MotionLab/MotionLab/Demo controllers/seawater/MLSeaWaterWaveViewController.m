//
//  MLSeaWaterWaveViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 16/8/24.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLSeaWaterWaveViewController.h"
#import "MLSeaGLView.h"

@interface MLSeaWaterWaveViewController ()<UINavigationBarDelegate>

@property (nonatomic, strong) MLSeaGLView *seaGLView;

@end

@implementation MLSeaWaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.seaGLView = [[MLSeaGLView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:_seaGLView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [_seaGLView removeFromParent];
    _seaGLView = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
