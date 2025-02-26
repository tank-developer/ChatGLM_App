//
//  SimpleChatMainViewController.m
//  SimpleChatPage
//
//  Created by 李海群 on 2018/6/15.
//  Copyright © 2018年 Gorilla. All rights reserved.
//

#import "SimpleChatMainViewController.h"
#import "MessageModel.h"
#import "MessageFrameModel.h"
#import "MessageCell.h"
#import "XJWTextView.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "ChatAITool.h"
#import "AICategoryVC.h"
#import "AIHistoryModelDao.h"
#import "CWSqliteModelTool.h"
#import "CommonUtil.h"
#import "AISettingVC.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define Font(a) [UIFont fontWithName:@"PingFangSC-Regular" size:a]

@interface SimpleChatMainViewController ()<UITableViewDelegate,UITableViewDataSource,ChatAIToolDelegate>{
    NSInteger count;
}

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, assign) int iPhoneX;
/**
 消息数组
 */
@property (nonatomic, strong) NSMutableArray *messages;



@property (nonatomic,strong)XJWTextView *xjwTextView;


@end

@implementation SimpleChatMainViewController

-(XJWTextView *)xjwTextView{
    if (!_xjwTextView) {
        _xjwTextView = [[XJWTextView alloc] initWithFrame:CGRectMake(0, kScreenheight, kScreenheight, 49)];
        _xjwTextView.backgroundColor = [UIColor clearColor];
        [_xjwTextView setPlaceholderText:@"输入问题..."];
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
-(void)addNavLeftBarButton{
    UIButton *backBtn = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 44, 44)];
    [backBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = item;
    [backBtn addTarget:self action:@selector(moreToVC:) forControlEvents:UIControlEventTouchUpInside];
}
-(void) addNavRightBarButton{
    UIButton *backBtn = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 44, 44)];
    [backBtn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.rightBarButtonItem = item;
    [backBtn addTarget:self action:@selector(pushNewVC:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    [ChatAITool shareInstance];
    [self setStatusBarBackgroundColor:[UIColor blackColor]];
    [self addNavLeftBarButton];
    [self addNavRightBarButton];
    
    self.title = @"聊天";
    if (kScreenHeight > 810) {
        self.iPhoneX = 10;
    }
    else
    {
        self.iPhoneX = 0;
    }
    [self createTableView];
    __weak SimpleChatMainViewController *weakSelf = self;
    self.xjwTextView.TextBlcok = ^(NSString * _Nonnull text) {
        [weakSelf addMessage:text type:MessageModelTypeMe];
        [weakSelf addMsgType:MessageModelTypeOther];
        [weakSelf requestAI:text];
    };
    [self.view addSubview:self.xjwTextView];
    [self addFirstMsgType:MessageModelTypeOther];
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
//    AIHistoryModelDao *dao = [AIHistoryModelDao new];
//    dao.content = text;
//    dao.user = @"me";
//    dao.historyId = [CommonUtil increase];
//    BOOL result = [CWSqliteModelTool insertOrUpdateModel:dao];
//    if(result){
//        NSArray *result = [CWSqliteModelTool queryAllModels:[AIHistoryModelDao class]];
//        NSLog(@"result:%@",result);
//    }
}
-(NSMutableArray *)messages
{
    if (_messages == nil) {
        _messages = [NSMutableArray new];
    }
    return _messages;
}


- (void) createTableView
{
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44 - self.iPhoneX) style:UITableViewStylePlain];
    self.mainTableView.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    self.mainTableView.dataSource=self;
    self.mainTableView.delegate=self;
    self.mainTableView.estimatedRowHeight = 0;
    self.mainTableView.estimatedSectionHeaderHeight = 0;
    self.mainTableView.estimatedSectionFooterHeight = 0;
    self.mainTableView.separatorStyle=NO;
    [self.view addSubview:self.mainTableView];
    self.mainTableView.backgroundColor = [UIColor blackColor];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, self.mainTableView.frame.origin.y + self.mainTableView.frame.size.height, SCREEN_WIDTH, 44)];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    
    UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenwidth/2-300/2, backView.frame.size.height/2-40/2, 300, 40)];
    bottomBtn.backgroundColor = [UIColor blackColor];
    [bottomBtn addTarget:self action:@selector(popKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:bottomBtn];
    bottomBtn.layer.cornerRadius = 10;
    bottomBtn.layer.masksToBounds = YES;
    bottomBtn.backgroundColor = [UIColor blackColor];
    [bottomBtn setTitleColor:[UIColor colorWithRed:178.0f/255.0f green:34.0f/255.0f blue:34.0f/255.0f alpha:1] forState:UIControlStateNormal];
    [bottomBtn setImage:[UIImage imageNamed:@"finger"] forState:UIControlStateNormal];
    [bottomBtn setTitle:@"轻触输入问题..." forState:UIControlStateNormal];
    int space = 10;
    bottomBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
    bottomBtn.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
}

-(void)popKeyboard:(UIButton *)btn{
    [self.xjwTextView.textView becomeFirstResponder];
    self.xjwTextView.textView.text = @"";
}
-(void)addMessage:(NSString *) content type:(MessageModelType) type
{
    MessageModel *compareM = (MessageModel *)[[self.messages lastObject] message];
    
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
    
    //修改模型并且将模型保存数组
    MessageModel * message = [[MessageModel alloc] init];
    message.type = type;
    message.text = content;
    message.time = strDate;
    message.hiddenTime = [message.time isEqualToString:compareM.time];
    
    
    MessageFrameModel *mf = [[MessageFrameModel alloc] init];
    mf.message = message;
    
    [self.messages addObject:mf];
    //刷新表格
    [self.mainTableView reloadData];
}
-(void)addFirstMsgType:(MessageModelType) type{
    MessageModel *compareM = (MessageModel *)[[self.messages lastObject] message];
    
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
    
    //修改模型并且将模型保存数组
    MessageModel * message = [[MessageModel alloc] init];
    message.type = type;
    message.text = @"你好，我是你的AI助手，可以这么问我问题。如：什么是杨辉三角?";
    message.time = strDate;
    message.hiddenTime = [message.time isEqualToString:compareM.time];
    
    
    MessageFrameModel *mf = [[MessageFrameModel alloc] init];
    mf.message = message;
    
    [self.messages addObject:mf];
}

-(void)addMsgType:(MessageModelType) type{
    MessageModel *compareM = (MessageModel *)[[self.messages lastObject] message];
    
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
    message.hiddenTime = [message.time isEqualToString:compareM.time];
    
    
    MessageFrameModel *mf = [[MessageFrameModel alloc] init];
    mf.message = message;
    
    [self.messages addObject:mf];
    [self.mainTableView reloadData];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [MessageCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.messageFrame = self.messages[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageFrameModel *fm = [self.messages objectAtIndex:indexPath.row];
    return fm.cellHeight;
}


-(void)didReceiveData:(NSString *)content{
    
    MessageFrameModel *fm = [self.messages lastObject];
    
    MessageModel *compareM = (MessageModel *)[[self.messages lastObject] message];
    
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    
    //修改模型并且将模型保存数组
    MessageModel * message = [[MessageModel alloc] init];
    message.type = MessageModelTypeOther;
    message.text = content;
    message.time = strDate;
    message.hiddenTime = [message.time isEqualToString:compareM.time];
    fm.message = message;
    [self.mainTableView reloadData];
    [self scrollToBottomRow];
}

- (void)connectionDidFinishLoading:(NSString *)content{
    [self insert:content user:@"assistant"];
}
-(void)didFailWithError:(NSString *)content{
    [self popupMsgAlertView:@"" message:content];
    [self insert:content user:@"assistant"];
}
-(void)scrollToBottomRow{
    NSIndexPath * path = [NSIndexPath indexPathForRow:self.messages.count - 1 inSection:0];
    [self.mainTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

-(void)moreToVC:(id)sender{
    AICategoryVC *vc = [[AICategoryVC alloc] init];
    [self pushToNextVCWith:vc ishidesBottomBar:YES animated:YES];
}
-(void)pushNewVC:(id)sender{
    AISettingVC *vc = [AISettingVC new];
    [self pushToNextVCWith:vc ishidesBottomBar:YES animated:YES];
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

@end
