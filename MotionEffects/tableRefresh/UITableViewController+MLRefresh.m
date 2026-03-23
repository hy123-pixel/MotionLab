//
//  MMSCTListViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 2017/1/5.
//  Copyright © 2017年 MMS. All rights reserved.
//

#import "UITableViewController+MLRefresh.h"
#import <objc/runtime.h>

static void *hasRefreshHeaderKey = &hasRefreshHeaderKey;
static void *hasRefreshFooterKey = &hasRefreshFooterKey;
static void *refreshHeaderViewKey = &refreshHeaderViewKey;
static void *refreshFooterViewKey = &refreshFooterViewKey;

//@interface UITableViewController (MLRefresh)

//@property (nonatomic, strong) MLTableRefreshHeaderView *refreshHeaderView;
//@property (nonatomic, strong) MLTableRefreshFooterView *refreshFooterView;

//@end

@implementation UITableViewController (MLRefresh)

#pragma mark - 上/下拉刷新

//- (BOOL)isNavigationBarHidden
//{
//    return YES;
//}

- (void)setHasRefreshHeader:(BOOL)hasRefreshHeader
{
    objc_setAssociatedObject(self, hasRefreshHeaderKey, @(hasRefreshHeader), OBJC_ASSOCIATION_RETAIN);
    
    MLTableRefreshHeaderView *refreshHeaderView = objc_getAssociatedObject(self, refreshHeaderViewKey);
    if (hasRefreshHeader && !refreshHeaderView) {
        refreshHeaderView = [[MLTableRefreshHeaderView alloc] initWithAssociatedScrollView:self.tableView withNavigationBar:!self.navigationController.isNavigationBarHidden];
        objc_setAssociatedObject(self, refreshHeaderViewKey, refreshHeaderView, OBJC_ASSOCIATION_RETAIN);
    } else if (!hasRefreshHeader && refreshHeaderView.superview) {
        [self removeRefreshHeaderViewObservers];
        [refreshHeaderView removeFromSuperview];
        refreshHeaderView = nil;
    }
}

- (BOOL)hasRefreshHeader
{
    BOOL hasRefreshHeader = [objc_getAssociatedObject(self, hasRefreshHeaderKey) boolValue];
    return hasRefreshHeader;
}

- (void)setHeederRefreshingBlock:(void (^)(void))heederRefreshingBlock
{
    MLTableRefreshHeaderView *refreshHeaderView = objc_getAssociatedObject(self, refreshHeaderViewKey);
    [refreshHeaderView addRefreshingBlock:heederRefreshingBlock];
}

- (void)headerRefreshFinished:(MMSCTRefreshStatus)refreshStatus refreshItemsCount:(NSInteger)itemsCount
{
    MLTableRefreshHeaderView *refreshHeaderView = objc_getAssociatedObject(self, refreshHeaderViewKey);
    [refreshHeaderView refreshFinished:refreshStatus refreshItemsCount:itemsCount];
}

- (void)removeRefreshHeaderViewObservers
{
    MLTableRefreshHeaderView *refreshHeaderView = objc_getAssociatedObject(self, refreshHeaderViewKey);
    [refreshHeaderView removeObservers];
}

- (void)setHasRefreshFooter:(BOOL)hasRefreshFooter
{
    objc_setAssociatedObject(self, hasRefreshFooterKey, @(hasRefreshFooter), OBJC_ASSOCIATION_RETAIN);
    
    MLTableRefreshFooterView *refreshFooterView = objc_getAssociatedObject(self, refreshFooterViewKey);
    if (hasRefreshFooter && !refreshFooterView) {
        refreshFooterView = [[MLTableRefreshFooterView alloc] initWithAssociatedScrollView:self.tableView withNavigationBar:!self.navigationController.isNavigationBarHidden];
        objc_setAssociatedObject(self, refreshFooterViewKey, refreshFooterView, OBJC_ASSOCIATION_RETAIN);
    } else if (!hasRefreshFooter && refreshFooterView.superview) {
        [self removeRefreshFooterViewObservers];
        [refreshFooterView removeFromSuperview];
        refreshFooterView = nil;
    }
}

- (BOOL)hasRefreshFooter
{
    BOOL hasRefreshFooter = [objc_getAssociatedObject(self, hasRefreshFooterKey) boolValue];
    return hasRefreshFooter;
}

- (void)setFooterRefreshingBlock:(void (^)(void))footerRefreshingBlock
{
    MLTableRefreshFooterView *refreshFooterView = objc_getAssociatedObject(self, refreshFooterViewKey);
    [refreshFooterView addRefreshingBlock:footerRefreshingBlock];
}

- (void)footerRefreshFinished:(MMSCTRefreshStatus)refreshStatus refreshItemsCount:(NSInteger)itemsCount
{
    MLTableRefreshFooterView *refreshFooterView = objc_getAssociatedObject(self, refreshFooterViewKey);
    [refreshFooterView refreshFinished:refreshStatus refreshItemsCount:itemsCount];
}

- (void)removeRefreshFooterViewObservers
{
    MLTableRefreshFooterView *refreshFooterView = objc_getAssociatedObject(self, refreshFooterViewKey);
    [refreshFooterView removeObservers];
}

@end
