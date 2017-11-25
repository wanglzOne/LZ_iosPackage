//
//  ListTabView.m
//  筛选框的封装
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "ListTabView.h"
#import "Masonry.h"


@interface ListTabView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ListTabView

//自定义初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

//创建子视图

-(void)setUpView{
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.top.equalTo(self);
    }];
}

//重写数据源方法

-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    [self.tableView reloadData];
}

#pragma mark - ******* Delegate *******

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTabCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell"];
    cell.titleL.text = self.dataSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.delegate && [_delegate respondsToSelector:@selector(ListTabView:selectRow:)]){
        [_delegate ListTabView:self selectRow:indexPath.row];
    }
}




#pragma mark - ******* Getters *******


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ListTabCellView class] forCellReuseIdentifier:@"tabCell"];
    }
    return _tableView;
}

@end


@implementation ListTabCellView

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpView];
    }
    return self;
}


-(void)setUpView{
    _titleL = [[UILabel alloc]init];
    _titleL.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleL];
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.top.equalTo(self);
    }];
}

@end





