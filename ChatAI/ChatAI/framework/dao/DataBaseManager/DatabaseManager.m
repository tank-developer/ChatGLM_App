//
//  DatabaseManager.m
//  Bper
//
//  Created by Adam on 16/1/14.
//  Copyright © 2016年 Adam. All rights reserved.
//

#import "DatabaseManager.h"

//#include <sqlite3.h>
//#import <FMDB/FMDB.h>
//#import "FMDatabase.h"
//#import "FMDatabaseQueue.h"
#define kDatabaseFileName       @"doc.sqlite"

@implementation DatabaseManager

static DatabaseManager *manager = nil;

//- (instancetype)init
//{
//    if (self = [super init]) {
//        
//        _isDataBaseOpened = NO;
//        
//        [self setWritablePath:[DatabaseDirectory() stringByAppendingPathComponent:kDatabaseFileName]];
//        NSLog(@"writablePath:%@",self.writablePath);
//        [self openDataBase];
//    }
//    return self;
//}
//
//+ (DatabaseManager *)currentManager
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        manager = [[DatabaseManager alloc] init];
//    });
//    return manager;
//}
//
//- (BOOL)isDatabaseOpened
//{
//    return _isDataBaseOpened;
//}
//
//- (void)openDataBase{
//    
//    _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:self.writablePath];
//    
//    if (_databaseQueue == 0x00) {
//        _isDataBaseOpened = NO;
//        return;
//    }
//    
//    _isDataBaseOpened = YES;
//    NSLog(@"Open Database OK!");
//    [_databaseQueue inDatabase:^(FMDatabase *db){
//        [db setShouldCacheStatements:YES];
//    }];
//}
//
//- (void)closeDataBase{
//    if(!_isDataBaseOpened){
//        NSLog(@"数据库已打开，或打开失败。请求关闭数据库失败。");
//        return;
//    }
//    
//    [_databaseQueue close];
//    _isDataBaseOpened = NO;
//    NSLog(@"关闭数据库成功。");
//}
//
//+ (void)releaseManager{
//    
//    if(manager){
//        
//        manager = nil;
//    }
//}
//
//
//-(void)dealloc{
//    
//    [self closeDataBase];
//}

@end
