//
//  ItemCollView.h
//  筛选框的封装
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCollView : UIView

/**选择视图*/
@property(nonatomic,strong)UICollectionView                 *collectionView;
/**数据源*/
@property(nonatomic,strong)NSArray                          *dataSource;
/**标题*/
@property(nonatomic,strong)NSArray                          *titles;


@end

@interface ItemCollCellView : UICollectionViewCell

/**标题标签*/
@property(nonatomic,strong)UILabel                      *titleL;

@end

