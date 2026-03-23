//
//  MLCircleLoadAnimationViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 16/8/24.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLCircleLoadAnimationViewController.h"
#import "MLCircleLoadAnimationView.h"

@interface MLCircleLoadAnimationViewController ()

@end

@implementation MLCircleLoadAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MLCircleLoadAnimationView *shapeView = [[MLCircleLoadAnimationView alloc] initWithFrame:self.view.bounds];
    UIImage *image = [UIImage imageNamed:@"tree.jpg"];
    shapeView.loadingImage.image = image;
    [self.view addSubview:shapeView];
    [shapeView startLoading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
