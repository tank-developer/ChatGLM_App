//
//  AIHistoryVC.m
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "AIHistoryVC.h"
#import "AIChatContentAssistantCell.h"
#import "AIChatContentUserCell.h"
#import "CWSqliteModelTool.h"
#import "AIHistoryModelDao.h"
#import "MessageFrameModel.h"
#import "AIChatHistoryCell.h"

@interface AIHistoryVC ()

@end

@implementation AIHistoryVC

-(BaseTableView *) getBaseTableView{
    return self.historyView;
}
- (void)initService{
    self.historyService = [[AIHistoryService alloc] init];
}
- (void)initBaseVo{
    self.historyVo = [[AIHistoryVo alloc] init];
}
-(BaseTemplateService *) getBaseTemplateService{
    return self.historyService;
}
- (BaseTableViewVo *)getBaseTableViewVo {
    return self.historyVo;
}
-(NSString *) getVCName{
    return @"AIHistoryVC";
}

-(void)initBaseView{
    [self addNavtionItemTitleView:@"聊天记录"];
    self.historyView = [[AIHistoryView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.historyView];
    self.historyView.baseTableView.backgroundColor = [UIColor blackColor];
    self.historyView.baseTableView.estimatedRowHeight = 0;
    self.historyView.baseTableView.estimatedSectionHeaderHeight = 0;
    self.historyView.baseTableView.estimatedSectionFooterHeight = 0;
    self.historyView.baseTableView.separatorStyle=NO;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSArray *result = [CWSqliteModelTool queryAllModels:[AIHistoryModelDao class]];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:result forKey:@"data"];
    self.historyVo = [[AIHistoryVo alloc] initByDic:dic];
    [self.historyView reloadView:self.historyVo];
}

#pragma mark - UITableViewDataSource Mothods 这块可以用反射实现，暂时先这样用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AIChatContentUserCell *chatContentUserCell = nil;
    AIChatContentAssistantCell *chatContentAssistantCell = nil;
    AIChatHistoryCell *chatHistoryCell = nil;
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.historyVo];
    if ([@"AIChatHistoryCell" isEqualToString:baseTableCellVo.cellName]){
            [tableView registerClass:[AIChatHistoryCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
            chatHistoryCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
            if (chatHistoryCell == nil) {
                chatHistoryCell = [[AIChatHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
            }
            [chatHistoryCell setCellDataByCellVo:baseTableCellVo];
            chatHistoryCell.contentView.backgroundColor = [UIColor blackColor];
            chatHistoryCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return chatHistoryCell;
        }
    return chatHistoryCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.historyVo];
    if ([@"AIChatHistoryCell" isEqualToString:baseTableCellVo.cellName]){
        MessageFrameModel *model = [baseTableCellVo.cellDataDic objectForKey:@"lbl11"];
        return model.cellHeight;
    }
    return 0;
}
@end
