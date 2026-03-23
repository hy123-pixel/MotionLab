//
//  MLLoadGifViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 2016/11/8.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLLoadGifViewController.h"
#import "MLGifLoadImage.h"
#import "MLGifLoadImageView.h"

@interface MLLoadGifViewController ()

@property (nonatomic, strong) MLGifLoadImageView *gifImageView;

@end

@implementation MLLoadGifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    MLGifLoadImage *image = (MLGifLoadImage *)[MLGifLoadImage imageNamed:@"sw3.gif"];
    [self.gifImageView setImage:image];
    [self.view addSubview:_gifImageView];
    [_gifImageView startGifAnimatingWithGifRepeatCount:INT32_MAX gifRepeatDelayOffset:0 animatingCompleteCallBack:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_gifImageView stopGifAnimation];
}

- (MLGifLoadImageView *)gifImageView
{
    if (!_gifImageView) {
        self.gifImageView = [[MLGifLoadImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 225)];
        _gifImageView.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
    }
    return _gifImageView;
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
