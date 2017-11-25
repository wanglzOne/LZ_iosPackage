//
//  ViewController.m
//  下拉刷新动画封装
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "DRYViewController.h"
#import "MJRefresh.h"


@interface DRYViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    NSInteger _row;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray                   *normalImages;
@property(nonatomic,strong)NSMutableArray                   *refreshImages;



@end

@implementation DRYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"对任意控件的下拉刷新动画";
    _tableView.rowHeight = 70;
    _row = 12;
    //头部
    MJRefreshGifHeader *header =[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(respondsToBelowUpdateRefresh)];
    [header setImages:self.refreshImages forState:MJRefreshStateRefreshing];
    [header setImages:self.normalImages forState:MJRefreshStateIdle];
    [header setImages:self.refreshImages forState:MJRefreshStatePulling];
    header.lastUpdatedTimeLabel.hidden = YES;//如果不隐藏这个会默认 图片在最左边不是在中间
    header.stateLabel.hidden = YES;
    _tableView.mj_header = header;
    //尾部
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(respondsToUpwardUpdateRefresh)];
    [footer setTitle:@"加载更多..." forState:MJRefreshStateIdle];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"放开加载..." forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    _tableView.mj_footer =footer;
    // 设置颜色
    footer.stateLabel.textColor = [UIColor grayColor];
    
}

//下拉刷新数据

-(void)respondsToBelowUpdateRefresh{
    _row = 12;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_tableView.mj_header endRefreshing];
        [_tableView reloadData];
    });
}

//上拉加载更多

-(void)respondsToUpwardUpdateRefresh{
    _row ++;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_tableView.mj_footer endRefreshing];
        [_tableView reloadData];
    });
    
}

//正在下拉状态下的图片

- (NSMutableArray *)normalImages
{
    if (!_normalImages) {
        _normalImages = [[NSMutableArray alloc] init];
        UIImage *image = [UIImage imageNamed:@"16"];
        UIImage *newImage = [self imageCompressWithSimple:image scaledToSize:CGSizeMake(50, 15)];
        [self.normalImages addObject:newImage];
    }
    return _normalImages;
}


//正在刷新状态下的图片

- (NSMutableArray *)refreshImages
{
    if (!_refreshImages) {
        _refreshImages = [[NSMutableArray alloc] init];
        //循环添加图片
        for (NSUInteger index = 1; index <= 16; index++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", index]];
            UIImage *newImage = [self imageCompressWithSimple:image scaledToSize:CGSizeMake(50, 15)];
            [self.refreshImages addObject:newImage];
        }
    }
    return _refreshImages;
}

//缩放到指定大小

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _row;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%zd行,点击加载数据",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}








@end
