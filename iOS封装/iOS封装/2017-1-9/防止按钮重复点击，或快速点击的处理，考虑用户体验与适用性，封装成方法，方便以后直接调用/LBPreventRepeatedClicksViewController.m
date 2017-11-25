//
//  LBPreventRepeatedClicksViewController.m
//  iOS封装
//
//  Created by sm on 17/1/9.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBPreventRepeatedClicksViewController.h"
#import "iOS封装-Swift.h"
#import "GCDtimer.h"

@interface LBPreventRepeatedClicksViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic)GCDtimer *gcdtimer;
@end

@implementation LBPreventRepeatedClicksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _gcdtimer=[[GCDtimer alloc]init];
     _gcdtimer.buttonRepeat=@"防止按钮重复点击";
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(stopbuttonrepeat) name:@"LBPreventRepeatedClicksViewController" object:nil];
    
}

- (IBAction)tapbutton:(UIButton *)sender {
    
     [LBshowMessage showMydefineMessageWithTagert:self.view message:@"您已经点击了按钮" dispatchTime:0.5 viewCenter:CGPointMake(self.view.center.x, ([UIScreen mainScreen].bounds.size.height -120)/2 - 60) imagestr:@"成功"];
    
    self.button.userInteractionEnabled=NO;
    self.button.backgroundColor=[UIColor grayColor];
    
     [_gcdtimer dispalyLb:self.label secondsCountDown:5];
    
}

-(void)stopbuttonrepeat{
    self.button.userInteractionEnabled=YES;
    self.button.backgroundColor=[UIColor colorWithRed:202/255.0 green:159/255.0 blue:45/255.0 alpha:0.8];


}


@end
