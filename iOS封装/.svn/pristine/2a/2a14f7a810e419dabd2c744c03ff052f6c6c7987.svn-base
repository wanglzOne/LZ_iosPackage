//
//  SQContactController.m
//  Encapsulation
//
//  Created by mac on 17/1/9.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "SQContactController.h"
#import <ContactsUI/ContactsUI.h>

@interface SQContactController ()<CNContactPickerDelegate>

{
    CNContactPickerViewController *_con;
}

@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *phoneL;
@property (weak, nonatomic) IBOutlet UIButton *callBtn;



@end

@implementation SQContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    _con = [[ CNContactPickerViewController alloc]init];
    _con.delegate = self;
    self.title = @"读取手机联系人，封装成方法，方便以后直接调用";
}
- (IBAction)getContact:(UIButton *)sender {
    
    [self presentViewController:_con animated:YES completion:nil];
    
    
    
}
- (IBAction)call:(UIButton *)sender {
    
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",_phoneL.text];
    UIWebView *callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker;
{
    NSLog(@"contactPickerDidCancel");
}
//选择一个联系人信息
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact;
{
    NSArray *allArray =   contact.phoneNumbers;
    _nameL.text = contact.familyName;
    for (CNLabeledValue *labeledValue in allArray) {
        CNPhoneNumber *num = labeledValue.value;
        _phoneL.text = num.stringValue;
    }
    _callBtn.hidden = (_nameL.text.length && _phoneL.text.length) ? NO : YES;
}
//选择一个联系人属性 具体信息
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty;
{
    NSLog(@"didSelectContactProperty");
}




@end
