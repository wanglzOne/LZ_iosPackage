//
//  BaseController.h
//  Encapsulation
//
//  Created by mac on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NetErrorView;
// 1 声明block类型

typedef void(^ErrorBlock)();

@interface BaseController : UIViewController

/**
 *创建加载动画
 */
-(void)loadedBeingInView:(UIView *)inVIew;

/**
 *结束加载动画
 */
-(void)endBeing;

/**
 *网络加载错误提示
 */

-(NetErrorView*)loadNetErrorInView:(UIView *)inView;

-(void)removeErrorView;


@end
