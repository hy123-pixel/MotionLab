//
//  MotionLabDemoViewController.m
//  AnimationLearn
//
//  Created by yushichao on 16/8/19.
//  Copyright © 2016年 yushichao. All rights reserved.
//

#import "MotionLabDemoViewController.h"

@interface MotionLabDemoViewController ()

@property (nonatomic, strong) NSArray<NSDictionary *> *sectionDataArray;
@end

static NSString * const MLCellDataName     = @"MLCellDataName";
static NSString * const MLCellDataClass    = @"MLCellDataClass";
static NSString * const MLSectionTitle     = @"MLSectionTitle";
static NSString * const MLSectionItems     = @"MLSectionItems";

@implementation MotionLabDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画示例";
    [self initCellDates];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initCellDates
{
    NSArray<NSDictionary *> *recommendedDemos = @[
        @{MLCellDataName:@"波纹动画", MLCellDataClass:@"MLRippleAnimationViewController"},
        @{MLCellDataName:@"圆形加载动画", MLCellDataClass:@"MLCircleLoadAnimationViewController"},
        @{MLCellDataName:@"语音波形动画", MLCellDataClass:@"MLVoiceWaveViewController"},
        @{MLCellDataName:@"水波动画", MLCellDataClass:@"MLWaterWaveViewController"},
        @{MLCellDataName:@"表格刷新动画", MLCellDataClass:@"MLRefreshTableViewController"},
    ];
    
    NSArray<NSDictionary *> *legacyDemos = @[
        @{MLCellDataName:@"[参考实现] 图层动画", MLCellDataClass:@"MLLayerAnimationViewController"},
        @{MLCellDataName:@"[参考实现] 心跳动画", MLCellDataClass:@"MLHeartBeatPulseViewController"},
        @{MLCellDataName:@"[参考实现] 通用波形动画", MLCellDataClass:@"MLWaveAnimationViewController"},
        @{MLCellDataName:@"[参考实现] 蒙版动画", MLCellDataClass:@"MLMaskAnimationViewController"},
        @{MLCellDataName:@"[老旧实现/兼容性一般] 海水波浪动画", MLCellDataClass:@"MLSeaWaterWaveViewController"},
        @{MLCellDataName:@"[视觉实验] 粒子发射动画", MLCellDataClass:@"MLEmitterAnimationViewController"},
        @{MLCellDataName:@"[视觉实验] Replicator 动画", MLCellDataClass:@"MLReplicatorAnimationViewController"},
        @{MLCellDataName:@"[老旧实现/兼容性一般] GIF 加载动画", MLCellDataClass:@"MLLoadGifViewController"},
        @{MLCellDataName:@"[参考实现] 轮播标题动画", MLCellDataClass:@"MLCarouselTitleViewController"},
    ];
    
    self.sectionDataArray = @[
        @{MLSectionTitle:@"推荐使用", MLSectionItems:recommendedDemos},
        @{MLSectionTitle:@"不推荐，仅供参考", MLSectionItems:legacyDemos},
    ];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.sectionDataArray[section][MLSectionItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *cellData = nil;
    NSArray<NSDictionary *> *items = self.sectionDataArray[indexPath.section][MLSectionItems];
    if (items.count > indexPath.row) {
        cellData = items[indexPath.row];
        cell.textLabel.text = [cellData objectForKey:MLCellDataName];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionDataArray[section][MLSectionTitle];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *cellData = nil;
    NSArray<NSDictionary *> *items = self.sectionDataArray[indexPath.section][MLSectionItems];
    if (items.count > indexPath.row) {
        cellData = items[indexPath.row];
        NSString *className = [cellData objectForKey:MLCellDataClass];
        Class class = NSClassFromString(className);
        if ([class isSubclassOfClass:[UIViewController class]]) {
            UIViewController *entranceClassinStance = [[class alloc] init];
            [self.navigationController pushViewController:entranceClassinStance animated:YES];
        }
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
