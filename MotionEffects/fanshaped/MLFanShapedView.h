//
//  MLFanShapedView.h
//  AnimationLearn
//
//  Created by yushichao on 16/2/18.
//  Copyright © 2016年 yushichao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MLFanShapedShowType) {
    MLFanShapedShowTypeExpand,
    MLFanShapedShowTypeShrink,
};

@interface MLFanShapedView : UIView

- (void)showInParentView:(UIView *)parentView WithType:(MLFanShapedShowType)type;
- (void)setShowType:(MLFanShapedShowType)type;

- (void)removeFromParentView;

@end
