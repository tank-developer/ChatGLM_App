//
//  PopViewTableViewCell.m
//   
//
//  Created by melonGo on 2018/7/31.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "PopViewTableViewCell.h"

@implementation PopViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.formLbl = [[UILabel alloc] init];
        [self addSubview:self.formLbl];
        self.formLbl.backgroundColor = [UIColor clearColor];
        self.formLbl.layer.cornerRadius = 15;
        self.formLbl.layer.masksToBounds = YES;
        self.formLbl.textColor = [UIColor whiteColor];
        self.formLbl.textAlignment = NSTextAlignmentCenter;
        self.formLbl.font = [UIFont systemFontOfSize:11];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.formLbl setFrame:CGRectMake(0, 0, 40, 40)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
