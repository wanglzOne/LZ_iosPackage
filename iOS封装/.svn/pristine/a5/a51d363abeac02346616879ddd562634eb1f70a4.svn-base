//
//  LBCountDownViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBCountDownViewController.h"
#import "GCDtimer.h"

@interface LBCountDownViewController ()
@property (weak, nonatomic) IBOutlet UILabel *GCDLb;

@property (weak, nonatomic) IBOutlet UILabel *timerLb;

@property (weak, nonatomic) IBOutlet UILabel *dispalylinkLb;
@end

@implementation LBCountDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"获取验证码，60s倒计时";
     GCDtimer *gcdtimer=[[GCDtimer alloc]init];
#pragma NSTimer 倒计时
    [gcdtimer timerLb:self.timerLb secondsCountDown:60];
    
#pragma dispalylink 倒计时
    [gcdtimer dispalyLb:self.dispalylinkLb secondsCountDown:60];
    
#pragma DCD 倒计时
    
    [gcdtimer GCDtimerLb:self.GCDLb secondsCountDown:60];
}



@end
