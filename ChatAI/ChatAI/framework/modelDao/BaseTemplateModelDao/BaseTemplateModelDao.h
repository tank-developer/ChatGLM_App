//
//  BaseTemplateModelDao.h
//  test
//
//  Created by wujun on 2020/2/20.
//  Copyright © 2020 melon. All rights reserved.
//

#import "BaseModelDao.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTemplateModelDao : BaseModelDao
-(NSMutableArray *)getGroupModels:(NSDictionary *)requestDic;
-(instancetype)getModel:(NSDictionary *)requestDic;

@end

NS_ASSUME_NONNULL_END
