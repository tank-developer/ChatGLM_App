//
//  AISettingVo.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AISettingVo.h"

@implementation AISettingVo
- (instancetype)initByDic:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.settingService = [[AISettingService alloc] init];
        self.cellVoArray = [self.settingService getCellVoArray:dic];
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
