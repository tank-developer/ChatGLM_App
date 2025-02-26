//
//  AISettingService.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AISettingService.h"
#import "YYCreator.h"

@implementation AISettingService
-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic{
    NSMutableArray *dataArray = [dic objectForKey:@"data"];
    NSMutableArray *reArray = [[NSMutableArray alloc] init];
    NSString *AISettingVIPCell = @"AISettingVIPCell";
    NSString *AISettingSpaceCell = @"AISettingSpaceCell";
    NSString *AISettingShareCell = @"AISettingShareCell";
    NSString *AISettingContactUsCell = @"AISettingContactUsCell";
    NSString *AISettingVersionCell = @"AISettingVersionCell";
    NSString *AISettingClearCell = @"AISettingClearCell";
    
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
    
//    [reArray addObject:[YYCreator createCommon11LblCellVo:AICategoryWorkKeyWordCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:AISettingVIPCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:AISettingSpaceCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:AISettingShareCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:AISettingContactUsCell lbl1:@"1051136697@qq.com" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    [reArray addObject:[YYCreator createCommon11LblCellVo:AISettingVersionCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];

    [reArray addObject:[YYCreator createCommon11LblCellVo:AISettingClearCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:@"" dbDic:dic]];
    
    return reArray;
}


@end
