//
//  UIImage+makeImage.m
//  裁剪图片
//
//  Created by sm on 17/1/3.
//  Copyright © 2017年 sm. All rights reserved.
//

#import "UIImage+makeImage.h"

@implementation UIImage (makeImage)

+ (instancetype)circleImageWithName:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{

    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillPath(context);
    CGContextSetLineWidth(context, .5);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGRect rect = CGRectMake(0, 0, image.size.width - 0 * 2.0f, image.size.height - 0 * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

+ (instancetype)scaleFromImage:(UIImage *)image size:(CGSize)size{

    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;

}

+ (instancetype)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize{

    CGAffineTransform scaleTransform;
    CGPoint origin;
    
    if (image.size.width > image.size.height) {
        //image原始高度为200，缩放image的高度为400pixels，所以缩放比率为2
        CGFloat scaleRatio = newSize / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        //设置绘制原始图片的画笔坐标为CGPoint(-100, 0)pixels
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    } else {
        CGFloat scaleRatio = newSize / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(0, -(image.size.height - image.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    //创建画板为(400x400)pixels
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将image原始图片(400x200)pixels缩放为(800x400)pixels
    CGContextConcatCTM(context, scaleTransform);
    //origin也会从原始(-100, 0)缩放到(-200, 0)
    [image drawAtPoint:origin];
    
    //获取缩放后剪切的image图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;

}
@end
