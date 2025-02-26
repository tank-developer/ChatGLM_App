//
//  AIChatVo.m
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "AIChatVo.h"
#import "AIChatMessageModel.h"

@implementation AIChatVo

- (instancetype)initByDic:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.chatService = [[AIChatService alloc] init];
        self.cellVoArray = [self.chatService getCellVoArray:dic];
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
-(void)refreshVo:(NSString *)content{
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AIChatContentUserCell"]){
            CGRect rect = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
            
     
            
            [vo.cellDataDic setObject:content forKey:@"lbl1"];
            [vo.cellDataDic setObject:[NSString stringWithFormat:@"%f",rect.size.width] forKey:@"lbl2"];
            [vo.cellDataDic setObject:[NSString stringWithFormat:@"%f",rect.size.height] forKey:@"lbl3"];
            [vo.cellDataDic setObject:@"" forKey:@"lbl11"];
        }
    }
    [self reloadDataArray];
}



@end
