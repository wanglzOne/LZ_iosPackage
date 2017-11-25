//
//  ViewController.m
//  筛选框的封装
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "SXKViewController.h"
#import "ListTabView.h"
#import "ItemCollView.h"
#import "AttributeView.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height


#define STARTFRAME CGRectMake(0, 64 + 60, SCREEN_W, 0)
#define STOPFRAME CGRectMake(0, 64 + 60, SCREEN_W, SCREEN_H - 124)

@interface SXKViewController ()<ListTabViewDelegate,AttributeViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *tjBtn;
@property (weak, nonatomic) IBOutlet UIButton *cdBtn;
@property (weak, nonatomic) IBOutlet UIButton *yqBtn;
@property (weak, nonatomic) IBOutlet UIButton *gsBtn;
@property (weak, nonatomic) IBOutlet UILabel *tjLabel;

/**按钮点击状态*/
@property (nonatomic,strong)NSMutableArray    *state;

/**地区视图*/
@property(nonatomic,strong)UIView                      *dQView;
/**区*/
@property(nonatomic,strong)ListTabView                 *areaTabView;   //武侯
/**街道*/
@property(nonatomic,strong)ListTabView                 *streetTabView; //华阳
/**街道名称*/
@property(nonatomic,strong)NSArray                     *streetName;

/**要求视图*/
@property(nonatomic,strong)UIView                      *yQView;
/**公司视图*/
@property(nonatomic,strong)UIView                      *gSView;
/**推荐视图*/
@property(nonatomic,strong)AttributeView               *tJView;
/**推荐视图的高度*/
@property(nonatomic,assign)CGFloat                     tJView_H;
/**推荐视图所在的下标*/
@property(nonatomic,assign)NSInteger                   index;






@end

@implementation SXKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"筛选框的实现,参照Boss直聘完成，实现与其类似的效果筛选框的实现";
    [self horizontalCenterTitleAndImage:6 setBtn:_tjBtn];
    [self horizontalCenterTitleAndImage:6 setBtn:_cdBtn];
    [self horizontalCenterTitleAndImage:6 setBtn:_yqBtn];
    [self horizontalCenterTitleAndImage:6 setBtn:_gsBtn];
    
}
- (IBAction)click:(UIButton *)sender {
    NSLog(@"%zd",sender.tag);
    for (NSInteger i = 0; i < self.state.count; i ++) {
        if (i == sender.tag) {
            bool a = [self.state[i]boolValue];
            [self.state replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:!a]];
        }else{
            [self.state replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
        }
    }
    switch (sender.tag) {
        case 0:
            //显示推荐视图
            [self showTJView:(sender)];
            break;
        case 1:
            //显示地区视图
            [self showDQView:(sender)];
            break;
        case 2:
            //显示要求视图
            [self showYQView:(sender)];
            break;
        case 3:
            //显示公司视图
            [self showGSView:(sender)];
            break;
        default:
            break;
    }
}



#pragma mark - ******* Methods *******

-(void)showTJView:(UIButton*)sender{
    //首先关闭其他视图
    [self removeYQView];
    [self removeGSView];
    [self removeDQView];
    _index = sender.tag;
    if ([self.state[sender.tag]boolValue]) {
        [self.view addSubview:self.tJView];
        self.tJView.frame = STARTFRAME;
        [UIView animateWithDuration:1.0 animations:^{
            self.tJView.frame = CGRectMake(0, 64 + 60, SCREEN_W, _tJView_H);
        }];
    }else{
        [self removeTJView];
    }
    
}

-(void)removeTJView{
    [self.tJView removeFromSuperview];
}



-(void)showDQView:(UIButton*)sender{
    
    //首先关闭其他视图
    [self removeYQView];
    [self removeGSView];
    [self removeTJView];
    
    if ([self.state[sender.tag]boolValue]) {
        [self.view addSubview:self.dQView];
        [_dQView addSubview:self.areaTabView];
        [_dQView addSubview:self.streetTabView];
        self.dQView.frame = STARTFRAME;
        [UIView animateWithDuration:1.0 animations:^{
            self.dQView.frame = STOPFRAME;
        }];
    }else{
        [self removeDQView];
    }
}

-(void)removeDQView{
    [self.dQView removeFromSuperview];
    [self.areaTabView removeFromSuperview];
    [self.streetTabView removeFromSuperview];
}

-(void)showYQView:(UIButton*)sender{
    //首先关闭其他视图
    [self removeDQView];
    [self removeGSView];
    [self removeTJView];
    if ([self.state[sender.tag]boolValue]) {
        [self.view addSubview:self.yQView];
        self.yQView.frame = STARTFRAME;
        [UIView animateWithDuration:1.0 animations:^{
            self.yQView.frame = STOPFRAME;
        }];
    }else{
        [self removeYQView];
    }
    
}

-(void)removeYQView{
    [self.yQView removeFromSuperview];
}

-(void)showGSView:(UIButton*)sender{
    //首先关闭其他视图
    [self removeDQView];
    [self removeYQView];
    [self removeTJView];
    
    if ([self.state[sender.tag]boolValue]) {
        [self.view addSubview:self.gSView];
        self.gSView.frame = STARTFRAME;
        [UIView animateWithDuration:1.0 animations:^{
            self.gSView.frame = STOPFRAME;
        }];
    }else{
        [self removeGSView];
    }
    
}

-(void)removeGSView{
    [self.gSView removeFromSuperview];
}


- (void)horizontalCenterTitleAndImage:(CGFloat)spacing setBtn:(UIButton*)btn
{
    CGSize imageSize = btn.imageView.frame.size;
    CGSize titleSize = btn.titleLabel.frame.size;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width + spacing/2);
    titleSize = btn.titleLabel.frame.size;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing/2, 0.0, - titleSize.width);
}

#pragma mark - ******* Delegate *******

-(void)ListTabView:(ListTabView *)view selectRow:(NSInteger)row{
    self.streetTabView.dataSource = self.streetName[row];
}

-(void)AttributeView:(AttributeView *)view didClickBtn:(UIButton *)btn{
    bool a = [self.state[self.index]boolValue];
    [self.state replaceObjectAtIndex:self.index withObject:[NSNumber numberWithBool:!a]];
    [self removeTJView];
    _tjLabel.text = btn.titleLabel.text;
    _tjLabel.backgroundColor = [UIColor whiteColor];
}

#pragma mark - ******* Getters *******

-(UIView *)dQView{
    if (!_dQView) {
        _dQView = [[UIView alloc]initWithFrame:CGRectMake(0, 124, SCREEN_W, 0)];
        _dQView.backgroundColor = [UIColor whiteColor];
        _dQView.layer.masksToBounds = YES;
    }
    return _dQView;
}

-(ListTabView *)areaTabView{
    if (!_areaTabView) {
        _areaTabView = [[ListTabView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W/2.0 - 50, SCREEN_H - 202)];
        _areaTabView.dataSource = @[@"成都",@"武侯区",@"金牛区",@"锦江区",@"青羊区",@"双流区",@"郫县",@"海定区",@"青白江区",@"成华区"];
        _areaTabView.delegate = self;
        
    }
    return _areaTabView;
}

-(ListTabView *)streetTabView{
    if (!_streetTabView) {
        _streetTabView = [[ListTabView alloc]initWithFrame:CGRectMake(SCREEN_W/2.0 - 50, 0, SCREEN_W/2.0 + 50, SCREEN_H - 202)];
    }
    return _streetTabView;
}

-(NSArray *)streetName{
    if(!_streetName){
        _streetName = @[@[@"成都"],
                        @[@"中和",@"华阳",@"创业路"],
                        @[@"金牛区",@"人民北路",@"抚琴",@"交大路"],
                        @[@"盐市口",@"红星路"],
                        @[@"青羊区"],
                        @[@"华阳",@"东升"],
                        @[@"郫筒"],
                        @[@"中关村"],
                        @[@"青白江"],
                        @[@"全成华"],
                        @[@"任何地方"]];
    }
    return _streetName;
}

-(UIView *)yQView{
    if (!_yQView) {
        _yQView = [[UIView alloc]initWithFrame:CGRectMake(0, 124, SCREEN_W, 0)];
        _yQView.backgroundColor = [UIColor whiteColor];
        _yQView.layer.masksToBounds = YES;
        ItemCollView *itemView = [[ItemCollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 124 - 120)];
        itemView.subviews[0].backgroundColor = [UIColor yellowColor];
        itemView.dataSource = @[@[@"默认",@"大专",@"本科",@"硕士",@"博士"],
                                @[@"默认",@"应届生",@"1年以内",@"1-3年",@"3-5年",@"5-10年",@"10年以上"],
                                @[@"默认",@"3k以下",@"3k-5k",@"5k-10k",@"10k-20k",@"20k-50k",@"50k以上"],
                                ];
        itemView.titles = @[@"学历",@"经验",@"工资"];
        [_yQView addSubview:itemView];
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        sureBtn.backgroundColor = [UIColor blueColor];
        sureBtn.frame = CGRectMake(10, SCREEN_H - 124 - 110, SCREEN_W - 20, 40);
        sureBtn.layer.cornerRadius = 3.f;
        sureBtn.layer.masksToBounds = YES;
        [_yQView addSubview:sureBtn];
    }
    return _yQView;
}

-(UIView *)gSView{
    if (!_gSView) {
        _gSView = [[UIView alloc]initWithFrame:CGRectMake(0, 124, SCREEN_W, 0)];
        _gSView.backgroundColor = [UIColor whiteColor];
        _gSView.layer.masksToBounds = YES;
        ItemCollView *itemView = [[ItemCollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 124 - 120)];
        itemView.subviews[0].backgroundColor = [UIColor yellowColor];
        itemView.dataSource = @[@[@"默认",@"未融资",@"天使轮",@"A轮",@"B轮",@"C轮",@"D轮以上"                    ,@"已上市"],
                                @[@"默认",@"0-20人",@"20-99人",@"100-499人",@"500-999人",@"1000-9999人",@"10000人以上"],
                                @[@"默认",@"互联网行业",@"健康医疗",@"生活服务",@"旅游",@"金融",@"信息安全",@"广告营销",@"数据服务",@"智能硬件",@"文化娱乐",@"网络招聘",@"分类信息",@"电子商务",@"移动互联网",@"企业服务",@"社交网络",@"教育培训",@"o2o",@"游戏",@"互联网",@"媒体",@"IT软件"],
                                ];
        itemView.titles = @[@"融资规模",@"团队规模",@"行业"];
        [_gSView addSubview:itemView];
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        sureBtn.backgroundColor = [UIColor blueColor];
        sureBtn.frame = CGRectMake(10, SCREEN_H - 124 - 110, SCREEN_W - 20, 40);
        sureBtn.layer.cornerRadius = 3.f;
        sureBtn.layer.masksToBounds = YES;
        [_gSView addSubview:sureBtn];
    }
    return _gSView;
}


-(AttributeView *)tJView{
    if (!_tJView) {
        _tJView = [AttributeView attributeViewWithAttributeTexts:@[@"默认",@"未融资",@"天使轮",@"A轮",@"B轮",@"C轮",@"D轮以上",@"已上市"]];
        _tJView_H = _tJView.frame.size.height;
        _tJView.delegate = self;
    }
    return _tJView;
}


-(NSMutableArray *)state{
    if (!_state) {
        _state = [@[]mutableCopy];
        for (NSInteger i = 0; i < 4; i ++) {
            [_state addObject:[NSNumber numberWithBool:NO]];
        }
    }
    return _state;
}









@end








