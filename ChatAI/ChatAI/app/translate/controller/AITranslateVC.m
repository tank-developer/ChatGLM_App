//
//  AITranslateVC.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AITranslateVC.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "XJWTextView.h"
#import "ChatAITool.h"
#import "ACategoryWorkBtnCell.h"
#import "CWSqliteModelTool.h"
#import "AIChatQuestionModel.h"
#import "AICategoryWorkTextViewCell.h"
#import "AICategoryWorkKeyWordCell.h"


@interface AITranslateVC ()<ChatAIToolDelegate>
@property (nonatomic,strong) NSUserDefaults *def;
@end

@implementation AITranslateVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [self removeLocalData];
    self.translateVo = [[AITranslateVo alloc] initByDic:[NSMutableDictionary new]];
    [self.translateView reloadView:self.translateVo];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(BaseTableView *) getBaseTableView{
    return self.translateView;
}
- (void)initService{
    self.translateService = [[AITranslateService alloc] init];
}
- (void)initBaseVo{
    self.translateVo = [[AITranslateVo alloc] init];
}
-(BaseTemplateService *) getBaseTemplateService{
    return self.translateService;
}
- (BaseTableViewVo *)getBaseTableViewVo {
    return self.translateVo;
}
-(NSString *) getVCName{
    return @"AITranslateVC";
}
-(void)initBaseView{
    self.translateView = [[AITranslateView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.translateView];
    [self addNavtionItemTitleView:[self.contentDic objectForKey:@"content"]];

    self.def = [NSUserDefaults standardUserDefaults];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(terminate:)
                                                   name:UIApplicationWillTerminateNotification
                                                 object:nil];
}

#pragma mark - UITableViewDataSource Mothods 这块可以用反射实现，暂时先这样用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AICategoryWorkKeyWordCell *categoryWorkKeyWordCell = nil;
    AICategoryWorkTextViewCell *categoryWorkTextViewCell = nil;
    ACategoryWorkBtnCell *categoryWorkBtnCell = nil;
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.translateVo];
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
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.translateVo];
    if ([@"AICategoryWorkKeyWordCell" isEqualToString:baseTableCellVo.cellName]){
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
    NSIndexPath *indexPath = [self.translateView.baseTableView indexPathForCell:cell];
    if(indexPath.row == 0){
        [self.translateVo refreshKeyWords:sender.text];
    }
}
-(void)comfirmAction:(UIButton *)sender{
    ACategoryWorkBtnCell *cell = (ACategoryWorkBtnCell *)sender.superview.superview;
    [self.translateView.baseTableView indexPathForCell:cell];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    if([[self.contentDic objectForKey:@"content"] isEqualToString:@"英文翻译"]){
        dic = [self.translateVo getContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"日文翻译"]){
        dic = [self.translateVo getJapanTranslateContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"法语翻译"]){
        dic = [self.translateVo getFrenchTranslateContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"韩语翻译"]){
        dic = [self.translateVo getKoreanTranslateContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"俄语翻译"]){
        dic = [self.translateVo getRussiaTranslateContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"越南语翻译"]){
        dic = [self.translateVo getVietnamTranslateContent];
    }else if ([[self.contentDic objectForKey:@"content"] isEqualToString:@"泰语翻译"]){
        dic = [self.translateVo getThaiTranslateContent];
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
    [self.translateVo refreshReset];
    [self.translateView reloadView:self.translateVo];
    [self removeLocalData];
}
-(void)terminate:(NSNotificationCenter *)notification{
    [self removeLocalData];
}
-(void)removeLocalData{
    [self.def removeObjectForKey:@"english"];
    [self.def synchronize];
    BOOL result = [CWSqliteModelTool deleteTableAllData:[AIChatQuestionModel class] uid:nil targetId:nil isKeepTable:YES];
    [CommonUtil deleteQuestionId];
}
-(NSString *)getPreTextFieldText:(NSString *)content{
    NSString *sendContent = @"";
    NSString *zuowen = [NSString stringWithFormat:@"%@",[self.def objectForKey:@"english"]];
    if(zuowen.length == 0 || [zuowen isEqualToString:@"(null)"]){
        [self.def setObject:content forKey:@"english"];
        [self.def synchronize];
        sendContent = content;
    }else{
        if([content isEqualToString:zuowen]){
            sendContent = @"继续";
            [self.def setObject:content forKey:@"english"];
            [self.def synchronize];
        }else{
            sendContent = content;
            [self.def removeObjectForKey:@"english"];
            [self.def synchronize];
        }
    }
    return sendContent;
}
-(void)didReceiveData:(NSString *)content{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:content forKey:@"content"];
    [self.translateVo refreshTextView:dic];
    [self.translateView reloadView:self.translateVo];
}
-(void)connectionDidFinishLoading:(NSString *)content{
    
}
-(void)didFailWithError:(NSString *)content{
    [self popupMsgAlertView:@"" message:content];
}
@end
