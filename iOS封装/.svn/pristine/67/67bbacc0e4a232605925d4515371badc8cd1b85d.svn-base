//
//  BaseViewController.m
//  下拉刷新动画封装
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "BaseController.h"
#import "MaskView.h"
#import "NetErrorView.h"



@interface BaseController ()

@property(nonatomic,strong)MaskView *maskView; //这里设为全局变量，是为了方便停止动画
@property(nonatomic,strong)NetErrorView *errorView;
@property(nonatomic,copy)ErrorBlock block;

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

//正在加载

-(void)loadedBeingInView:(UIView *)inVIew{
    UIView *view = inVIew ? inVIew : [UIApplication sharedApplication].keyWindow;
    //创建遮罩视图
    self.maskView = [[NSBundle mainBundle] loadNibNamed:@"MaskView" owner:self options:nil].lastObject;
    self.maskView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [view addSubview:self.maskView];
    //循环添加图片
    NSMutableArray *imgs = [@[] mutableCopy];
    for (NSUInteger index = 1; index <= 16; index++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", index]];
        [imgs addObject:image];
    }
    //将序列帧数组赋给UIImageView的animationImages属性
    _maskView.anmationImgView.animationImages = imgs;
    //设置动画时间
    _maskView.anmationImgView.animationDuration = 0.1 * imgs.count;
    //设置动画次数 0 表示无限
    _maskView.anmationImgView.animationRepeatCount = 0;
    //开始播放动画
    [_maskView.anmationImgView startAnimating];
}

//结束加载

-(void)endBeing{
    [_maskView.anmationImgView stopAnimating];
    [_maskView removeFromSuperview];
    self.maskView = nil;
}


-(NetErrorView*)loadNetErrorInView:(UIView *)inView {
    UIView *view = inView ? inView : [UIApplication sharedApplication].keyWindow;
    //创建遮罩视图
    NSLog(@"%@",view);
    view.layer.masksToBounds = YES;
    self.errorView = [[NSBundle mainBundle] loadNibNamed:@"NetErrorView" owner:self options:nil].lastObject;
    self.errorView.frame = view.bounds;
    [view addSubview:self.errorView];
    return _errorView;
}

-(void)removeErrorView{
    [self.errorView removeFromSuperview];
    self.errorView = nil;
}



-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeErrorView];
    [self endBeing];
}




@end
