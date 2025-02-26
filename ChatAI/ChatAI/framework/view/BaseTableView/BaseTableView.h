//
//  BaseTableView.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTemplateView.h"
#import "YYUITableView.h"
#import "BaseTemplateView.h"
#import "BaseTableViewVo.h"

@interface BaseTableView : BaseTemplateView
@property (nonatomic,strong) YYUITableView *baseTableView;
-(void) reloadView:(BaseTableViewVo *)baseTableViewVo;
-(void) reloadTableViewImmediately;
-(void) reloadTableView;
-(void) reloadOtherViewsByVo:(BaseTableViewVo *)baseTableViewVo;
@end
