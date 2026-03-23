//
//  MLReplicatorAnimationViewController.m
//  MotionLabDemo
//
//  Created by 工作号 on 16/8/28.
//  Copyright © 2016年 MotionLab. All rights reserved.
//

#import "MLReplicatorAnimationViewController.h"

@interface MLReplicatorAnimationViewController ()

@property (nonatomic, strong) NSMutableArray *cellDataArray;
@end

static NSString * const MLCellDataName     = @"MLCellDataName";
static NSString * const MLCellDataClass    = @"MLCellDataClass";

@implementation MLReplicatorAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"复制器动画";
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
    [_cellDataArray addObject:@{MLCellDataName:@"矩阵复制动画", MLCellDataClass:@"MLCircleReplicatorAnimationViewController"}];
    [_cellDataArray addObject:@{MLCellDataName:@"波纹复制动画", MLCellDataClass:@"MLCircleRippleViewController"}];
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
