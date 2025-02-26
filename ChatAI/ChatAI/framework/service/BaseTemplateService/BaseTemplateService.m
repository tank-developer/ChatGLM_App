//
//  BaseTemplateService.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTemplateService.h"

@implementation BaseTemplateService
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initDao];
    }
    return self;
}
-(void) initDao{
    
}

-(NSArray *)getSubServiceList{
    return nil;
}

-(BaseTemplateDao *)getBaseTemplateDao{
    return nil;
}

-(NSString *)getJsonListName{
    return nil;
}

-(NSString *)getJsonName{
    return nil;
}
-(void)saveRequestDic:(NSMutableDictionary *)requestDic{
    if (requestDic == nil) {
        return;
    }
    if ([self getJsonListName] == nil) {
        return;
    }
    if ([self getBaseTemplateDao] == nil) {
        return;
    }
    NSLog(@"getJsonListName:%@,getBaseTemplateDao:%@",[self getJsonListName],[self getBaseTemplateDao]);
    //这里要删除原来的数据
    [[self getBaseTemplateDao] writeMessageToDB:requestDic];
}
-(NSMutableDictionary *) getAllListFromDB{
    if ([self getBaseTemplateDao] == nil) {
        return nil;
    }
    return [[self getBaseTemplateDao] getAllListFromDB];
}

@end
