//
//  AISettingVC.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AISettingVC.h"
#import "AISettingSpaceCell.h"
#import "AISettingVIPCell.h"
#import "AISettingShareCell.h"
#import "AISettingContactUsCell.h"
#import "AISettingVersionCell.h"
#import "AIVipBuyVC.h"
#import "CWSqliteModelTool.h"
#import "AIHistoryModelDao.h"


@interface AISettingVC ()

@end

@implementation AISettingVC

-(BaseTableView *) getBaseTableView{
    return self.settingView;
}
- (void)initService{
    self.settingService = [[AISettingService alloc] init];
}
- (void)initBaseVo{
    self.settingVo = [[AISettingVo alloc] init];
}
-(BaseTemplateService *) getBaseTemplateService{
    return self.settingService;
}
- (BaseTableViewVo *)getBaseTableViewVo {
    return self.settingVo;
}
-(NSString *) getVCName{
    return @"AISettingVC";
}
-(void)initBaseView{
    [self addNavtionItemTitleView:@""];
    self.settingView = [[AISettingView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.settingView];
    self.settingVo = [[AISettingVo alloc] initByDic:[NSMutableDictionary new]];
    [self.settingView reloadView:self.settingVo];
    self.settingView.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blackColor];
}

#pragma mark - UITableViewDataSource Mothods 这块可以用反射实现，暂时先这样用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AISettingVIPCell *settingVIPCell = nil;
    AISettingSpaceCell *settingSpaceCell = nil;
    AISettingShareCell *settingShareCell = nil;
    AISettingContactUsCell *settingContactUsCell =nil;
    AISettingVersionCell *settingVersionCell = nil;
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.settingVo];
    if ([@"AISettingVIPCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AISettingVIPCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        settingVIPCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (settingVIPCell == nil) {
            settingVIPCell = [[AISettingVIPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [settingVIPCell setCellDataByCellVo:baseTableCellVo];
        settingVIPCell.backgroundColor = [UIColor blackColor];
        settingVIPCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return settingVIPCell;
    }else if ([@"AISettingSpaceCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AISettingSpaceCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        settingSpaceCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (settingSpaceCell == nil) {
            settingSpaceCell = [[AISettingSpaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [settingSpaceCell setCellDataByCellVo:baseTableCellVo];
        settingSpaceCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return settingSpaceCell;
    }else if ([@"AISettingShareCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AISettingShareCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        settingShareCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (settingShareCell == nil) {
            settingShareCell = [[AISettingShareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [settingShareCell setCellDataByCellVo:baseTableCellVo];
        settingShareCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return settingShareCell;
    }else if ([@"AISettingContactUsCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AISettingContactUsCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        settingContactUsCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (settingContactUsCell == nil) {
            settingContactUsCell = [[AISettingContactUsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [settingContactUsCell setCellDataByCellVo:baseTableCellVo];
        settingContactUsCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return settingContactUsCell;
    }else if ([@"AISettingVersionCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AISettingVersionCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        settingVersionCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (settingVersionCell == nil) {
            settingVersionCell = [[AISettingVersionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [settingVersionCell setCellDataByCellVo:baseTableCellVo];
        settingVersionCell.textLabel.text = @"版本：1.0.0";
        settingVersionCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return settingVersionCell;
    }else if ([@"AISettingClearCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AISettingVersionCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        settingVersionCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (settingVersionCell == nil) {
            settingVersionCell = [[AISettingVersionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [settingVersionCell setCellDataByCellVo:baseTableCellVo];
        settingVersionCell.textLabel.textColor = [UIColor redColor];
        settingVersionCell.textLabel.text = @"清除所有记录";
        settingVersionCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return settingVersionCell;
    }
    return settingVIPCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.settingVo];
    if ([@"AISettingVIPCell" isEqualToString:baseTableCellVo.cellName]){
        return 100;
    }else if ([@"AISettingSpaceCell" isEqualToString:baseTableCellVo.cellName]){
        return 1;
    }else if ([@"AISettingShareCell" isEqualToString:baseTableCellVo.cellName] || [@"AISettingContactUsCell" isEqualToString:baseTableCellVo.cellName] || [@"AISettingVersionCell" isEqualToString:baseTableCellVo.cellName] || [@"AISettingClearCell" isEqualToString:baseTableCellVo.cellName]){
        return 60;
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.settingVo];
    if([baseTableCellVo.cellName isEqualToString:@"AISettingVIPCell"]){
        AIVipBuyVC *vc = [AIVipBuyVC new];
        [self presentViewController:vc animated:YES completion:^{
        }];
    }
    if([@"AISettingClearCell" isEqualToString:baseTableCellVo.cellName]){
        [self popAlertViewWithTitle:@"提示" withMessage:@"删除数据将无法恢复" withButton1:@"确定" withButton2:@"取消"];
    }
}

-(void)handlePopupAlertViewButton1Action{
    BOOL result = [CWSqliteModelTool deleteTableAllData:[AIHistoryModelDao class] uid:nil targetId:nil isKeepTable:YES];
}
-(void)handlePopupAlertViewButton2Action{
}
@end
