//
//  BaseTableCell.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTableCell.h"

@implementation BaseTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}

-(void) setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
}

@end
