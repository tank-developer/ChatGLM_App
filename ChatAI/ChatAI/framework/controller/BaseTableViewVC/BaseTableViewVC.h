//
//  BaseTableViewVC.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTemplateVC.h"
#import "BaseView.h"
//#import "SizeConstant.h"
#import "BaseTableView.h"
#import "BaseTableViewVo.h"
#import "BaseTableCellVo.h"

@interface BaseTableViewVC : BaseTemplateVC<UITableViewDelegate,UITableViewDataSource>
- (float)getTableViewRowHeight ;
- (void)initBaseView :(BaseTableView *) baseTableView;
- (void)initBaseVo :(BaseTableViewVo *) baseTableViewVo;
-(BaseTableCellVo *) getBaseTableCellVoByIndexPath:(NSIndexPath *)indexPath baseTableViewVo:(BaseTableViewVo *)baseTableViewVo;
-(BaseTableCellVo *) getBaseTableCellVoByCellKey:(BaseTableViewVo *)baseTableViewVo cellKey:(NSString *)cellKey;
-(BaseTableView *) getBaseTableView;
-(void)removeCellFromTableView:(UITableView *)tableView toBeRemoveVo:(BaseTableCellVo *)toBeRemoveVo cellIndexPath:(NSIndexPath *)cellIndexPath;

@end
