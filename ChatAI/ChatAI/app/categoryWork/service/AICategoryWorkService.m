//
//  AICategoryWorkService.m
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "AICategoryWorkService.h"
#import "YYCreator.h"
#import "MessageFrameModel.h"

@implementation AICategoryWorkService

-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic{
    NSMutableArray *dataArray = [dic objectForKey:@"data"];
    NSMutableArray *reArray = [[NSMutableArray alloc] init];
    NSString *AICategoryWorkKeyWordCell = @"AICategoryWorkKeyWordCell";
    NSString *AICategoryWorkContentCell = @"AICategoryWorkContentCell";
    NSString *AICategoryWorkTextViewCell = @"AICategoryWorkTextViewCell";
    NSString *ACategoryWorkBtnCell = @"ACategoryWorkBtnCell";
    NSString *ACategoryWorkResetBtnCell = @"ACategoryWorkResetBtnCell";
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
//    MessageFrameModel *model = [self getFrameModel:MessageModelTypeOther content:@"你好,我说AI助手" date:strDate];
    
//    [reArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic]];
    
    [reArray addObject:[YYCreator createCommon11LblCellVo:AICategoryWorkKeyWordCell lbl1:@"" lbl2:@"请告诉AI你想写关于什么的内容？" lbl3:@"如:生活" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
//    [reArray addObject:[YYCreator createCommon11LblCellVo:AICategoryWorkKeyWordCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:AICategoryWorkContentCell lbl1:@"" lbl2:@"文案长度" lbl3:@"如:100" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:AICategoryWorkTextViewCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:ACategoryWorkResetBtnCell lbl1:@"重置" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:ACategoryWorkBtnCell lbl1:@"确定" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];

    return reArray;
}

@end
