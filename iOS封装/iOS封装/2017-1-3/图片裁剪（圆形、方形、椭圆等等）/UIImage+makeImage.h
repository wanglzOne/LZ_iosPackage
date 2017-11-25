//
//  UIImage+makeImage.h
//  裁剪图片
//
//  Created by sm on 17/1/3.
//  Copyright © 2017年 sm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (makeImage)
//画圆或椭圆
+ (instancetype)circleImageWithName:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
//将图片裁剪成固定大小
+ (instancetype)scaleFromImage:(UIImage *)image size:(CGSize)size;
//将图片裁剪成正方形
+ (instancetype)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize;

@end
