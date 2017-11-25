//
//  LBSideslipViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBSideslipViewController.h"

@interface LBSideslipViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic)NSMutableArray *dataarr;
@end

@implementation LBSideslipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"列表视图侧滑编辑、置顶、删除";
     _dataarr=[NSMutableArray arrayWithObjects:@1,@2,@3,@4,@5,@6,@7,@8, nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataarr.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//       return 92;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"第%@行",self.dataarr[indexPath.row]];
    
    return cell;
    
}



- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        [self.dataarr removeObjectAtIndex:indexPath.row];
        [self.tableview reloadData];
        
    }];
    deleteRowAction.backgroundColor=[UIColor redColor];
    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"编辑"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
    }];
    UITableViewRowAction *topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        id a=[self.dataarr objectAtIndex:indexPath.row];
        
        [self.dataarr removeObjectAtIndex:indexPath.row];
        [self.dataarr insertObject:a atIndex:0];
        [self.tableview reloadData];
        
    }];
    topRowAction.backgroundColor=[UIColor grayColor];
    editRowAction.backgroundColor=[UIColor blueColor];
    return @[deleteRowAction, topRowAction ,editRowAction];
    
}


@end
