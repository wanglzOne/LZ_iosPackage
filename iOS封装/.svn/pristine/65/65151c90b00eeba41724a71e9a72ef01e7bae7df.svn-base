//
//  DetailController.m
//  下拉刷新动画封装
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据加载动画";
    [self loadedBeingInView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endBeing];
    });
}


@end
