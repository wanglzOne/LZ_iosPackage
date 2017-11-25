//
//  Message Controller.m
//  Encapsulation
//
//  Created by mac on 17/1/6.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "MessageController.h"
#import "LeftSlideViewController.h"

@interface MessageController ()

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)left:(UIBarButtonItem *)sender {
    LeftSlideViewController *vc = [LeftSlideViewController sharedLeftSlideVcWithLeftView:nil andMainView:nil];
    if (vc.closed) [vc openLeftView]; else [vc closeLeftView];
}


- (IBAction)click:(id)sender {
    LeftSlideViewController *vc = [LeftSlideViewController sharedLeftSlideVcWithLeftView:nil andMainView:nil];
    [vc dismissViewControllerAnimated:YES completion:nil];
}



@end
