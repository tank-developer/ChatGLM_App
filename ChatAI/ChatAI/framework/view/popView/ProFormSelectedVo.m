//
//  ProFormSelectedVo.m
//   
//
//  Created by melonGo on 2018/7/30.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "ProFormSelectedVo.h"

@implementation ProFormSelectedVo
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (instancetype)initByDic:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.dataDic = [[NSMutableDictionary alloc] init];
        self.dataDic = dic;
    }
    return self;
}
@end
