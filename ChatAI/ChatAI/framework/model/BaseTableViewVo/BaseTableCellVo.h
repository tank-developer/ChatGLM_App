//
//  BaseTableCellVo.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseVo.h"

@interface BaseTableCellVo : BaseVo
@property (nonatomic,strong)NSMutableDictionary *cellDataDic;
@property (nonatomic,strong)NSMutableDictionary *dbDic;
@property (nonatomic,strong)NSString *cellName;
@property (nonatomic,strong)NSString *cellAction;
@property (nonatomic,strong)NSString *cellKey;
@property (nonatomic,strong)NSString *isEditable;
- (instancetype)init:(NSString *)cellName cellDataDic:(NSMutableDictionary *)cellDataDic dbDic:(NSMutableDictionary *)dbDic ;
@end
