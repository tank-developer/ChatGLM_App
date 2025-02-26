//
//  AICategoryWorkVC.m
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "AICategoryWorkVC.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "XJWTextView.h"
#import "ChatAITool.h"
#import "AICategoryWorkKeyWordCell.h"
#import "AICategoryWorkCententLenghtCell.h"
#import "AICategoryWorkTextViewCell.h"
#import "ACategoryWorkBtnCell.h"
#import "AppDelegate.h"
#import "CWSqliteModelTool.h"
#import "AIChatQuestionModel.h"


@interface AICategoryWorkVC ()<ChatAIToolDelegate>
@property (nonatomic,strong) NSUserDefaults *def;
@end

@implementation AICategoryWorkVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    BOOL result = [CWSqliteModelTool deleteTableAllData:[AIChatQuestionModel class] uid:nil targetId:nil isKeepTable:YES];
    [CommonUtil deleteQuestionId];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [self removeLocalData];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(BaseTableView *) getBaseTableView{
    return self.categoryWorkView;
}
- (void)initService{
    self.categoryWorkService = [[AICategoryWorkService alloc] init];
}
- (void)initBaseVo{
    self.categoryWorkVo = [[AICategoryWorkVo alloc] init];
}
-(BaseTemplateService *) getBaseTemplateService{
    return self.categoryWorkService;
}
- (BaseTableViewVo *)getBaseTableViewVo {
    return self.categoryWorkVo;
}
-(NSString *) getVCName{
    return @"AICategoryWorkVC";
}
-(void)initBaseView{
    self.categoryWorkView = [[AICategoryWorkView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.categoryWorkView];
    self.categoryWorkVo = [[AICategoryWorkVo alloc] initByDic:[NSMutableDictionary new]];
    [self.categoryWorkView reloadView:self.categoryWorkVo];
    self.def = [NSUserDefaults standardUserDefaults];
    [self addNavtionItemTitleView:[self.contentDic objectForKey:@"content"]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(terminate:)
                                                   name:UIApplicationWillTerminateNotification
                                                 object:nil];
    
}

#pragma mark - UITableViewDataSource Mothods 这块可以用反射实现，暂时先这样用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AICategoryWorkKeyWordCell *categoryWorkKeyWordCell = nil;
    AICategoryWorkCententLenghtCell *categoryWorkCententLenghtCell = nil;
    AICategoryWorkTextViewCell *categoryWorkTextViewCell = nil;
    ACategoryWorkBtnCell *categoryWorkBtnCell = nil;
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.categoryWorkVo];
    if ([@"AICategoryWorkKeyWordCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AICategoryWorkKeyWordCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        categoryWorkKeyWordCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (categoryWorkKeyWordCell == nil) {
            categoryWorkKeyWordCell = [[AICategoryWorkKeyWordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [categoryWorkKeyWordCell setCellDataByCellVo:baseTableCellVo];
        categoryWorkKeyWordCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [categoryWorkKeyWordCell.titeField addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged|UIControlEventEditingChanged];
        return categoryWorkKeyWordCell;
    }else if ([@"AICategoryWorkContentCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AICategoryWorkKeyWordCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        categoryWorkKeyWordCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (categoryWorkKeyWordCell == nil) {
            categoryWorkKeyWordCell = [[AICategoryWorkKeyWordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [categoryWorkKeyWordCell setCellDataByCellVo:baseTableCellVo];
        categoryWorkKeyWordCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [categoryWorkKeyWordCell.titeField addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged|UIControlEventEditingChanged];
        return categoryWorkKeyWordCell;
    }else if ([@"AICategoryWorkTextViewCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AICategoryWorkTextViewCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        categoryWorkTextViewCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (categoryWorkTextViewCell == nil) {
            categoryWorkTextViewCell = [[AICategoryWorkTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [categoryWorkTextViewCell setCellDataByCellVo:baseTableCellVo];
        categoryWorkTextViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return categoryWorkTextViewCell;
    }else if ([@"ACategoryWorkResetBtnCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[ACategoryWorkBtnCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        categoryWorkBtnCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (categoryWorkBtnCell == nil) {
            categoryWorkBtnCell = [[ACategoryWorkBtnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [categoryWorkBtnCell setCellDataByCellVo:baseTableCellVo];
        categoryWorkBtnCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [categoryWorkBtnCell.comfirmBtn addTarget:self action:@selector(resetAction:) forControlEvents:UIControlEventTouchUpInside];
        return categoryWorkBtnCell;
    }else if ([@"ACategoryWorkBtnCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[ACategoryWorkBtnCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        categoryWorkBtnCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (categoryWorkBtnCell == nil) {
            categoryWorkBtnCell = [[ACategoryWorkBtnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [categoryWorkBtnCell setCellDataByCellVo:baseTableCellVo];
        categoryWorkBtnCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [categoryWorkBtnCell.comfirmBtn addTarget:self action:@selector(comfirmAction:) forControlEvents:UIControlEventTouchUpInside];
        return categoryWorkBtnCell;
    }
    return categoryWorkKeyWordCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.categoryWorkVo];
    if ([@"AICategoryWorkKeyWordCell" isEqualToString:baseTableCellVo.cellName]){
        return 120;
    }else if ([@"AICategoryWorkContentCell" isEqualToString:baseTableCellVo.cellName]){
        return 120;
    }else if ([@"AICategoryWorkTextViewCell" isEqualToString:baseTableCellVo.cellName]){
        return 200;
    }else if ([@"ACategoryWorkResetBtnCell" isEqualToString:baseTableCellVo.cellName]){
        return 60;
    }else if ([@"ACategoryWorkBtnCell" isEqualToString:baseTableCellVo.cellName]){
        return 60;
    }
    return 0;
}
-(void)valueChange:(UITextField *)sender{
    UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
    NSIndexPath *indexPath = [self.categoryWorkView.baseTableView indexPathForCell:cell];
    if(indexPath.row == 0){
        [self.categoryWorkVo refreshKeyWords:sender.text];
    }else if (indexPath.row == 1){
        [self.categoryWorkVo refreshContent:sender.text];
    }
}
-(void)comfirmAction:(UIButton *)sender{
    ACategoryWorkBtnCell *cell = (ACategoryWorkBtnCell *)sender.superview.superview;
    [self.categoryWorkView.baseTableView indexPathForCell:cell];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    if([[self.contentDic objectForKey:@"content"] isEqualToString:@"文案"]){
        dic = [self.categoryWorkVo getContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"演讲稿"]){
        dic = [self.categoryWorkVo getSpeechContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"广告"]){
        dic = [self.categoryWorkVo getAdContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"节日祝福语"]){
        dic = [self.categoryWorkVo getHappyToYouContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"检讨书"]){
        dic = [self.categoryWorkVo getSorryBookContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"总结"]){
        dic = [self.categoryWorkVo getZongJieContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"报告"]){
        dic = [self.categoryWorkVo getReportContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"日报"]){
        dic = [self.categoryWorkVo getDayReportContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"月报"]){
        dic = [self.categoryWorkVo getMonthReportContent];
    }
    
    if([NSString stringWithFormat:@"%@",[dic objectForKey:@"keyword"]].length == 0){
        [self popupMsgAlertView:@"" message:@"请输入关键字"];
        return;
    }
    if([NSString stringWithFormat:@"%@",[dic objectForKey:@"count"]].length == 0){
        [self popupMsgAlertView:@"" message:@"请输入字数"];
        return;
    }
    NSString *content = [dic objectForKey:@"content"];
    NSString *sendContent = [self getPreTextFieldText:content];
    ChatAITool *chataiTool = [ChatAITool shareInstance];
    chataiTool.delegate = self;
    [chataiTool setContent:sendContent];
    
    //    [chataiTool setInvoteContent:text];
}
-(void)resetAction:(UIButton *)sender{
    [self.categoryWorkVo refreshReset];
    [self.categoryWorkView reloadView:self.categoryWorkVo];
    [self removeLocalData];
}
-(NSString *)getPreTextFieldText:(NSString *)content{
    NSString *sendContent = @"";
    NSString *zuowen = [NSString stringWithFormat:@"%@",[self.def objectForKey:@"zuowen"]];
    if(zuowen.length == 0 || [zuowen isEqualToString:@"(null)"]){
        [self.def setObject:content forKey:@"zuowen"];
        [self.def synchronize];
        sendContent = content;
    }else{
        if([content isEqualToString:zuowen]){
            sendContent = @"继续";
            [self.def setObject:content forKey:@"zuowen"];
            [self.def synchronize];
        }else{
            sendContent = content;
            [self.def removeObjectForKey:@"zuowen"];
            [self.def synchronize];
        }
        
    }
    return sendContent;
}

-(void)didReceiveData:(NSString *)content{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:content forKey:@"content"];
    [self.categoryWorkVo refreshTextView:dic];
    [self.categoryWorkView reloadView:self.categoryWorkVo];
}
-(void)connectionDidFinishLoading:(NSString *)content{
    
}
-(void)didFailWithError:(NSString *)content{
    [self popupMsgAlertView:@"" message:content];
}

-(void)terminate:(NSNotificationCenter *)notification{
    [self.def removeObjectForKey:@"zuowen"];
    [self.def synchronize];
}
-(void)removeLocalData{
    [self.def removeObjectForKey:@"zuowen"];
    [self.def synchronize];
    BOOL result = [CWSqliteModelTool deleteTableAllData:[AIChatQuestionModel class] uid:nil targetId:nil isKeepTable:YES];
    [CommonUtil deleteQuestionId];
}
@end
