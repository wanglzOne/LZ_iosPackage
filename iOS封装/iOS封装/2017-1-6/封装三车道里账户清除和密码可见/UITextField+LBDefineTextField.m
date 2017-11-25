//
//  UITextField+LBDefineTextField.m
//  Encapsulation
//
//  Created by sm on 17/1/6.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "UITextField+LBDefineTextField.h"
#import <objc/runtime.h>


@implementation UITextField (LBDefineTextField)


+(instancetype)DefineClearTextFieldimage:(UIImage *)image frame:(CGRect)frame button:(UIButton*)button{

    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    
    view.backgroundColor=[UIColor clearColor];
    button.backgroundColor=[UIColor clearColor];
    button.frame=CGRectMake(0, 0, 20, 20);
    [button setImage:image forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3);
    
    [view addSubview:button];
    
    UITextField *textf=[[UITextField alloc]init];
    textf.frame=frame;
    textf.rightView=view;
    textf.rightViewMode=UITextFieldViewModeWhileEditing;
    
    return textf;
    

}

+(instancetype)DefineShowTextFieldimage:(UIImage *)image selectImage:(UIImage *)selectImage frame:(CGRect)frame button:(UIButton *)button{

    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    
    view.backgroundColor=[UIColor clearColor];
    button.backgroundColor=[UIColor clearColor];
    button.frame=CGRectMake(0, 0, 20, 20);
    button.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3);
    
    [view addSubview:button];
    
    UITextField *textf=[[UITextField alloc]init];
    textf.frame=frame;
    textf.rightView=view;
    textf.secureTextEntry=YES;
    textf.rightViewMode=UITextFieldViewModeWhileEditing;
    
    return textf;


}



@end
