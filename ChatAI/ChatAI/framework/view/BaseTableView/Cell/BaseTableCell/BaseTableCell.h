//
//  BaseTableCell.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableCellVo.h"
#import "JLSizeConstant.h"
#import "JLColorConstant.h"
#import "UIDevice+Recognition.h"

@interface BaseTableCell : UITableViewCell
-(void)setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo;

@end
