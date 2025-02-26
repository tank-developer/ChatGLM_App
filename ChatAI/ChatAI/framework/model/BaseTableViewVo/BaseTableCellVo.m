//
//  BaseTableCellVo.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTableCellVo.h"

@implementation BaseTableCellVo
- (instancetype)init
{
    self = [super init];
    self.isEditable = @"NO";
    self.cellDataDic =  [[NSMutableDictionary alloc] init];
    self.dbDic =[[NSMutableDictionary alloc] init];
    self.cellName = @"";
    return self;
}

- (instancetype)init:(NSString *)cellName cellDataDic:(NSMutableDictionary *)cellDataDic dbDic:(NSMutableDictionary *)dbDic{
    self = [self init];
    self.cellName = cellName;
    self.cellDataDic = cellDataDic;
    if (dbDic == nil) {
        self.dbDic =[[NSMutableDictionary alloc] init];
    }else{
        self.dbDic = dbDic;
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
