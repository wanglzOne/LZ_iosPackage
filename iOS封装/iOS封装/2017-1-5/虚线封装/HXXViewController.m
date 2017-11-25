//
//  HXXViewController.m
//  Encapsulation
//
//  Created by mac on 15/12/31.
//  Copyright © 2015年 cdcyi. All rights reserved.
//

#import "HXXViewController.h"
#import "MBProgressHUD.h"

@interface HXXViewController ()
@property (weak, nonatomic) IBOutlet UITextField *jjF;
@property (weak, nonatomic) IBOutlet UITextField *sxcdF;
@property (weak, nonatomic) IBOutlet UITextField *zxcF;
@property (weak, nonatomic) IBOutlet UIView *xxVIew;

@property(nonatomic,strong)UIView *testView;

@end

@implementation HXXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"虚线封装";
    
    
   
    
}

/**
 * 绘制横线
 * lineLength:线宽
 * lineSpacing:线间距
 * drawView:被绘制的视图
 */

- (void)drawDashlineLength:(int)lineLength lineSpacing:(int)lineSpacing  drawView:(UIView*)drawView
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:drawView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(drawView.frame) / 2, CGRectGetHeight(drawView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[UIColor whiteColor].CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(drawView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(drawView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [drawView.layer addSublayer:shapeLayer];
}

- (void)drawDashVerticallineLength:(int)lineLength lineSpacing:(int)lineSpacing  drawView:(UIView*)drawView
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:drawView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(drawView.frame) / 2, CGRectGetHeight(drawView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[UIColor whiteColor].CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(drawView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(drawView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [drawView.layer addSublayer:shapeLayer];
}



- (IBAction)sureBtn:(UIButton *)sender {
    [self.view endEditing:YES];
    if (_jjF.text.length == 0) {
        [self show:@"请输入间距" toView:self.view];
        return;
    }
    if (_sxcdF.text.length == 0) {
        [self show:@"请输入线宽" toView:self.view];
        return;
    }
    if (self.testView) {
        [self.testView removeFromSuperview];
        self.testView = nil;
    }
    //创建虚线
    [self drawDashlineLength:[_jjF.text intValue] lineSpacing:[_sxcdF.text intValue] drawView:self.testView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


-(UIView *)testView{
    if (!_testView) {
        _testView = [[UIView alloc]init];
        _testView.bounds = CGRectMake(0, 0, 300, 10);
        _testView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height / 2.0);
        [self.view addSubview:_testView];
        _testView.backgroundColor = [UIColor grayColor];
    }
    return _testView;
}








- (void)show:(NSString *)text toView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    hud.color = [UIColor lightGrayColor];
    // 设置图片
    //hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeText;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //hud.opacity = 0.0;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}





@end
