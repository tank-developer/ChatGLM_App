//
//  AIVipBuyVo.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AIVipBuyVo.h"

@implementation AIVipBuyVo
- (instancetype)initByDic:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.vipBuyService = [[AIVipBuyService alloc] init];
        self.cellVoArray = [self.vipBuyService getCellVoArray:dic];
        [self reloadDataArray];
    }
    return self;
}
-(void)reloadDataArray{
    int totalCount = [CommonUtil getArrayCount:self.cellVoArray];
    self.dataArray = nil;
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:totalCount];
    [CommonUtil addDataToNSMutableArray:self.dataArray inArray:self.cellVoArray];
}


@end
