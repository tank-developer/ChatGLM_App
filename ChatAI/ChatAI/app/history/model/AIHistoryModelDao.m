//
//  AIHistoryModelDao.m
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "AIHistoryModelDao.h"

@implementation AIHistoryModelDao
// 以schoolId为主键返回！
+ (NSString *)primaryKey {
   return @"historyId";
}


@end
