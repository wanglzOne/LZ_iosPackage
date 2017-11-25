//
//  GCDtimer.h
//  倒计时
//
//  Created by sm on 17/1/4.
//  Copyright © 2017年 sm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GCDtimer : NSObject
{
   
    NSTimer *countDownTimer;
    CADisplayLink *myDisplayLink;
    NSString *buttonRepeat;
}
@property(nonatomic , strong)UILabel *GCDtimerLB;//记录GCDlabel
@property(nonatomic , strong)UILabel *dispalyLB;//记录dispalyLB
@property(nonatomic , strong)UILabel *timerLB;//记录timerLB

@property(nonatomic , assign)int secondsCountDowna;//记录GCD时间
@property(nonatomic , assign)int secondsCountDownb;//记录dispalyLB时间
@property(nonatomic , assign)int secondsCountDownc;//记录timerLB时间

@property(nonatomic , strong)NSString *buttonRepeat;

//GCD方法
-(void)GCDtimerLb:(UILabel*)label secondsCountDown:(int)secondsCountDown;
//GCD方法
-(void)dispalyLb:(UILabel*)label secondsCountDown:(int)secondsCountDown;
//GCD方法
-(void)timerLb:(UILabel*)label secondsCountDown:(int)secondsCountDown;

@end
