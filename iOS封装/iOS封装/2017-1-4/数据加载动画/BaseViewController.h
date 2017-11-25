//
//  BaseViewController.h
//  下拉刷新动画封装
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


/**
 *创建加载动画
 */
-(void)loadedBeingInView:(UIView *)inVIew;

/**
 *结束加载动画
 */
-(void)endBeing;


@end
