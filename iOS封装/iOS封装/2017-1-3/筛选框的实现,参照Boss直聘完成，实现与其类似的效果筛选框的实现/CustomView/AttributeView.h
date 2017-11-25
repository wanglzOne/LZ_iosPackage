//
//  SAttributeView.h
//  BootyCall
//
//  Created by mac on 16/8/14.
//  Copyright © 2016年 dazhongdiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AttributeView;

@protocol AttributeViewDelegate<NSObject>

@optional

-(void)AttributeView:(AttributeView *)view didClickBtn:(UIButton *)btn;

@end

@interface AttributeView : UIView

@property(nonatomic,assign)id <AttributeViewDelegate>delegate;
/**
 *  返回一个创建好的属性视图,并且带有标题.创建好之后必须设置视图的Y值.
 *
 *  @param texts 属性数组
 *
 *  @return attributeView
 */

+ (AttributeView *)attributeViewWithAttributeTexts:(NSArray *)texts;


@end
