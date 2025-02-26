//
//  BaseTemplateDao.h
//  test
//
//  Created by admin on 2018/6/30.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseDao.h"
//#import <FMDB/FMDB.h>
//#import "FMDatabase.h"
//#import "FMDatabaseAdditions.h"
//#import "FMDatabaseQueue.h"

@interface BaseTemplateDao : BaseDao
//@property (nonatomic,strong) FMDatabaseQueue *databaseQueue;
- (BOOL)writeMessageToDB:(NSMutableDictionary *)msg;
-(NSMutableDictionary *)getAllListFromDB;
+ (void)createTablesNeeded;

@end
