//
//  LBregularExpressionViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/6.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBregularExpressionViewController.h"
#import "predicateModel.h"
#import "iOS封装-Swift.h"

@interface LBregularExpressionViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textf1;

@property (weak, nonatomic) IBOutlet UITextField *textf2;

@property (weak, nonatomic) IBOutlet UITextField *textf3;

@property (weak, nonatomic) IBOutlet UITextField *textf4;

@property (weak, nonatomic) IBOutlet UITextField *textf5;

@property (weak, nonatomic) IBOutlet UITextField *textf6;

@end

@implementation LBregularExpressionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"各类正则表达式封装";
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];

}

- (IBAction)button1:(UIButton *)sender {
    [self.view endEditing:YES];
    if (self.textf1.text.length<=0) {
        //例子
        [LBshowMessage showMydefineMessageWithTagert:self.view message:@"输入不能为空" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
    }else{
    
        if ([predicateModel isValidateUrl:self.textf1.text]) {
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证正确" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }else{
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证错误" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }
    }
}

- (IBAction)button2:(UIButton *)sender {
    [self.view endEditing:YES];
    if (self.textf2.text.length<=0) {
        //例子
        [LBshowMessage showMydefineMessageWithTagert:self.view message:@"输入不能为空" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
    }else{
        if ([predicateModel valiMobile:self.textf2.text]) {
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证正确" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }else{
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证错误" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }
    }
}

- (IBAction)button3:(UIButton *)sender {
    [self.view endEditing:YES];
    if (self.textf3.text.length<=0) {
        //例子
        [LBshowMessage showMydefineMessageWithTagert:self.view message:@"输入不能为空" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
    }else{
        if ([predicateModel isValidateEmail:self.textf3.text]) {
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证正确" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }else{
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证错误" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }
    }
    
}

- (IBAction)button4:(UIButton *)sender {
    [self.view endEditing:YES];
    if (self.textf4.text.length<=0) {
        //例子
        [LBshowMessage showMydefineMessageWithTagert:self.view message:@"输入不能为空" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
    }else{
        if ([predicateModel validateIdentityCard:self.textf4.text]) {
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证正确" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }else{
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证错误" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }
    }
    
}

- (IBAction)button5:(UIButton *)sender {
    [self.view endEditing:YES];
    if (self.textf5.text.length<=0) {
        //例子
        [LBshowMessage showMydefineMessageWithTagert:self.view message:@"输入不能为空" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
    }else{
        if ([predicateModel validateBankCardNumber:self.textf5.text]) {
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证正确" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }else{
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"验证错误" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }
    }
}

- (IBAction)button6:(UIButton *)sender {
    [self.view endEditing:YES];
    if (self.textf6.text.length<=0) {
        //例子
        [LBshowMessage showMydefineMessageWithTagert:self.view message:@"输入不能为空" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
    }else{
        if ([predicateModel IsChinese:self.textf6.text]) {
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"包含汉字" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }else{
            //例子
            [LBshowMessage showMydefineMessageWithTagert:self.view message:@"不包含汉字" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
        }
    }
    
}

@end
