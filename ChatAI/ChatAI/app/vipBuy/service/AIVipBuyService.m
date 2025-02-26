//
//  AIVipBuyService.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AIVipBuyService.h"
#import "YYCreator.h"

@implementation AIVipBuyService

-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic{
    NSMutableArray *dataArray = [dic objectForKey:@"data"];
    NSMutableArray *reArray = [[NSMutableArray alloc] init];
    NSString *AIVipBuyLblCell = @"AIVipBuyLblCell";

    
//    MessageFrameModel *model = [self getFrameModel:MessageModelTypeOther content:@"你好,我说AI助手" date:strDate];
    
//    [reArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic]];
    
    [reArray addObject:[YYCreator createCommon11LblCellVo:AIVipBuyLblCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];


    return reArray;
}

@end
