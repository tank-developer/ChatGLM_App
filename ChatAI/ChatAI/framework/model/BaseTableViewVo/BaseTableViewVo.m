//
//  BaseTableViewVo.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTableViewVo.h"
#import "BaseTableCellVo.h"
#import "YYCreator.h"

@implementation BaseTableViewVo
- (instancetype)init
{
    self = [super init];
    if (self.dataArray == nil) {
        self.dataArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



-(void)initIconCellDataArray:(NSString *)cellName cellIcon:(NSString *) cellIcon cellLabel:(NSString *) cellLabel cellValue:(NSString *) cellValue{
    if (self.dataArray == nil) {
        self.dataArray = [[NSMutableArray alloc] init];
    }
    BaseTableCellVo *cellVo  = [YYCreator createIconCellVo:cellName cellIcon:cellIcon cellLabel:cellLabel cellValue:cellValue dbDic:nil];
    [self.dataArray addObject:cellVo];
}

-(void)initComon3LblCellDataArray:(NSString *)cellAction cellName:(NSString *)cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *) lbl3{
    if (self.dataArray == nil) {
        self.dataArray = [[NSMutableArray alloc] init];
    }
    NSMutableDictionary *cellVoDic = [YYCreator createCommon3LblCellViewMap:lbl1 lbl2:lbl2 lbl3:lbl3];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:nil];
    cellVo.cellAction =cellAction;
    [self.dataArray addObject:cellVo];
}

@end
