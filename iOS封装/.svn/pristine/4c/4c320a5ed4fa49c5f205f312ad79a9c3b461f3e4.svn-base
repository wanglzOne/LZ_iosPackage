//
//  ItemCollView.m
//  筛选框的封装
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "ItemCollView.h"
#import "Masonry.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width

@interface ItemCollView ()<UICollectionViewDelegate,UICollectionViewDataSource>

//点击后的状态
@property(nonatomic,strong)NSMutableArray<NSMutableArray*> *state;

@end

@implementation ItemCollView

//自定义初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

//加载子视图

-(void)setUpView{
    _state = [@[]mutableCopy];
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.top.equalTo(self);
    }];
}

//重写数据的Setter方法，刷新视图

-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    for (NSInteger i = 0; i < [_dataSource count]; i ++) {
        NSMutableArray *arr = [@[]mutableCopy];
        for (NSInteger j = 0; j < [_dataSource[i] count]; j ++) {
            [arr addObject:[NSNumber numberWithBool:NO]];
        }
        [_state addObject:arr];
    }
    [self.collectionView reloadData];
}

#pragma mark - ******* Delegate *******

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCollCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"colCell" forIndexPath:indexPath];
    cell.titleL.text = self.dataSource[indexPath.section][indexPath.item];
    if (![_state[indexPath.section][indexPath.item]boolValue]) {
        cell.titleL.backgroundColor = [UIColor whiteColor];
    }else{
        cell.titleL.backgroundColor = [UIColor greenColor];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.item;
    
    for (NSInteger i = 0; i < [_dataSource[indexPath.section] count]; i ++) {
        if (i == index) {
            [_state[indexPath.section] replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:YES]];
        }else{
            [_state[indexPath.section] replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
        }
    }
    [self.collectionView reloadData];
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"H" forIndexPath:indexPath];
        for (UIView *v in headerView.subviews) {
            [v removeFromSuperview];
        }
        headerView.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10,SCREEN_W, 44)];
        label.text = self.titles[indexPath.section];
        [headerView addSubview:label];
        return headerView;
    }else{
        return nil;
    }
    
}


#pragma mark - ******* Getters *******


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;//列间距
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 50) / 4.0,30);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[ItemCollCellView class] forCellWithReuseIdentifier:@"colCell"];
        //注册原型头部视图
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"H"];
        //设置头部和底部视图高度
        layout.headerReferenceSize = CGSizeMake(0, 44);
    }
    return _collectionView;
}

@end

@implementation ItemCollCellView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUpView];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
    }
    return self;
}

-(void)setUpView{
    _titleL = [[UILabel alloc]init];
    _titleL.textAlignment = NSTextAlignmentCenter;
    _titleL.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_titleL];
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.top.equalTo(self);
    }];
}

@end


