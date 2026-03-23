//
//  MLCarouselTitleView.h
//  MotionLabDemo
//
//  Created by yushichao on 2016/12/22.
//  Copyright © 2016年 MMS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MLCarouselTitleViewTappedBlock)(void);

@interface MLCarouselTitleView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, copy) MLCarouselTitleViewTappedBlock tappedBlock;

@end
