//
//  MLMaskAnimationViewController.m
//  MotionLabDemo
//
//  Created by yushichao on 16/8/23.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLMaskAnimationViewController.h"

@interface MLMaskAnimationViewController ()

@property (nonatomic, strong) NSMutableArray *cellDataArray;
@end

static NSString * const MLCellDataName     = @"MLCellDataName";
static NSString * const MLCellDataClass    = @"MLCellDataClass";

@implementation MLMaskAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"蒙版动画";
    self.cellDataArray = [NSMutableArray array];
    [self initCellDates];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initCellDates
{
    [_cellDataArray addObject:@{MLCellDataName:@"圆形加载动画", MLCellDataClass:@"MLCircleLoadAnimationViewController"}];
    [_cellDataArray addObject:@{MLCellDataName:@"麦克风波形动画", MLCellDataClass:@"MLMicrophoneWaveViewController"}];
    [_cellDataArray addObject:@{MLCellDataName:@"扇形展开动画", MLCellDataClass:@"MLFanshapedViewController"}];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _cellDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *cellData = nil;
    if (_cellDataArray.count > indexPath.row) {
        cellData = [_cellDataArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [cellData objectForKey:MLCellDataName];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *cellData = nil;
    if (_cellDataArray.count > indexPath.row) {
        cellData = [_cellDataArray objectAtIndex:indexPath.row];
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
