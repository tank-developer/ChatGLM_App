//
//  BaseTemplateService.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseService.h"
#import "BaseTemplateDao.h"

@interface BaseTemplateService : BaseService
-(void)saveRequestDic:(NSMutableDictionary *)requestDic;
-(NSMutableDictionary *) getAllListFromDB;
@end
