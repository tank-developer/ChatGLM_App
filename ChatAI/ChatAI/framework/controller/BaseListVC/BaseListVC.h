//
//  BaseListVC.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTableViewVC.h"
#import "BaseTableViewVC.h"
#import "BaseView.h"
//#import "SizeConstant.h"
#import "BaseTableView.h"
#import "BaseTableViewVo.h"
#import "BaseTableCellVo.h"
#import "ListPamVo.h"
@interface BaseListVC : BaseTableViewVC
-(void)requestWithURL:url withParameter:(NSMutableDictionary *)pamDic loadingText:(NSString *) loadingText refreshListEveryMins:(int) refreshListEveryMins;
-(void)requestWithURL:url withParameter:(NSMutableDictionary *)pamDic loadingText:(NSString *) loadingText refreshListEveryMins:(int) refreshListEveryMins listPamVo:(ListPamVo *)listPamVo;
@property(nonatomic, strong) NSString *isTableViewLoading;
-(void)handlePullTableViewAction;
-(void)handleDropDownTableViewAction;
-(void)dropdownTableViewAction:(NSString *)isTableViewLoading commpleteDropdownTableViewAction:(void(^)(NSString *isTableViewLoading))commpleteDropdownTableViewAction;
@property(nonatomic) float dropdownTableViewRatio;
@property(nonatomic) float pullTableViewRatio;
@end
