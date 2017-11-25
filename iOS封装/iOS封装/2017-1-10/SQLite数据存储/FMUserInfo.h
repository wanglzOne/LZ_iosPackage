//
//  FMUserInfo.h
//  JASSBijou
//
//  Created by mac on 16/10/10.
//  Copyright © 2016年 cdcyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface FMUserInfo : NSObject

@property(nonatomic,strong)FMDatabase *dataBase;
//创建表
+(FMUserInfo *)greateTableOfFMWithTableName:(NSString *)tableName;;
//插入数据
-(void)insertOfFMWithDataArray:(NSArray*)dataArr;
//删除数据
-(void)deleteAllDataOfFMDB;
//查询数据
-(NSArray*)queryAllDataOfFMDB;
//判断表中是否存在数据
-(BOOL)isDataInTheTable;
//删除某一条数据
-(void)deleteOfOneData:(NSString *)Id;
//修改
-(void)update:(NSString*)name phone:(NSString*)phone;
//查询某一条数据
-(NSDictionary*)queryOfOneData:(NSString*)name phone:(NSString*)phone;

@end
