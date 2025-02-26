//
//  BaseTableViewVo.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTemplateVo.h"

@interface BaseTableViewVo : BaseTemplateVo
@property (nonatomic,strong)NSMutableArray *dataArray;
-(void)initIconCellDataArray:(NSString *)cellName cellIcon:(NSString *) cellIcon cellLabel:(NSString *) cellLabel cellValue:(NSString *) cellValue;
-(void)initComon3LblCellDataArray:(NSString *)cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *) lbl3;
-(void)initComon3LblCellDataArray:(NSString *)cellAction cellName:(NSString *)cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *) lbl3;
@end
