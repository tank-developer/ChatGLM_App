//
//  AICategoryChatVC.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AICategoryChatVC.h"
#import "AIChatHistoryCell.h"
#import "XJWTextView.h"
#import "ChatAITool.h"
#import "AIHistoryModelDao.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface AICategoryChatVC ()<ChatAIToolDelegate>
@property (nonatomic,strong)XJWTextView *xjwTextView;
@end

@implementation AICategoryChatVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

-(XJWTextView *)xjwTextView{
    if (!_xjwTextView) {
        _xjwTextView = [[XJWTextView alloc] initWithFrame:CGRectMake(0, kScreenheight, kScreenheight, 49)];
        _xjwTextView.backgroundColor = [UIColor clearColor];
        [_xjwTextView setPlaceholderText:@"输入问题..."];
    }
    return _xjwTextView;
}
-(BaseTableView *) getBaseTableView{
    return self.categoryChatView;
}
- (void)initService{
    self.categoryChatService = [[AICategoryChatService alloc] init];
}
- (void)initBaseVo{
    self.categoryChatVo = [[AICategoryChatVo alloc] init];
}
-(BaseTemplateService *) getBaseTemplateService{
    return self.categoryChatService;
}
- (BaseTableViewVo *)getBaseTableViewVo {
    return self.categoryChatVo;
}
-(NSString *) getVCName{
    return @"AICategoryChatVC";
}
-(void)initBaseView{
    [self addNavtionItemTitleView:@"聊天记录"];
    self.categoryChatView = [[AICategoryChatView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.categoryChatView];
    
    self.categoryChatVo = [[AICategoryChatVo alloc] initByDic:[NSMutableDictionary new]];
    [self.categoryChatView reloadView:self.categoryChatVo];
    
    __weak AICategoryChatVC *weakSelf = self;
    self.xjwTextView.TextBlcok = ^(NSString * _Nonnull text) {
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setObject:text forKey:@"content"];
        [weakSelf.categoryChatVo addMsgMeType:MessageModelTypeMe text:text];
        [weakSelf.categoryChatVo addMsgOtherType:MessageModelTypeOther];
        [weakSelf requestAI:text];
    };
    [self.view addSubview:self.xjwTextView];
    [self.categoryChatView.bottomBtn addTarget:self action:@selector(popKeyboard:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - UITableViewDataSource Mothods 这块可以用反射实现，暂时先这样用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AIChatHistoryCell *chatHistoryCell = nil;
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.categoryChatVo];
    if ([@"AIChatHistoryCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AIChatHistoryCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        chatHistoryCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (chatHistoryCell == nil) {
            chatHistoryCell = [[AIChatHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [chatHistoryCell setCellDataByCellVo:baseTableCellVo];
        chatHistoryCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return chatHistoryCell;
    }
    return chatHistoryCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.categoryChatVo];
    if ([@"AIChatHistoryCell" isEqualToString:baseTableCellVo.cellName]){
        MessageFrameModel *model = [baseTableCellVo.cellDataDic objectForKey:@"lbl11"];
        return model.cellHeight;
    }
    return 0;
}
-(void)requestAI:(NSString *)text{
    if(text.length == 0){
        [self popupMsgAlertView:@"" message:@"请输入内容"];
        return;
    }
    ChatAITool *chataiTool = [ChatAITool shareInstance];
    chataiTool.delegate = self;
    [chataiTool setContent:text];
    //    [chataiTool setInvoteContent:text];
    [self scrollToBottomRow];
    [self insert:text user:@"me"];
}
-(void)scrollToBottomRow{
    NSIndexPath * path = [NSIndexPath indexPathForRow:self.categoryChatVo.cellVoArray.count - 1 inSection:0];
//    [self.categoryChatView.baseTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
-(void)insert:(NSString *)content user:(NSString *)usr{
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
    AIHistoryModelDao *dao = [AIHistoryModelDao new];
    dao.content = [NSString stringWithFormat:@"%@",content];
    dao.user = usr;
    dao.historyId = [CommonUtil increase];
    dao.date =strDate;
    BOOL result = [CWSqliteModelTool insertOrUpdateModel:dao];
}

-(void)didReceiveData:(NSString *)content{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:content forKey:@"content"];
    [self.categoryChatVo addRefreshVo:dic type:MessageModelTypeOther];
    [self.categoryChatView reloadView:self.categoryChatVo];
    [self scrollToBottomRow];
}
-(void)connectionDidFinishLoading:(NSString *)content{
    [self insert:content user:@"assistant"];
}
-(void)didFailWithError:(NSString *)content{
    [self popupMsgAlertView:@"" message:content];
    [self insert:content user:@"assistant"];
}
-(void)popKeyboard:(UIButton *)btn{
    [self.xjwTextView.textView becomeFirstResponder];
    self.xjwTextView.textView.text = @"";
}

@end
