//
//  LBAccountPasswordVisibleViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/6.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBAccountPasswordVisibleViewController.h"
#import "UITextField+LBDefineTextField.h"

@interface LBAccountPasswordVisibleViewController ()

@property(nonatomic , strong)UITextField *textf;
@property(nonatomic , strong)UITextField *textfS;
@property(nonatomic , strong)UIButton *buttons;
@end

@implementation LBAccountPasswordVisibleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"封装三车道里账户清除和密码可见";
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *button=[[UIButton alloc]init];
    _buttons=[[UIButton alloc]init];
    
    [button addTarget:self action:@selector(buttoneventa) forControlEvents:UIControlEventTouchUpInside];
    [_buttons addTarget:self action:@selector(buttonseventa:) forControlEvents:UIControlEventTouchUpInside];
    //第一个参数是显示的图片
    //第二个参数是textf的位置大小
    //是要显示的button
    _textf=[UITextField DefineClearTextFieldimage:[UIImage imageNamed:@"清空"] frame:CGRectMake(10, 100, 200, 30) button:button ];
    
    _textf.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:_textf];
    
    
    _textfS=[UITextField DefineShowTextFieldimage:[UIImage imageNamed:@"睁眼"] selectImage:[UIImage imageNamed:@"闭眼"] frame:CGRectMake(10, 200, 200, 30) button:_buttons];
    _textfS.backgroundColor=[UIColor grayColor];
    [_buttons setImage:[UIImage imageNamed:@"闭眼"] forState:UIControlStateNormal];
    [_buttons setImage:[UIImage imageNamed:@"睁眼"] forState:UIControlStateSelected];
     [self.view addSubview:_textfS];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];

}

-(void)buttoneventa{

    [self.textf setText:@""];

}

-(void)buttonseventa:(UIButton*)sender{
    if (self.textfS.isSecureTextEntry==YES) {
        self.textfS.secureTextEntry = NO;
        sender.selected=YES;
    }else{
        self.textfS.secureTextEntry = YES;
        sender.selected=NO;
    }

}

@end
