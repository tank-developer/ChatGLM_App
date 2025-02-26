//
//  AIChatVC.m
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "AIChatVC.h"
#import "AIChatContentAssistantCell.h"
#import "AIChatContentUserCell.h"
#import "XJWTextView.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "ChatAITool.h"

@interface AIChatVC ()<ChatAIToolDelegate>
@property (nonatomic,strong)XJWTextView *xjwTextView;
@end

@implementation AIChatVC

-(XJWTextView *)xjwTextView{
    if (!_xjwTextView) {
        _xjwTextView = [[XJWTextView alloc] initWithFrame:CGRectMake(0, kScreenheight, kScreenheight, 49)];
        _xjwTextView.backgroundColor = [UIColor clearColor];
        [_xjwTextView setPlaceholderText:@"评论下"];
    }
    return _xjwTextView;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}
-(BaseTableView *) getBaseTableView{
    return self.chatView;
}
- (void)initService{
    self.chatService = [[AIChatService alloc] init];
}
- (void)initBaseVo{
    self.chatVo = [[AIChatVo alloc] init];
}
-(BaseTemplateService *) getBaseTemplateService{
    return self.chatService;
}
- (BaseTableViewVo *)getBaseTableViewVo {
    return self.chatVo;
}
-(NSString *) getVCName{
    return @"AIChatVC";
}
-(void)addNavLeftBarButton{
    
}
-(void)initBaseView{
    self.chatView = [[AIChatView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.chatView];
    self.chatVo = [[AIChatVo alloc] initByDic:[NSMutableDictionary new]];
    [self.chatView reloadView:self.chatVo];
    __weak AIChatVC *weakSelf = self;
    self.xjwTextView.TextBlcok = ^(NSString * _Nonnull text) {
        [weakSelf.chatVo refreshVo:text];
        [weakSelf.chatView reloadView:weakSelf.chatVo];
    };
    [self.view addSubview:self.xjwTextView];
    ChatAITool *chataiTool = [ChatAITool shareInstance];
    chataiTool.delegate = self;
//    [chataiTool setContent:@"你是谁"];
}

#pragma mark - UITableViewDataSource Mothods 这块可以用反射实现，暂时先这样用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AIChatContentUserCell *chatContentUserCell = nil;
    AIChatContentAssistantCell *chatContentAssistantCell = nil;
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.chatVo];
    if (baseTableCellVo != nil) {
        if ([@"AIChatContentUserCell" isEqualToString:baseTableCellVo.cellName]) {
            [tableView registerClass:[AIChatContentUserCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
            chatContentUserCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
            if (chatContentUserCell == nil) {
                chatContentUserCell = [[AIChatContentUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
            }
            [chatContentUserCell setCellDataByCellVo:baseTableCellVo];
            chatContentUserCell.backgroundColor = [UIColor redColor];
            chatContentUserCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return chatContentUserCell;
        }else if ([@"AIChatContentAssistantCell" isEqualToString:baseTableCellVo.cellName]){
            [tableView registerClass:[AIChatContentAssistantCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
            chatContentAssistantCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
            if (chatContentAssistantCell == nil) {
                chatContentAssistantCell = [[AIChatContentAssistantCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
            }
            [chatContentAssistantCell setCellDataByCellVo:baseTableCellVo];
            chatContentAssistantCell.backgroundColor = [UIColor lightGrayColor];
            chatContentAssistantCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return chatContentAssistantCell;
        }
    }
    return chatContentUserCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.chatVo];
    if ([@"AIChatContentUserCell" isEqualToString:baseTableCellVo.cellName]) {
        return 60;
    }else if ([@"AIChatContentAssistantCell" isEqualToString:baseTableCellVo.cellName]){
        return 20;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.chatVo];
    [self.xjwTextView.textView becomeFirstResponder];
    self.xjwTextView.textView.text = @"";
}
-(void)didReceiveData:(NSString *)content{
    NSLog(@"didReceiveData===:%@",content);
}
- (void)scrollTableViewBottom
{
//    if (self.dataSource.count > 0)
//    {
//        [self.chatView.baseTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_dataSource.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
//    }
}

@end
