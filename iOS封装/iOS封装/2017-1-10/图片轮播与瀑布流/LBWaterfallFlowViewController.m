//
//  LBWaterfallFlowViewController.m
//  iOS封装
//
//  Created by sm on 17/1/10.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBWaterfallFlowViewController.h"
#import <SDCycleScrollView.h>
#import "XRCollectionViewCell.h"
#import "LBWaterfallLayout.h"
#import "XRImage.h"

@interface LBWaterfallFlowViewController ()<XRWaterfallLayoutDelegate,UICollectionViewDataSource>

@property(nonatomic , strong)SDCycleScrollView *scroll;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionV;

@property (nonatomic, strong) NSMutableArray<XRImage *> *images;

@end

@implementation LBWaterfallFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"图片轮播与瀑布流";
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.scroll=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 150) imageNamesGroup:@[@"banner01",@"banner01",@"banner01"]];
    self.scroll.pageControlAliment=SDCycleScrollViewPageContolAlimentCenter;
    self.scroll.pageControlStyle=SDCycleScrollViewPageContolStyleAnimated;
    self.scroll.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:self.scroll];
    
    
    //创建瀑布流布局
    LBWaterfallLayout *waterfall = [LBWaterfallLayout waterFallLayoutWithColumnCount:3];
    
    //设置各属性的值
    //    waterfall.rowSpacing = 10;
    //    waterfall.columnSpacing = 10;
    //    waterfall.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //或者一次性设置
    [waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(0, 10, 10, 10)];
    
    
    //设置代理，实现代理方法
    waterfall.delegate = self;
    /*
     //或者设置block
     [waterfall setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
     //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
     XRImage *image = self.images[indexPath.item];
     return image.imageH / image.imageW * itemWidth;
     }];
     */
    //创建collectionView
    
    self.collectionV.collectionViewLayout=waterfall;
    self.collectionV.backgroundColor = [UIColor whiteColor];
    [self.collectionV registerNib:[UINib nibWithNibName:@"XRCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionV.dataSource = self;
    [self.view addSubview:self.collectionV];
    
    
}

- (NSMutableArray *)images {
    //从plist文件中取出字典数组，并封装成对象模型，存入模型数组中
    if (!_images) {
        _images = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        NSArray *imageDics = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *imageDic in imageDics) {
            XRImage *image = [XRImage imageWithImageDic:imageDic];
            [_images addObject:image];
        }
    }
    return _images;
}
- (void)click {
    [self.images removeAllObjects];
    [self.collectionV reloadData];
}

//根据item的宽度与indexPath计算每一个item的高度
- (CGFloat)waterfallLayout:(LBWaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    XRImage *image = self.images[indexPath.item];
    return image.imageH / image.imageW * itemWidth;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XRCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageURL = self.images[indexPath.item].imageURL;
    return cell;
}
@end
