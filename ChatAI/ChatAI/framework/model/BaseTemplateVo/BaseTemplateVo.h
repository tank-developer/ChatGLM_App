//
//  BaseTemplateVo.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseVo.h"
#import "CommonUtil.h"

@interface BaseTemplateVo : BaseVo
- (instancetype)initByDic:(NSMutableDictionary *)dic;
@property (nonatomic,strong)NSMutableArray *cellVoArray;
@end
