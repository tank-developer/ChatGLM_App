//
//  TestCell.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "TestCell.h"
#import "YYCreator.h"
@implementation TestCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.cellLabel = [[UILabel alloc] init];
        self.cellLabel.font = [UIFont systemFontOfSize:18];
        self.cellLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.cellLabel];
        
    }
    return self;
}
-(void) setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    NSLog(@"cellDataDic--->>%@",baseTableCellVo.cellDataDic);
//    [YYCreator setIconLblValueCellByMap:self cellDataDic:baseTableCellVo.cellDataDic];
    
}

@end
