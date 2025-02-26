//
//  BaseTemplateDao.m
//  test
//
//  Created by admin on 2018/6/30.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTemplateDao.h"
#import "DatabaseManager.h"

@implementation BaseTemplateDao
- (id)init{
    self = [super init];
    if(self){
//        self.databaseQueue = [DatabaseManager currentManager].databaseQueue;
    }
    return self;
}

//- (FMDatabaseQueue *)databaseQueue
//{
//    if (![[DatabaseManager currentManager] isDatabaseOpened]) {
//        [[DatabaseManager currentManager] openDataBase];
//        self.databaseQueue = [DatabaseManager currentManager].databaseQueue;
//        if (_databaseQueue)  [BaseTemplateDao createTablesNeeded];
//    }
//    return _databaseQueue;
//}
//
//
//+ (void)createTablesNeeded
//{
//    @autoreleasepool {
//        FMDatabaseQueue *databaseQueue = [DatabaseManager currentManager].databaseQueue;
//
//
//        [databaseQueue inTransaction:^(FMDatabase *database, BOOL *rollBack){
//
//
//            NSString *sql1 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS t_userList (ID INTEGER PRIMARY KEY AUTOINCREMENT,title text NOT NULL,content text NOT NULL);"];
//
//            NSString *sql2 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS t_homeList ( \
//                              ID INTEGER PRIMARY KEY AUTOINCREMENT,msgDic BLOB NOT NULL)"];
//
//            NSString *sql3 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS t_datails_list ( \
//                              ID INTEGER PRIMARY KEY AUTOINCREMENT,                                     \
//                              keywords TEXT,                                                              \
//                              marketprice TEXT,                                                         \
//                              minpurchase INTEGER,                                                                 \
//                              proname TEXT,                                                               \
//                              isCollection INTEGER,                                                            \
//                              proimg TEXT                                                             \
//                              vipprice TEXT                                                             \
//                              yuexiao INTEGER                                                             \
//                              )"];
////
////            NSString *sql5 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS t_channel (\
////                              ID INTEGER PRIMARY KEY AUTOINCREMENT,                             \
////                              userId TEXT,                                                      \
////                              category INTEGER,                                                 \
////                              cid TEXT,                                                         \
////                              name TEXT,                                                        \
////                              photoId TEXT,                                                     \
////                              type INTEGER,                                                     \
////                              desc TEXT,                                                        \
////                              memberCount INTEGER,                                              \
////                              ownerId TEXT                                                      \
////                              )"];
////
////            NSString *sql6 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS t_contact ( \
////                              ID INTEGER PRIMARY KEY AUTOINCREMENT,                              \
////                              ipocId TEXT,                                                       \
////                              photoId TEXT,                                                      \
////                              name TEXT,                                                         \
////                              role INTEGER,                                                      \
////                              sessionPresence INTEGER,                                           \
////                              contactPresence INTEGER,                                           \
////                              add_dttm REAL                                                      \
////                              )"];
//
////            BOOL isSuccess =  [database executeUpdate:sql1];
//            if([database executeUpdate:sql1]){
//                NSLog(@"sql1建表成功");
//            }
//            if ([database executeUpdate:sql2]) {
//                NSLog(@"sql2建表成功");
//            }
//            if ([database executeUpdate:sql3]) {
//                NSLog(@"sql3建表成功");
//            }
//        }];
//
//    }
//}
//
//- (BOOL)writeMessageToDB:(NSMutableDictionary *)msg{
//
//    return YES;
//}
//-(NSMutableDictionary *)getAllListFromDB{
//    NSMutableDictionary *array = [[NSMutableDictionary alloc] init];
//    return array;
//}

@end
