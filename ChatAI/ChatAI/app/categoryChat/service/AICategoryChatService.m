//
//  AICategoryChatService.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AICategoryChatService.h"
#import "YYCreator.h"
#import "AIHistoryModelDao.h"
#import "MessageModel.h"
#import "MessageFrameModel.h"

@implementation AICategoryChatService


-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic{
    NSMutableArray *dataArray = [dic objectForKey:@"data"];
    NSMutableArray *reArray = [[NSMutableArray alloc] init];
    NSString *AIChatHistoryCell = @"AIChatHistoryCell";
    
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
    MessageFrameModel *model = [self getFrameModel:MessageModelTypeOther content:@"你好,我说AI助手" date:strDate];
    
    [reArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic]];
    
//    for (int i = 0; i < dataArray.count; i++) {
//        AIHistoryModelDao *dao = [dataArray objectAtIndex:i];
//        if([dao.user isEqualToString:@"me"]){
//            MessageFrameModel *model = [self getFrameModel:MessageModelTypeMe content:@"" date:@""];
//            [reArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:dao.content lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic]];
//        }else if ([dao.user isEqualToString:@"assistant"]){
//            MessageFrameModel *model = [self getFrameModel:MessageModelTypeOther content:@"" date:@""];
//            [reArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:dao.content lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic]];
//        }
//    }
    return reArray;
}
-(MessageFrameModel *)getFrameModel:(MessageModelType )type content:(NSString *)text date:(NSString *)date{
    //修改模型并且将模型保存数组
    MessageModel * message = [[MessageModel alloc] init];
    message.type = type;
    message.text = text;
    message.time = date;
//    message.hiddenTime = [message.time isEqualToString:compareM.time];
    MessageFrameModel *mf = [[MessageFrameModel alloc] init];
    mf.message = message;
    return mf;
}
@end
