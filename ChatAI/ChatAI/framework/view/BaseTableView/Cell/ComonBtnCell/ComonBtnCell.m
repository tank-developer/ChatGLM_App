//
//  ComonBtnCell.m
//   
//
//  Created by  on 2018/7/14.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "ComonBtnCell.h"

@implementation ComonBtnCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.btn1 = [[UIButton alloc] init];
        [self addSubview:self.btn1];
        
        self.btn2 = [[UIButton alloc] init];
        [self addSubview:self.btn2];
        
        self.btn3 = [[UIButton alloc] init];
        [self addSubview:self.btn3];

        self.btn4 = [[UIButton alloc] init];
        [self addSubview:self.btn4];

        self.btn5 = [[UIButton alloc] init];
        [self addSubview:self.btn5];

        self.btn6 = [[UIButton alloc] init];
        [self addSubview:self.btn6];

        self.btn7 = [[UIButton alloc] init];
        [self addSubview:self.btn7];

        self.btn8 = [[UIButton alloc] init];
        [self addSubview:self.btn8];

        self.btn9 = [[UIButton alloc] init];
        [self addSubview:self.btn9];

        self.btn10 = [[UIButton alloc] init];
        [self addSubview:self.btn10];

        self.btn11 = [[UIButton alloc] init];
        [self addSubview:self.btn11];
    }
    return self;
}



-(void) setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
