//
//  SQLiteViewController.m
//  iOS封装
//
//  Created by mac on 17/1/10.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "SQLiteViewController.h"
#import "MBProgressHUD.h"
#import "FMUserInfo.h"

@interface SQLiteViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *nameF;
@property (weak, nonatomic) IBOutlet UITextField *phoneF;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *chaBtn;
@property (weak, nonatomic) IBOutlet UIButton *gaiBtn;

@property (nonatomic,strong)NSMutableArray<NSNumber*> *state;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)FMUserInfo     *info;

@end

@implementation SQLiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SQLite数据存储";
    self.addBtn.backgroundColor = [UIColor grayColor];
    self.deleteBtn.backgroundColor = [UIColor grayColor];
    self.chaBtn.backgroundColor = [UIColor grayColor];
    self.gaiBtn.backgroundColor = [UIColor grayColor];
    _state = [@[]mutableCopy];
    [_state addObject:[NSNumber numberWithBool:true]];
    [_state addObject:[NSNumber numberWithBool:true]];
    [_state addObject:[NSNumber numberWithBool:true]];
    [_state addObject:[NSNumber numberWithBool:true]];
    _dataArr = [@[]mutableCopy];
    
    _info = [FMUserInfo greateTableOfFMWithTableName:@"userInfo"];
    _dataArr = [[_info queryAllDataOfFMDB]mutableCopy];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataArr[indexPath.row][@"name"];
    cell.detailTextLabel.text = _dataArr[indexPath.row][@"phone"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _nameF.text = _dataArr[indexPath.row][@"name"];
    _phoneF.text = _dataArr[indexPath.row][@"phone"];
}






- (IBAction)click:(UIButton *)sender {
    [self.view endEditing:YES];
    NSInteger i = sender.tag - 1;
    for (NSInteger index = 0; index < _state.count; index ++) {
        if (index == i) {
            [_state replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:NO]];
        }else{
            [_state replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:YES]];
        }
    }
    for (NSInteger index = 0; index < _state.count; index ++) {
        if (index == 0) {
            if ([_state[index]boolValue]) {
                self.addBtn.backgroundColor = [UIColor grayColor];
            }else{
                self.addBtn.backgroundColor = [UIColor greenColor];
            }
        }else if (index == 1) {
            if ([_state[index]boolValue]) {
                self.deleteBtn.backgroundColor = [UIColor grayColor];
            }else{
                self.deleteBtn.backgroundColor = [UIColor greenColor];
            }
        }else if (index == 2) {
            if ([_state[index]boolValue]) {
                self.chaBtn.backgroundColor = [UIColor grayColor];
            }else{
                self.chaBtn.backgroundColor = [UIColor greenColor];
            }
        }else if (index == 3) {
            if ([_state[index]boolValue]) {
                self.gaiBtn.backgroundColor = [UIColor grayColor];
            }else{
                self.gaiBtn.backgroundColor = [UIColor greenColor];
            }
        }
    }
    
    if (_nameF.text.length==0 || _phoneF.text.length==0) {
        [self show:@"请输入姓名和电话" toView:self.view];
        return;
    }
    switch (i) {
        case 0:
            [self add];
            break;
        case 1:
            [self delete];
            break;
        case 2:
            [self check];
            break;
        case 3:
            [self change];
            break;

            
        default:
            break;
    }
    
    _dataArr = [[_info queryAllDataOfFMDB]mutableCopy];
    [self.tableView reloadData];
}

-(void)add {
    //添加数据
    [_info insertOfFMWithDataArray:@[@{@"name":_nameF.text,@"phone":_phoneF.text}]];
}

-(void)delete{
    [_info deleteOfOneData:_phoneF.text];
}

-(void)check{
    NSDictionary *dict = [_info queryOfOneData:_nameF.text phone:_phoneF.text];
    if ([dict[@"item"] isEqualToString:@"0"]) {
        [self show:@"未查询到该数据" toView:self.view];
    }else{
        [self show:[NSString stringWithFormat:@"查询到%@条数据",dict[@"item"]] toView:self.view];
    }
}

-(void)change{
    [_info update:_nameF.text phone:_phoneF.text];
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
