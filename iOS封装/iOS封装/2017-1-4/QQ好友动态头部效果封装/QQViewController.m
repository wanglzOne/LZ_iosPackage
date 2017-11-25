//
//  ViewController.m
//  表示图头放大
//
//  Created by ibokan on 15/2/3.
//  Copyright (c) 2015年 ibokan. All rights reserved.
//

#import "QQViewController.h"
#import "MJRefresh.h"
#import "SDetailController.h"

@interface QQViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *navView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@property(nonatomic,strong)UIImageView    *headImageView;//头部图片
@property(nonatomic,strong)NSMutableArray *infoArray;    //数据源数组



@end
//屏幕宽、高 宏定义
#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@implementation QQViewController

static CGFloat kImageOriginHight = 250;
- (IBAction)click:(UIButton *)sender {
    //SDetailController *vc = [[SDetailController alloc]init];
    //[self.navigationController pushViewController:vc animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //将视图添加到界面上
    [self.view addSubview:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsMake(kImageOriginHight,0,0,0);
    [self.tableView addSubview:self.headImageView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.activityView.hidden = YES;
    [self.view insertSubview:self.navView aboveSubview:self.tableView];
}



-(void)loadNewData{
    [self.activityView startAnimating];
    self.activityView.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.activityView  stopAnimating];
        self.activityView.hidden = YES;
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - ******* 滚动视图的代理方法 *******

- (void)scrollViewDidScroll:(UIScrollView*)scrollView{
    /**
     *  关键处理：通过滚动视图获取到滚动偏移量从而去改变图片的变化
     */
    //获取滚动视图y值的偏移量
    CGFloat yOffset = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + kImageOriginHight) / 2;
    
    if(yOffset < -kImageOriginHight) {
        CGRect f = self.headImageView.frame;
        f.origin.y = yOffset ;
        f.size.height =  -yOffset;
        f.origin.x = xOffset;
        f.size.width = SCREEN_W + fabs(xOffset)*2;
        self.headImageView.frame = f;
    }
    CGFloat minAlphaOffset = -64;
    CGFloat maxAlphaOffset = kImageOriginHight;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    _navView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:alpha];
}


#pragma mark - ******* 表视图代理 *******

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath{
    return 44;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoArray.count;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [self.infoArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - ******* Getters *******

-(NSMutableArray *)infoArray
{
    if (!_infoArray)
    {
        _infoArray = [@[]mutableCopy];
        for (int i=0; i<40; i++)
        {
            [_infoArray addObject:[NSString stringWithFormat:@"测试数据%zd",i]];
        }
    }
    return _infoArray;
}

-(UIImageView *)headImageView
{
    if (!_headImageView)
    {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.frame = CGRectMake(0, -kImageOriginHight,SCREEN_W,kImageOriginHight);
        _headImageView.image = [UIImage imageNamed:@"bg"];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}




@end
