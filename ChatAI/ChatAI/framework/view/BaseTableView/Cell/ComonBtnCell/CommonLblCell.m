//
//  CommonLblCell.m
//   
//
//  Created by melonGo on 2018/8/1.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "CommonLblCell.h"

@implementation CommonLblCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lbl1 = [[UILabel alloc] init];
        [self addSubview:self.lbl1];
        
        self.lbl2 = [[UILabel alloc] init];
        [self addSubview:self.lbl2];
        
        self.lbl3 = [[UILabel alloc] init];
        [self addSubview:self.lbl3];
        
        self.lbl4 = [[UILabel alloc] init];
        [self addSubview:self.lbl4];
        
        self.lbl5 = [[UILabel alloc] init];
        [self addSubview:self.lbl5];
        
        self.lbl6 = [[UILabel alloc] init];
        [self addSubview:self.lbl6];
        
        self.lbl7 = [[UILabel alloc] init];
        [self addSubview:self.lbl7];
        
        self.lbl8 = [[UILabel alloc] init];
        [self addSubview:self.lbl8];
        
        self.lbl9 = [[UILabel alloc] init];
        [self addSubview:self.lbl9];
        
        self.lbl10 = [[UILabel alloc] init];
        [self addSubview:self.lbl10];
        
        self.lbl11 = [[UILabel alloc] init];
        [self addSubview:self.lbl11];
        
        self.lbl12 = [[UILabel alloc] init];
        [self addSubview:self.lbl12];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
