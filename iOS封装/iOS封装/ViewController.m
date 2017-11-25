//
//  ViewController.m
//  Encapsulation
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "ViewController.h"
#import "listTabViewCell.h"
#import "LBPictureCutViewController.h"
#import "SXKViewController.h"
#import "LBPhotoAlbumViewController.h"
#import "LBPopupViewViewController.h"
#import "LBCountDownViewController.h"
#import "LBSideslipViewController.h"
#import "LBAvatarVirtualViewController.h"
#import "DRYViewController.h"
#import "DetailController.h"
#import "QQViewController.h"
#import "MYWViewController.h"
#import "LBEnlargeSaveViewController.h"
#import "HXXViewController.h"
#import "LBPopupBoxStyleViewController.h"
#import "LBAccountPasswordVisibleViewController.h"
#import "LBregularExpressionViewController.h"
#import "MainController.h"
#import "LeftSlideViewController.h"
#import "MainPageViewController.h"
#import "LeftSortsViewController.h"
#import "SQContactController.h"
#import "SQPhoneViewController.h"
#import "LBCalculationOfWideHighViewController.h"
#import "LBPreventRepeatedClicksViewController.h"
#import "LBWaterfallFlowViewController.h"
#import "SQLiteViewController.h"
#import "SectionViewController.h"
#import "CLYBViewController.h"

#import "EWMViewController.h"

#import "LBLocalNotificationViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *timeArr;
@property (nonatomic,strong)NSArray *titleArr;
@property (nonatomic,strong)NSArray *names;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 10;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}


#pragma mark - ******* Methods *******

-(NSDictionary*)getMonth:(NSString*)time{
    NSArray *t = [time componentsSeparatedByString:@"-"];
    switch ([t[1]integerValue]) {
        case 1:
            return @{@"m":@"Jan",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 2:
            return @{@"m":@"Feb",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 3:
            return @{@"m":@"Mar",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 4:
            return @{@"m":@"Apr",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 5:
            return @{@"m":@"May",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 6:
            return @{@"m":@"Jun",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 7:
            return @{@"m":@"Jul",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 8:
            return @{@"m":@"Aug",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 9:
            return @{@"m":@"Sep",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 10:
            return @{@"m":@"Oct",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 11:
            return @{@"m":@"Nov",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
            break;
        case 12:
            return @{@"m":@"Dec",@"d":[NSString stringWithFormat:@"0%@",t.lastObject]};
        default:
            return @{@"m":@"",@"d":@""};
            break;
    }
}


#pragma mark - ******* Delegate *******

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.timeArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.titleArr[section] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    listTabViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listTabViewCell"];
    NSString *titles = self.titleArr[indexPath.section][indexPath.row];
    NSArray *contens = [titles componentsSeparatedByString:@"-"];
    cell.titleL.text = [NSString stringWithFormat:@"%zd、%@",indexPath.row + 1,contens.firstObject];
    if (contens.count == 1) {
        cell.nameL.text = [NSString stringWithFormat:@"@Author"];
    }else{
        cell.nameL.text = [NSString stringWithFormat:@"@Author %@",contens.lastObject];
    }
    return cell;
}

//构建HeaderInSection视图

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"H"];
    if (!view) {
        view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
    }
    UIView *headerBackView = [[UIView alloc]initWithFrame:CGRectMake(9, 10, 30, 30)];
    headerBackView.backgroundColor = [UIColor blackColor];
    headerBackView.layer.cornerRadius = 2.f;
    headerBackView.layer.masksToBounds = YES;
    [view addSubview:headerBackView];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 300, 50)];
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.font = [UIFont systemFontOfSize:13];
    timeLabel.text = self.timeArr[section];
    [view addSubview:timeLabel];
    
    UILabel *monthLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 1, 30, 15)];
    monthLabel.textColor = [UIColor whiteColor];
    monthLabel.font = [UIFont systemFontOfSize:10];
    monthLabel.textAlignment = NSTextAlignmentCenter;
    monthLabel.text = [self getMonth:self.timeArr[section]][@"m"];
    [headerBackView addSubview:monthLabel];
    
    UILabel *dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(monthLabel.frame)-2, 30, 15)];
    dayLabel.textColor = [UIColor whiteColor];
    dayLabel.font = [UIFont systemFontOfSize:10];
    dayLabel.text = [self getMonth:self.timeArr[section]][@"d"];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    [headerBackView addSubview:dayLabel];

    return view;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //跳转对应的内容
    //2017-1-3
    if(indexPath.section == 0){
        switch (indexPath.row + 1) {
            case 1:{
                LBPhotoAlbumViewController *vc=[[LBPhotoAlbumViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 2:{
                LBPopupViewViewController *vc=[[LBPopupViewViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 3:{
                LBPictureCutViewController *vc=[[LBPictureCutViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
                  }
            case 4:{
                SXKViewController *vc=[[SXKViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                }
                
                break;
            default:
                break;
        }
    }
    //2017-1-4
    else if(indexPath.section == 1){
        switch (indexPath.row + 1) {
            case 1:{
                DRYViewController *vc=[[DRYViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:{
                DetailController *vc=[[DetailController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                
                break;
            case 3:{
                LBSideslipViewController *vc=[[LBSideslipViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 4:{
                QQViewController *vc=[[QQViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                
                break;
            case 5:{
                LBCountDownViewController *vc=[[LBCountDownViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
    }
    //2017-1-5
    else if(indexPath.section == 2){
        switch (indexPath.row + 1) {
            case 1:{
                MYWViewController *vc=[[MYWViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:{
                HXXViewController *vc=[[HXXViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 3:{
                LBEnlargeSaveViewController *vc=[[LBEnlargeSaveViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 4:{
                LBAvatarVirtualViewController *vc=[[LBAvatarVirtualViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
                
            default:
                break;
        }
    }
    //2017-1-6
    else if(indexPath.section == 3){
        switch (indexPath.row + 1) {
            case 1:{
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"QQ" bundle:nil];
                MainController * mainVc = [storyboard instantiateViewControllerWithIdentifier:@"MainController"];
                LeftSortsViewController *leftVc = [[LeftSortsViewController alloc] init];
                LeftSlideViewController *slideVc = [LeftSlideViewController sharedLeftSlideVcWithLeftView:leftVc andMainView:mainVc];
                [self presentViewController:slideVc animated:true completion:nil];
                break;
            }
            case 2:{
                LBPopupBoxStyleViewController *vc=[[LBPopupBoxStyleViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
                break;
            case 3:{
                LBAccountPasswordVisibleViewController *vc=[[LBAccountPasswordVisibleViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 4:{
                LBregularExpressionViewController *vc=[[LBregularExpressionViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
                
            default:
                break;
        }
    }
    //2017-1-9
    else if(indexPath.section == 4){
        switch (indexPath.row + 1) {
            case 1:{
                LBPreventRepeatedClicksViewController *vc=[[LBPreventRepeatedClicksViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
                break;
            case 2:{
                
                LBCalculationOfWideHighViewController *vc=[[LBCalculationOfWideHighViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
               
            }
                break;
            case 3:{
                SQPhoneViewController *vc=[[SQPhoneViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 4:{
                SQContactController *vc=[[SQContactController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
                
            default:
                break;
        }
        
    }
    //2017-1-10
    else if(indexPath.section == 5){
        switch (indexPath.row + 1) {
            case 1:{
               CLYBViewController *vc = [[CLYBViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];

                break;
            }
            case 2:{
                SQLiteViewController *vc = [[SQLiteViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                
                break;
                
            }
                break;
            case 3:{
                SectionViewController *vc=[[SectionViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 4:{
                LBWaterfallFlowViewController *vc=[[LBWaterfallFlowViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
                
            default:
                break;
        }
        
    }
    //2017-1-11
    else if(indexPath.section == 6){
        switch (indexPath.row + 1) {
            case 1:{
                LBLocalNotificationViewController *vc = [[LBLocalNotificationViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                
                break;
            }
            case 2:{
                EWMViewController *vc = [[EWMViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                
                break;
            }
            default:
                break;
        }
        
    }
}



#pragma mark - ******* Getters *******

-(NSArray *)timeArr{
    if (!_timeArr) {
        _timeArr = @[@"2017-1-3",
                     @"2017-1-4",
                     @"2017-1-5",
                     @"2017-1-6",
                     @"2017-1-9",
                     @"2017-1-10",
                     @"2017-1-11"
                     ];
    }
    return _timeArr;
}


-(NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@[@"调用手机相机拍照或手机相册获取图片修改用户头像-立志",
                        @"封装弹出视图，上，下，左，右，中间弹出，并附有遮罩层-立志",
                        @"图片裁剪（圆形、方形、椭圆等等）-立志",
                        @"筛选框的实现,参照Boss直聘完成，实现与其类似的效果筛选框的实现-立志"],
                      @[@"对任意控件的下拉刷新动画-立志",
                        @"数据加载动画-立志",
                        @"列表视图侧滑编辑、置顶、删除-立志",
                        @"QQ好友动态头部效果封装-立志",
                        @"获取验证码，60s倒计时-立志"],
                      @[@"没有网络时的提示页面封装，参照小红书完成-立志",
                        @"虚线封装-立志",
                        @"图片点击放大，再次点击还原,长按保存至手机相册-立志",
                        @"头像虚化，实现毛玻璃效果-立志",
                        @"屏幕适配之像素与dp之间的转换-仅限于Android",
                        ],
                      @[@"QQ框架搭建-立志",
                        @"封装三车道里弹出框样式-立志",
                        @"封装三车道里账户清除和密码可见-立志",
                        @"各类正则表达式封装-立志",
                        ],
                      @[@"防止按钮重复点击，或快速点击的处理，考虑用户体验与适用性，封装成方法，方便以后直接调用-立志",
                        @"给定一段文本，动态计算该文本的高度与宽度。封装成方法，用于控件的自适应高度或宽度-立志",
                        @"获取手机相册，首先按原图显示，其次再让图片根据约定的宽高显示，保证图片不被压缩-立志",
                        @"读取手机联系人，封装成方法，方便以后直接调用-立志"],
                      @[@"处理异步线程并发，比如：有ABC三个网络请求，B需要在A网络请求完之后获取到B需要传递的参数才能进行B网络请求，而C呢又需要等到B网络请求完之后获取到C需要传递的参数才能进行C网络请求-立志",
                        @"SQLite数据存储-立志",
                        @"列表section停留-立志",
                        @"图片轮播与瀑布流-立志"],
                      @[@"本地推送-立志",
                        @"二维码扫描-立志"]
                      ];
    }
    return _titleArr;
}



@end
