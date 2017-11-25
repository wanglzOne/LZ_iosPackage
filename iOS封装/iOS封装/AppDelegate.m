//
//  AppDelegate.m
//  Encapsulation
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"

@interface AppDelegate ()

@end

static NSString * const kLocalNotificationID = @"kLocalNotificationID";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self iqKeyboardShowOrHide];
    // 设置应用程序的图标右上角的数字
    [application setApplicationIconBadgeNumber:0];
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    // 界面的跳转(针对应用程序被杀死的状态下的跳转)
    // 杀死状态下的，界面跳转并不会执行下面的方法- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification，
    // 所以我们在写本地通知的时候，要在这个与下面方法中写，但要判断，是通过哪种类型通知来打开的
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        // 跳转代码
        UILabel *redView = [[UILabel alloc] init];
        redView.frame = CGRectMake(0, 0, 200, 300);
        redView.numberOfLines = 0;
        redView.font = [UIFont systemFontOfSize:12.0];
        redView.backgroundColor = [UIColor blueColor];
        redView.text = [NSString stringWithFormat:@"%@", launchOptions];
        [self.window.rootViewController.view addSubview:redView];
    }
    
    return YES;
}
- (void)iqKeyboardShowOrHide {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}


-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    // 必须要监听--应用程序在后台的时候进行的跳转
    if (application.applicationState == UIApplicationStateInactive) {
        NSLog(@"进行界面的跳转");
        // 如果在上面的通知方法中设置了一些，可以在这里打印额外信息的内容，就做到监听，也就可以根据额外信息，做出相应的判断
        NSLog(@"%@", notification.userInfo);
        [application setApplicationIconBadgeNumber:0];

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"到此一游" message:notification.alertBody delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:notification.alertAction, nil];
        
        [alert show];
        
        [[UIApplication sharedApplication]cancelAllLocalNotifications];
    }
    
}


@end
