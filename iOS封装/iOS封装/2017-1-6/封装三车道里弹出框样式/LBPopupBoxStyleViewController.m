//
//  LBPopupBoxStyleViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/6.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBPopupBoxStyleViewController.h"
#import "iOS封装-Swift.h"

@interface LBPopupBoxStyleViewController ()

@end

@implementation LBPopupBoxStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"封装三车道里弹出框样式";
    //例子
    [LBshowMessage showMydefineMessageWithTagert:self.view message:@"什么什么" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
    
}



@end
