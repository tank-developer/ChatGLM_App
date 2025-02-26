//
//  AICategoryWorkVo.m
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "AICategoryWorkVo.h"

@implementation AICategoryWorkVo

- (instancetype)initByDic:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.categoryWorkService = [[AICategoryWorkService alloc] init];
        self.cellVoArray = [self.categoryWorkService getCellVoArray:dic];
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

-(void)refreshKeyWords:(NSString *)keyWords{
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            [vo.cellDataDic setObject:keyWords forKey:@"lbl1"];
        }
    }
    [self reloadDataArray];
}
-(void)refreshContent:(NSString *)content{
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            [vo.cellDataDic setObject:content forKey:@"lbl1"];
        }
    }
    [self reloadDataArray];
}

-(NSMutableDictionary *)getContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的文案",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}

-(NSMutableDictionary *)getSpeechContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的演讲稿",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getAdContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的广告文案",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getHappyToYouContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的祝福语",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getSorryBookContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的检讨书",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getZongJieContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的总结",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getReportContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的报告",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getDayReportContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的日报",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getMonthReportContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"请用%@作为主题",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            str = [NSString stringWithFormat:@"%@写一篇%@字的月报",str,[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"count"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(void)refreshTextView:(NSMutableDictionary *)dic{
    NSString *content = [dic objectForKey:@"content"];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkTextViewCell"]){
            [vo.cellDataDic setObject:content forKey:@"lbl1"];
        }
    }
    [self reloadDataArray];
}

-(void)refreshReset{
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkContentCell"]){
            [vo.cellDataDic setObject:@"" forKey:@"lbl1"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            [vo.cellDataDic setObject:@"" forKey:@"lbl1"];
        }
        if([vo.cellName isEqualToString:@"AICategoryWorkTextViewCell"]){
            [vo.cellDataDic setObject:@"" forKey:@"lbl1"];
        }
    }
    [self reloadDataArray];
}

@end
