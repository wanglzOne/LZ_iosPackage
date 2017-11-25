//
//  LBPopupViewViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBPopupViewViewController.h"
#import "LBViewController.h"
#import "LBDefinePresentationController.h"

typedef NS_ENUM (NSInteger,LBPresentDiritor){
    
    LBPresentDiritorUp,//上 默认从0开始
    LBPresentDiritorDown,//下
    LBPresentDiritorLeft,//左
    LBPresentDiritorRight,//右
    LBPresentDiritorMidlle,//中
    
};

// 宏定义当前屏幕的宽度
#define size_width [UIScreen mainScreen].bounds.size.width
// 宏定义当前屏幕的高度
#define size_height [UIScreen mainScreen].bounds.size.height
@interface LBPopupViewViewController ()<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic)CGSize vcSize;//视图位置大小
@property (assign, nonatomic)BOOL ishidecotr;//是否展示视图 No为隐藏
@property (assign, nonatomic)LBPresentDiritor PresentDiritor;

@end

@implementation LBPopupViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"封装弹出视图，上，下，左，右，中间弹出，并附有遮罩层";
}

//上
- (IBAction)upbt:(id)sender {
    
    self.PresentDiritor=LBPresentDiritorUp;
    self.vcSize=CGSizeMake(size_width, 200);
    LBViewController *vc=[[LBViewController alloc]init];
    vc.transitioningDelegate=self;
    vc.modalPresentationStyle=UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
    
}
//下
- (IBAction)downBt:(id)sender {
    
    self.PresentDiritor=LBPresentDiritorDown;
    self.vcSize=CGSizeMake(size_width, 200);
    LBViewController *vc=[[LBViewController alloc]init];
    vc.transitioningDelegate=self;
    vc.modalPresentationStyle=UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
    
}
//左
- (IBAction)leftBt:(id)sender {
    
    self.PresentDiritor=LBPresentDiritorLeft;
    self.vcSize=CGSizeMake(200, size_height);
    LBViewController *vc=[[LBViewController alloc]init];
    vc.transitioningDelegate=self;
    vc.modalPresentationStyle=UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
    
}
//右
- (IBAction)rightBt:(id)sender {
    
    self.PresentDiritor=LBPresentDiritorRight;
    self.vcSize=CGSizeMake(200, size_height);
    LBViewController *vc=[[LBViewController alloc]init];
    vc.transitioningDelegate=self;
    vc.modalPresentationStyle=UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}
//中
- (IBAction)midlleBt:(id)sender {
    
    self.PresentDiritor=LBPresentDiritorMidlle;
    self.vcSize=CGSizeMake(200, 200);
    LBViewController *vc=[[LBViewController alloc]init];
    vc.transitioningDelegate=self;
    vc.modalPresentationStyle=UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    return [[LBDefinePresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    _ishidecotr=YES;
    return self;
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    _ishidecotr=NO;
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5;
    
}

-(void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (_ishidecotr==YES) {
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        if (self.PresentDiritor==LBPresentDiritorUp) {
            toView.frame=CGRectMake(0, -self.vcSize.height, self.vcSize.width, self.vcSize.height);
        }else if (self.PresentDiritor==LBPresentDiritorDown){
            toView.frame=CGRectMake(0, size_height + self.vcSize.height, self.vcSize.width, self.vcSize.height);
        }else if (self.PresentDiritor==LBPresentDiritorLeft){
            toView.frame=CGRectMake(-self.vcSize.width, 0, self.vcSize.width, self.vcSize.height);
        }else if (self.PresentDiritor==LBPresentDiritorRight){
            toView.frame=CGRectMake(size_width + self.vcSize.width, 0, self.vcSize.width, self.vcSize.height);
        }else if (self.PresentDiritor==LBPresentDiritorMidlle){
            toView.frame=CGRectMake((size_width-self.vcSize.width)/2, (size_height-self.vcSize.height)/2, self.vcSize.width, self.vcSize.height);
            toView.alpha = 0;
        }
        [transitionContext.containerView addSubview:toView];
        [UIView animateWithDuration:0.3 animations:^{
            
            if (self.PresentDiritor==LBPresentDiritorUp) {
                toView.frame=CGRectMake(0, 0, self.vcSize.width, self.vcSize.height);
            }else if (self.PresentDiritor==LBPresentDiritorDown){
                toView.frame=CGRectMake(0, size_height - self.vcSize.height, self.vcSize.width, self.vcSize.height);
            }else if (self.PresentDiritor==LBPresentDiritorLeft){
                toView.frame=CGRectMake(0, 0, self.vcSize.width, self.vcSize.height);
            }else if (self.PresentDiritor==LBPresentDiritorRight){
                toView.frame=CGRectMake(size_width - self.vcSize.width, 0, self.vcSize.width, self.vcSize.height);
            }else if (self.PresentDiritor==LBPresentDiritorMidlle){
                toView.alpha = 1;
            }
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES]; //这个必须写,否则程序 认为动画还在执行中,会导致展示完界面后,无法处理用户的点击事件
        }];
    }else{
        
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            if (self.PresentDiritor==LBPresentDiritorUp) {
                fromView.frame=CGRectMake(0, -self.vcSize.height, self.vcSize.width, self.vcSize.height);
            }else if (self.PresentDiritor==LBPresentDiritorDown){
                fromView.frame=CGRectMake(0, size_height + self.vcSize.height, self.vcSize.width, self.vcSize.height);
            }else if (self.PresentDiritor==LBPresentDiritorLeft){
                fromView.frame=CGRectMake(-self.vcSize.width, 0, self.vcSize.width, self.vcSize.height);
            }else if (self.PresentDiritor==LBPresentDiritorRight){
                fromView.frame=CGRectMake(size_width + self.vcSize.width, 0, self.vcSize.width, self.vcSize.height);
            }else if (self.PresentDiritor==LBPresentDiritorMidlle){
                fromView.alpha = 0;
            }
            
        } completion:^(BOOL finished) {
            if (finished) {
                [fromView removeFromSuperview];
                [transitionContext completeTransition:YES]; //这个必须写,否则程序 认为动画还在执行中,会导致展示完界面后,无法处理用户的点击事件
            }
            
        }];
        
    }
    
}


@end
