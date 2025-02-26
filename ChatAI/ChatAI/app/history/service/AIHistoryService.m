//
//  AIHistoryService.m
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "AIHistoryService.h"
#import "YYCreator.h"
#import "AIHistoryModelDao.h"
#import "MessageModel.h"
#import "MessageFrameModel.h"

@implementation AIHistoryService

-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic{
    NSMutableArray *dataArray = [dic objectForKey:@"data"];
    
    NSMutableArray *reArray = [[NSMutableArray alloc] init];
    NSString *AIChatHistoryCell = @"AIChatHistoryCell";
    
    for (int i = 0; i < dataArray.count; i++) {
        AIHistoryModelDao *dao = [dataArray objectAtIndex:i];
        if([dao.user isEqualToString:@"me"]){
            MessageFrameModel *model = [self getFrameModel:MessageModelTypeMe content:dao.content date:dao.date];
            [reArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:dao.content lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic]];
        }else if ([dao.user isEqualToString:@"assistant"]){
            MessageFrameModel *model = [self getFrameModel:MessageModelTypeOther content:dao.content date:dao.date];
            [reArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:dao.content lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:model dbDic:dic]];
        }
    }
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
