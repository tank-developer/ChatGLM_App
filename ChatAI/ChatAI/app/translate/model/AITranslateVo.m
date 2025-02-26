//
//  AITranslateVo.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AITranslateVo.h"

@implementation AITranslateVo
- (instancetype)initByDic:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.translateService = [[AITranslateService alloc] init];
        self.cellVoArray = [self.translateService getCellVoArray:dic];
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
-(NSMutableDictionary *)getContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"%@翻译为英语",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getJapanTranslateContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"%@翻译为日语",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getFrenchTranslateContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"%@翻译为法语",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getKoreanTranslateContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"%@翻译为韩语",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getRussiaTranslateContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"%@翻译为俄语",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getVietnamTranslateContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"%@翻译为越南语",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
        }
    }
    [dic setObject:str forKey:@"content"];
    return dic;
}
-(NSMutableDictionary *)getThaiTranslateContent{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSString *str = [NSString new];
    for (int i = 0; i < self.cellVoArray.count; i++) {
        BaseTableCellVo *vo = [self.cellVoArray objectAtIndex:i];
        if([vo.cellName isEqualToString:@"AICategoryWorkKeyWordCell"]){
            str = [NSString stringWithFormat:@"%@翻译为越南语",[vo.cellDataDic objectForKey:@"lbl1"]];
            [dic setObject:[vo.cellDataDic objectForKey:@"lbl1"] forKey:@"keyword"];
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
