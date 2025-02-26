//
//  BaseListVC.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseListVC.h"
#import "CoreVC.h"
#import "BaseTableView.h"
#import "BaseTableViewVo.h"
#import "BaseTableCell.h"
#import "BaseTableCellVo.h"
#import "BaseListService.h"

@interface BaseListVC ()

@end

@implementation BaseListVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)initBaseVo :(BaseVo *) baseVo{
    [super initBaseVo:(BaseTableViewVo *)baseVo];
}

- (void)initBaseView :(BaseTableView *) baseTableView{
    [super initBaseView:baseTableView];
    self.isTableViewLoading = @"NO";
    self.dropdownTableViewRatio=0;
    self.pullTableViewRatio=0;
}


-(BaseTableView *) getBaseTableView{
    return nil;
}



-(BaseTemplateView *) getBaseTemplateView{
    return [self getBaseTableView];
}

-(BaseListService *) getBaseListService{
    return nil;
}
-(BaseTemplateService *) getBaseTemplateService{
    return [self getBaseListService];
}

-(void)requestWithURL:url withParameter:(NSMutableDictionary *)pamDic loadingText:(NSString *) loadingText refreshListEveryMins:(int) refreshListEveryMins{
    //    NSLog(@"getBaseListDao:%@",[[self getBaseListService] getBaseListDao]);
    //    if ([[[self getBaseListService] getBaseListDao] isTimeToRefreshListView:url refreshListEveryMins:refreshListEveryMins] == TRUE) {
    [super requestWithURL:url withParameter:pamDic loadingText:loadingText];
    //    }else{
    //        [self handleRequestWithURLSuccess:url];
    //    }
}

-(void)requestWithURL:url withParameter:(NSMutableDictionary *)pamDic loadingText:(NSString *) loadingText refreshListEveryMins:(int) refreshListEveryMins listPamVo:(ListPamVo *)listPamVo{
    pamDic = [listPamVo setPamVoValueToDic:pamDic];
    NSLog(@"pamDic:%@",pamDic);
    if (pamDic==nil) {
        NSLog(@"requestWithURL:urlpamDic==nilpamDic==nilpamDic==nilpamDic==nilpamDic==nilpamDic==nil");
    }
    return[self requestWithURL:url withParameter:pamDic loadingText:loadingText refreshListEveryMins:refreshListEveryMins];
}

-(void)dropdownTableViewAction:(NSString *)isTableViewLoading commpleteDropdownTableViewAction:(void(^)(NSString *isTableViewLoading))commpleteDropdownTableViewAction{
    self.isTableViewLoading=@"YES";
    [self handleDropDownTableViewAction];
    commpleteDropdownTableViewAction(@"NO");
}

-(void)pullTableViewAction:(NSString *)isTableViewLoading commpletePullTableViewAction:(void(^)(NSString *isTableViewLoading))commpletePullTableViewAction{
    self.isTableViewLoading=@"YES";
    [self handlePullTableViewAction];
    commpletePullTableViewAction(@"NO");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //通过下拉记载着最大的上下拉的方式
    float height = scrollView.contentSize.height > [self getBaseTableView].frame.size.height ? [self getBaseTableView].frame.size.height : scrollView.contentSize.height;
    if ([self isAbleToDropdownTableView] && [self.isTableViewLoading isEqualToString:@"NO"]) {
        float dropdownRatio = - scrollView.contentOffset.y / [self getBaseTableView].frame.size.height;
        if (self.dropdownTableViewRatio ==0 || self.dropdownTableViewRatio< dropdownRatio) {
            self.dropdownTableViewRatio=dropdownRatio;
        }
    }
    if ([self isAbleToPullTableView] && [self.isTableViewLoading isEqualToString:@"NO"]) {
        float pullRation =(height - scrollView.contentSize.height + scrollView.contentOffset.y) / height;
        if (self.pullTableViewRatio ==0 || self.pullTableViewRatio< pullRation) {
            self.pullTableViewRatio=pullRation;
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //如果下拉超过20% = 0.2
    if (self.dropdownTableViewRatio > 0.2) {
        [self dropdownTableViewAction:self.isTableViewLoading commpleteDropdownTableViewAction:^(NSString *isTableViewLoading) {
            self.isTableViewLoading=isTableViewLoading;
        }];
    }
    self.dropdownTableViewRatio=0;
    if (self.pullTableViewRatio > 0.2) {
        [self pullTableViewAction:self.isTableViewLoading commpletePullTableViewAction:^(NSString *isTableViewLoading) {
            self.isTableViewLoading=isTableViewLoading;
        }];
    }
    self.pullTableViewRatio=0;
}



-(BOOL) isAbleToPullTableView{
    return TRUE;
}
-(BOOL) isAbleToDropdownTableView{
    return TRUE;
}
-(void)handlePullTableViewAction{
}
-(void)handleDropDownTableViewAction{
}

@end
