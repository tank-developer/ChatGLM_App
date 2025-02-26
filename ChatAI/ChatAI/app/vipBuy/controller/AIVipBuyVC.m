//
//  AIVipBuyVC.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AIVipBuyVC.h"
#import "AIVipBuyLblCell.h"

@interface AIVipBuyVC ()

@end

@implementation AIVipBuyVC

-(BaseTableView *) getBaseTableView{
    return self.vipBuyView;
}
- (void)initService{
    self.vipBuyService = [[AIVipBuyService alloc] init];
}
- (void)initBaseVo{
    self.vipBuyVo = [[AIVipBuyVo alloc] init];
}
-(BaseTemplateService *) getBaseTemplateService{
    return self.vipBuyService;
}
- (BaseTableViewVo *)getBaseTableViewVo {
    return self.vipBuyVo;
}
-(NSString *) getVCName{
    return @"AIVipBuyVC";
}
-(void)initBaseView{
    [self addNavtionItemTitleView:@""];
    self.vipBuyView = [[AIVipBuyView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.vipBuyView];
    self.vipBuyVo = [[AIVipBuyVo alloc] initByDic:[NSMutableDictionary new]];
    [self.vipBuyView reloadView:self.vipBuyVo];
}

#pragma mark - UITableViewDataSource Mothods 这块可以用反射实现，暂时先这样用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AIVipBuyLblCell *vipBuyLblCell = nil;
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.vipBuyVo];
    if ([@"AIVipBuyLblCell" isEqualToString:baseTableCellVo.cellName]){
        [tableView registerClass:[AIVipBuyLblCell class] forCellReuseIdentifier:baseTableCellVo.cellName];
        vipBuyLblCell = [tableView dequeueReusableCellWithIdentifier:baseTableCellVo.cellName];
        if (vipBuyLblCell == nil) {
            vipBuyLblCell = [[AIVipBuyLblCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseTableCellVo.cellName];
        }
        [vipBuyLblCell setCellDataByCellVo:baseTableCellVo];
        vipBuyLblCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return vipBuyLblCell;
    }
    return vipBuyLblCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *baseTableCellVo = [super getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:self.vipBuyVo];
    if ([@"AIVipBuyLblCell" isEqualToString:baseTableCellVo.cellName]){
        return 650;
    }
    return 0;
}

@end
