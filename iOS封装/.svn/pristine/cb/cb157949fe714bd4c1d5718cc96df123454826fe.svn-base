//
//  ListTabView.h
//  筛选框的封装
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ListTabView;

@protocol ListTabViewDelegate <NSObject>

-(void)ListTabView:(ListTabView *)view selectRow:(NSInteger)row;

@end

@interface ListTabView : UIView

/**列表视图*/
@property(nonatomic,strong)UITableView                      *tableView;
/**数据源*/
@property(nonatomic,strong)NSArray                          *dataSource;
/**代理*/
@property(nonatomic,weak)id<ListTabViewDelegate>            delegate;


@end


@interface ListTabCellView : UITableViewCell

/**标题标签*/
@property(nonatomic,strong)UILabel                      *titleL;

@end



