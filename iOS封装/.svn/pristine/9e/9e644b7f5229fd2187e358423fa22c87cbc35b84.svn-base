//
//  LBCalculationOfWideHighViewController.m
//  iOS封装
//
//  Created by sm on 17/1/9.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBCalculationOfWideHighViewController.h"
#import "LBCalculation.h"

@interface LBCalculationOfWideHighViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textv;

@property (weak, nonatomic) IBOutlet UILabel *labelW;

@property (weak, nonatomic) IBOutlet UILabel *labelH;

@end

@implementation LBCalculationOfWideHighViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"给定一段文本，动态计算该文本的高度与宽度";
    
    self.automaticallyAdjustsScrollViewInsets=NO;
}

- (IBAction)jisuanbt:(UIButton *)sender {
    
    if (self.textv.text.length<=0) {
         self.labelH.text=@"高度: 0 ";
         self.labelW.text=@"宽度: 0 ";
        return;
    }
    
  CGRect rt =  [LBCalculation CalculationText:self.textv.text TextW:self.view.bounds.size.width-20 TextH:MAXFLOAT attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]}];
    
    self.labelH.text=[NSString stringWithFormat:@"高度: %f", rt.size.height];
    self.labelW.text=[NSString stringWithFormat:@"宽度: %f", rt.size.width];
    
}

- (IBAction)fuwenbt:(UIButton *)sender {
    
    if (self.textv.text.length<=0) {
        self.labelH.text=@"高度: 0 ";
        self.labelW.text=@"宽度: 0 ";
        return;
    }
    //NSKernAttributeName设置字符间距
    CGRect rt =  [LBCalculation CalculationAttributedStringt:self.textv.text TextW:self.view.bounds.size.width-20 TextH:MAXFLOAT attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17],NSKernAttributeName: @(1),} spacing:3];
    
    self.labelH.text=[NSString stringWithFormat:@"高度: %f", rt.size.height];
    self.labelW.text=[NSString stringWithFormat:@"宽度: %f", rt.size.width];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];

}

@end
