//
//  AIChatService.m
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "AIChatService.h"
#import "YYCreator.h"
#import "CommonUtil.h"
#import "AIChatMessageModel.h"

@implementation AIChatService
-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic{
    NSMutableArray *dataArray = [dic objectForKey:@"result"];
    
    NSMutableArray *reArray = [[NSMutableArray alloc] init];
    AIChatMessageModel *model = [AIChatMessageModel new];
    
    NSString *AIChatContentUserCell = @"AIChatContentUserCell";
    NSString *AIChatContentAssistantCell = @"AIChatContentAssistantCell";
    
//    [reArray addObject:[YYCreator createCommon11LblCellVo:AIChatContentUserCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
//    [reArray addObject:[YYCreator createCommon11LblCellVo:AIChatContentAssistantCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [YYCreator createCommon11LblAndModelCellVo:AIChatContentUserCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic];
    [YYCreator createCommon11LblAndModelCellVo:AIChatContentAssistantCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic];

    return reArray;
}

@end
