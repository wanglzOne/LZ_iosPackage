//
//  MYWViewController.m
//  Encapsulation
//
//  Created by mac on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "MYWViewController.h"
#import "NetErrorView.h"
@interface MYWViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation MYWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"没有网络时的提示页面封装，参照小红书完成";
    [self loadData];
}

-(void)loadData{
    [self loadedBeingInView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endBeing];
        NetErrorView *errView = [self loadNetErrorInView:self.view];
        [errView.refresh addTarget:self action:@selector(clickAginRefresh) forControlEvents:UIControlEventTouchUpInside];
    });
}

-(void)clickAginRefresh{
    [self removeErrorView];
    [self loadData];
}




@end
