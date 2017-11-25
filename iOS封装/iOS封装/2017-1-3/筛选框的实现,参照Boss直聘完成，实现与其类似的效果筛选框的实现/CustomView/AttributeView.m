//
//  SAttributeView.m
//  BootyCall
//
//  Created by mac on 16/8/14.
//  Copyright © 2016年 dazhongdiy. All rights reserved.
//

#import "AttributeView.h"
#import "UIView+SFrame.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width

#define margin 10

@interface AttributeView ()


@end

@implementation AttributeView

/**
 *  返回一个创建好的属性视图,并且带有标题.创建好之后必须设置视图的Y值.
 *
 *  @return attributeView
 */
+ (AttributeView *)attributeViewWithAttributeTexts:(NSArray *)texts{
    int count = 0;
    float btnW = 0;
    AttributeView *view = [[AttributeView alloc]init];
    view.layer.masksToBounds = YES;
    view.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i<texts.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = i;
        [btn addTarget:view action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        NSString *str = texts[i];
        [btn setTitle:str forState:UIControlStateNormal];
        CGSize strsize = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17]}];
        btn.width = strsize.width + margin;
        btn.height = 30;//strsize.height+ margin;
        
        if (i == 0) {
            btn.x = margin;
            btnW += CGRectGetMaxX(btn.frame);
        }
        else{
            btnW += CGRectGetMaxX(btn.frame)+margin;
            if (btnW > SCREEN_W) {
                count++;
                btn.x = margin;
                btnW = CGRectGetMaxX(btn.frame);
            }
            else{
                
                btn.x += btnW - btn.width;
                
            }
        }
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.y += count * (btn.height + margin) + margin + 20;
        btn.layer.cornerRadius = 3.f;
        btn.clipsToBounds = YES;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        [view addSubview:btn];
        if (i == texts.count - 1) {
            view.height = CGRectGetMaxY(btn.frame) + 40;
            view.x = 0;
            view.width = SCREEN_W;
        }
    }
    return view;
}

- (void)btnClick:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(AttributeView:didClickBtn:)]) {
        [_delegate AttributeView:self didClickBtn:sender];
    }
}


@end
