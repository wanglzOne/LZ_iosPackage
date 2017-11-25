//
//  LBLocalNotificationViewController.m
//  iOS封装
//
//  Created by sm on 17/1/11.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBLocalNotificationViewController.h"

@interface LBLocalNotificationViewController ()

@end

static NSString * const kLocalNotificationID = @"kLocalNotificationID";

@implementation LBLocalNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"本地推送";
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    if (notification) {
        // 设置通知的提醒时间
        NSDate *currentDate   = [NSDate date];
        notification.timeZone = [NSTimeZone defaultTimeZone]; // 使用本地时区
        notification.fireDate = [currentDate dateByAddingTimeInterval:5.0];
        // 设置重复间隔
        notification.repeatInterval = 0;
        // 设置提醒的文字内容
        notification.alertBody   = @"马上过年了，祝大家新年快乐";
        notification.alertAction = NSLocalizedString(@"买车票", nil);
     // 通知提示音 使用默认的
        notification.soundName= UILocalNotificationDefaultSoundName;
        // 设置应用程序右上角的提醒个数
        notification.applicationIconBadgeNumber++;
        // 设定通知的userInfo，用来标识该通知
        NSMutableDictionary *aUserInfo = [[NSMutableDictionary alloc] init];
        aUserInfo[kLocalNotificationID] = @"LocalNotificationID";
        notification.userInfo = aUserInfo;
        // 将通知添加到系统中
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        //立即触发一个通知
        //[[UIApplication sharedApplication] presentLocalNotificationNow:notification];
        
    }

    
    
}


@end
