//
//  UITableViewController+MLRefresh.h
//  MotionLabDemo
//
//  Created by yushichao on 2017/1/5.
//  Copyright © 2017年 MMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTableRefreshHeaderView.h"
#import "MLTableRefreshFooterView.h"

@interface UITableViewController (MLRefresh)

//上/下拉刷新
@property (nonatomic, assign) BOOL hasRefreshHeader;
@property (nonatomic, assign) BOOL hasRefreshFooter;

@property (nonatomic, copy) void(^heederRefreshingBlock)(void);
@property (nonatomic, copy) void(^footerRefreshingBlock)(void);

- (void)headerRefreshFinished:(MMSCTRefreshStatus)refreshStatus refreshItemsCount:(NSInteger)itemsCount;
- (void)footerRefreshFinished:(MMSCTRefreshStatus)refreshStatus refreshItemsCount:(NSInteger)itemsCount;

- (void)removeRefreshHeaderViewObservers;
- (void)removeRefreshFooterViewObservers;

@end
