//
//  AIHistoryVo.m
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "AIHistoryVo.h"

@implementation AIHistoryVo

- (instancetype)initByDic:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.historyService = [[AIHistoryService alloc] init];
        self.cellVoArray = [self.historyService getCellVoArray:dic];
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
