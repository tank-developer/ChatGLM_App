//
//  AICategoryChatVo.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AICategoryChatVo.h"
#import "MessageFrameModel.h"
#import "YYCreator.h"

@implementation AICategoryChatVo

- (instancetype)initByDic:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.categoryChatService = [[AICategoryChatService alloc] init];
        self.cellVoArray = [self.categoryChatService getCellVoArray:dic];
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

-(void)addRefreshVo:(NSMutableDictionary *)dic type:(MessageModelType )type{
    
    NSString *AIChatHistoryCell = @"AIChatHistoryCell";
    MessageModel *compareM = [MessageModel new];
    
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
//    //修改模型并且将模型保存数组
//    MessageModel * message = [[MessageModel alloc] init];
//    message.type = type;
//    message.text = [dic objectForKey:@"content"];
//    message.time = strDate;
//    message.hiddenTime = [message.time isEqualToString:compareM.time];
//
//    MessageFrameModel *mf = [[MessageFrameModel alloc] init];
//    mf.message = message;
    BaseTableCellVo *vo = [self.cellVoArray lastObject];
    MessageFrameModel *mf = [vo.cellDataDic objectForKey:@"lbl11"];
    MessageModel *mm = mf.message;
    mm.type = type;
    mm.text = [dic objectForKey:@"content"];
    mm.time = strDate;
    mm.hiddenTime = [mm.time isEqualToString:mm.time];
    mf.message = mm;
    [vo.cellDataDic setObject:mf forKey:@"lbl11"];
    vo.cellName = AIChatHistoryCell;

    
//    [self.cellVoArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:mf dbDic:dic]];
    
//    if (type == MessageModelTypeMe) {
//        MessageModel *compareM = [MessageModel new];
//
//        //当前用户发送时间
//        NSDate * date = [NSDate date];
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"HH:mm";
//        NSString *strDate = [formatter stringFromDate:date];
//
//
//        //修改模型并且将模型保存数组
//        MessageModel * message = [[MessageModel alloc] init];
//        message.type = type;
//        message.text = [dic objectForKey:@"content"];
//        message.time = strDate;
//        message.hiddenTime = [message.time isEqualToString:compareM.time];
//
//        MessageFrameModel *mf = [[MessageFrameModel alloc] init];
//        mf.message = message;
//        [self.cellVoArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:mf dbDic:dic]];
//
////            [self.messages addObject:mf];
//
//    }else if (type == MessageModelTypeOther){
//        MessageModel *compareM = [MessageModel new];
//
//        //当前用户发送时间
//        NSDate * date = [NSDate date];
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"HH:mm";
//        NSString *strDate = [formatter stringFromDate:date];
//
//
//        //修改模型并且将模型保存数组
//        MessageModel * message = [[MessageModel alloc] init];
//        message.type = type;
//        message.text = [dic objectForKey:@"content"];
//        message.time = strDate;
//        message.hiddenTime = [message.time isEqualToString:compareM.time];
//
//        MessageFrameModel *mf = [[MessageFrameModel alloc] init];
//        mf.message = message;
//        [self.cellVoArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:mf dbDic:dic]];
//    }
//    [self reloadDataArray];
}

-(void)addMsgMeType:(MessageModelType) type text:(NSString *)text{
    NSString *AIChatHistoryCell = @"AIChatHistoryCell";
    BaseTableCellVo *vo = (BaseTableCellVo *)[self.cellVoArray lastObject];
//    MessageModel *compareM = (MessageModel *)[[self.cellVoArray lastObject] message];
    MessageFrameModel *model = [vo.cellDataDic objectForKey:@"lbl11"];
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
    
    //修改模型并且将模型保存数组
    MessageModel * message = [[MessageModel alloc] init];
    message.type = type;
    message.text = text;
    message.time = strDate;
    message.hiddenTime = YES;
    
    
    MessageFrameModel *mf = [[MessageFrameModel alloc] init];
//    MessageFrameModel *mf = [vo.cellDataDic objectForKey:@"lbl11"];
    mf.message = message;
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [self.cellVoArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:mf dbDic:dic]];
    [self reloadDataArray];
}
-(void)addMsgOtherType:(MessageModelType) type{
    NSString *AIChatHistoryCell = @"AIChatHistoryCell";
    BaseTableCellVo *vo = (BaseTableCellVo *)[self.cellVoArray lastObject];
//    MessageModel *compareM = (MessageModel *)[[self.cellVoArray lastObject] message];
    MessageFrameModel *model = [vo.cellDataDic objectForKey:@"lbl11"];
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
    
    //修改模型并且将模型保存数组
    MessageModel * message = [[MessageModel alloc] init];
    message.type = type;
    message.text = @"";
    message.time = strDate;
    message.hiddenTime = YES;
    
    
    MessageFrameModel *mf = [[MessageFrameModel alloc] init];
//    MessageFrameModel *mf = [vo.cellDataDic objectForKey:@"lbl11"];
    mf.message = message;
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [self.cellVoArray addObject:[YYCreator createCommon11LblAndModelCellVo:AIChatHistoryCell lbl1:@"" lbl2:@"" lbl3:@"" lbl4:@"" lbl5:@"" lbl6:@"" lbl7:@"" lbl8:@"" lbl9:@"" lbl10:@"" lbl11:mf dbDic:dic]];
    [self reloadDataArray];
}

@end
