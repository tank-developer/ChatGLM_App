//
//  DatabaseManager.h
//  Bper
//
//  Created by Adam on 16/1/14.
//  Copyright © 2016年 Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathConstant.h"
@class FMDatabaseQueue;

@interface DatabaseManager : NSObject

@property (nonatomic,assign) BOOL isInitializeSuccess;
@property (nonatomic,assign) BOOL isDataBaseOpened;
@property (nonatomic,copy) NSString *writablePath;
@property (nonatomic,strong) FMDatabaseQueue *databaseQueue;

+ (DatabaseManager *)currentManager;

- (BOOL)isDatabaseOpened;

- (void)openDataBase;

- (void)closeDataBase;

+ (void)releaseManager;

@end
