//
//  LBCalculation.h
//  iOS封装
//
//  Created by sm on 17/1/9.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LBCalculation : NSObject
/*
 *简单的文本计算
 ＊text：文本内容
 ＊TextW：文本要适应宽度
 ＊TextH：文本要适应的高度
 ＊attributes：文本的一些属性 如字体等
 */
+ (CGRect)CalculationText:(NSString*)text TextW:(CGFloat)TextW TextH:(CGFloat)TextH attributes:(NSDictionary*)attributesDic;
/*
 *富文本计算
 ＊text：文本内容
 ＊TextW：文本要适应宽度
 ＊TextH：文本要适应的高度
 ＊attributes：文本的一些属性 如字体等
 ＊spacing：行间距
 */
+ (CGRect)CalculationAttributedStringt:(NSString*)AttributedString TextW:(CGFloat)TextW TextH:(CGFloat)TextH attributes:(NSDictionary*)attributesDic spacing:(CGFloat)spacing;

@end
