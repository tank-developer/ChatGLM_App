//
//  BaseTableViewVC.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTableViewVC.h"
#import "CoreVC.h"
#import "BaseTableView.h"
#import "BaseTableViewVo.h"
#import "BaseTableCell.h"
#import "BaseTableCellVo.h"
#import "BaseTableCellVo.h"
#import "CommonUtil.h"
@interface BaseTableViewVC ()

@end

@implementation BaseTableViewVC

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
    baseVo = [[BaseVo alloc] init];
}
- (void)initBaseView :(BaseTableView *) baseTableView{
    [super initBaseView:baseTableView];
    baseTableView.baseTableView.delegate = self;
    baseTableView.baseTableView.dataSource = self;
    baseTableView.baseTableView.rowHeight = [self getTableViewRowHeight];
    self.automaticallyAdjustsScrollViewInsets = NO;

}

-(BaseTableCellVo *) getBaseTableCellVoByCellKey:(BaseTableViewVo *)baseTableViewVo cellKey:(NSString *)cellKey{
    if (baseTableViewVo != nil && baseTableViewVo.dataArray != nil && [baseTableViewVo.dataArray count] != 0
        && ![CommonUtil isEmptyString:cellKey]) {
        //        NSLog(@"baseTableViewVo.dataArray:%@",baseTableViewVo.dataArray);
        for (int idx =0; idx<[baseTableViewVo.dataArray count]; idx++) {
            BaseTableCellVo *cellVo = [baseTableViewVo.dataArray objectAtIndex:idx];
            NSLog(@"cellVo.cellKey:%@,cellKey:%@",cellVo.cellKey,cellKey);
            if ([cellKey isEqualToString:cellVo.cellKey]) {
                return cellVo;
            }
        }
        NSAssert(0,@"Error in getBaseTableCellVoByCellKey:unable to find any cellVo By cellKey:%@",cellKey);
        return nil;
    }else{
        NSAssert(0,@"Error in getBaseTableCellVoByCellKey:baseTableViewVo != nil or cellKey is empty cellKey:%@",cellKey);
    }
    return nil;
}

-(BaseTableCellVo *) getBaseTableCellVoByIndexPath:(NSIndexPath *)indexPath baseTableViewVo:(BaseTableViewVo *)baseTableViewVo{
    
    if (baseTableViewVo != nil && baseTableViewVo.dataArray != nil && [baseTableViewVo.dataArray count] >= indexPath.row) {
        BaseTableCellVo *cellVo = [baseTableViewVo.dataArray objectAtIndex:indexPath.row];
        return cellVo;
    }else{
        if (baseTableViewVo == nil) {
            NSLog(@"getBaseTableCellVoByIndexPath error baseTableViewVo == nil");
        }
        if (baseTableViewVo.dataArray == nil) {
            NSLog(@"getBaseTableCellVoByIndexPath error baseTableViewVo.dataArray == nil");
        }
        if ([baseTableViewVo.dataArray count] < indexPath.row) {
            NSLog(@"getBaseTableCellVoByIndexPath error [baseTableViewVo.dataArray count] < indexPath.row");
            NSLog(@"[baseTableViewVo.dataArray count]  =%lu",(unsigned long)[baseTableViewVo.dataArray count] );
            NSLog(@"indexPath.row  =%lu",(unsigned long)indexPath.row );
        }
        return nil;
    }
}
-(BaseTableView *) getBaseTableView{
    return nil;
}

-(BaseTemplateView *) getBaseTemplateView{
    return [self getBaseTableView];
}

-(void)viewDidLayoutSubviews {
    BaseTableView *baseTableView = [self getBaseTableView];
    if (baseTableView != nil) {
        if ([baseTableView.baseTableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [baseTableView.baseTableView setSeparatorInset:UIEdgeInsetsZero];
            
        }
        if ([baseTableView.baseTableView respondsToSelector:@selector(setLayoutMargins:)])  {
            [baseTableView.baseTableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getTableViewRowHeight];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewVo *baseTableViewVo = [self getBaseTableViewVo];
    BaseTableCellVo *baseTableCellVo = [self getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:baseTableViewVo];
    if ([baseTableCellVo.isEditable isEqualToString:@"YES"]) {
        return YES;
    }else{
        return NO;
    }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableCellVo *toBeRemoveVo = [self getBaseTableCellVoByIndexPath:indexPath baseTableViewVo:[self getBaseTableViewVo]];
    [self removeCellFromTableView:tableView toBeRemoveVo:toBeRemoveVo cellIndexPath:indexPath];
    [self afterRemoveCellFromTableView:tableView editingStyleForRowAtIndexPath:indexPath];
}

-(void)removeCellFromTableView:(UITableView *)tableView toBeRemoveVo:(BaseTableCellVo *)toBeRemoveVo cellIndexPath:(NSIndexPath *)cellIndexPath{
}
-(void)afterRemoveCellFromTableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    [[self getBaseTableView] reloadTableViewImmediately];
    if (indexPath.row !=0) {
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section];
        [tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}
#pragma mark - UITableViewDelegate Mothods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (float)getTableViewRowHeight {
    return 60.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - tableDelegate dataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BaseTableViewVo *baseTableViewVo = [self getBaseTableViewVo];
//        NSLog(@"dataArrayCount===>:%zd",baseTableViewVo.dataArray.count);
    if (baseTableViewVo != nil) {
        if (baseTableViewVo.dataArray == nil) {
            return 0;
        }
        return [baseTableViewVo.dataArray count];
    }
    return 0;
}

#pragma mark - for Sub Class to implement methods
- (BaseTableViewVo *)getBaseTableViewVo {
    
    return nil;
}

//-(void)popToVC:(id)sender{
//    [super popToVC:sender];
//    if ([self getBaseTableView] != nil) {
//        [self getBaseTableView].baseTableView.scrollEnabled = TRUE;
//        [self getBaseTableView].baseTableView.allowsSelection = TRUE;
//    }
//    if (self.keyBoardController != nil) {
//        [self.keyBoardController resignKeyboard];
//    }
//}


@end
