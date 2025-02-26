//
//  PushQuickPopView.m
//   
//
//  Created by melonGo on 2018/8/1.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "PushQuickPopView.h"
#import "JLColorConstant.h"
@implementation PushQuickPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView = [[UIView alloc] init];
        [self addSubview:self.contentView];
        self.contentView.backgroundColor = [UIColor blackColor];
        self.logoImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.logoImageView];
        self.logoImageView.backgroundColor = [UIColor clearColor];
        self.logoImageView.image = [UIImage imageNamed:@"icon_failure"];
        
        self.warnningLbl = [[UILabel alloc] init];
        self.warnningLbl.text = @"催单失败";
        self.warnningLbl.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.warnningLbl];
        self.warnningLbl.backgroundColor = [UIColor clearColor];
        self.warnningLbl.font = [UIFont systemFontOfSize:15];
        self.warnningLbl.textColor = itemColor;
        
        self.errorLbl = [[UILabel alloc] init];
        [self.contentView addSubview:self.errorLbl];
        self.errorLbl.backgroundColor = [UIColor clearColor];
        self.errorLbl.text = @"请在下单10分钟后催单";
        self.errorLbl.adjustsFontSizeToFitWidth = YES;
        self.errorLbl.textColor = [UIColor grayColor];
        self.errorLbl.font = [UIFont systemFontOfSize:13];
        self.errorLbl.textAlignment = NSTextAlignmentCenter;
        
        self.confirmBtn = [[UIButton alloc] init];
        [self.contentView addSubview:self.confirmBtn];
        self.confirmBtn.backgroundColor = [UIColor clearColor];
        [self.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.confirmBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.confirmBtn.titleLabel.textColor = [UIColor whiteColor];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = CGRectMake(0, self.frame.size.height/2-200/2, self.frame.size.width, 200);
    self.logoImageView.frame = CGRectMake(self.frame.size.width/2-90/2, 10, 90, 90);
    self.warnningLbl.frame = CGRectMake(self.frame.size.width/2-100/2, self.logoImageView.frame.origin.y+self.logoImageView.frame.size.height, 100, 33);
    self.errorLbl.frame = CGRectMake(self.frame.size.width/2-150/2, self.warnningLbl.frame.origin.y+self.warnningLbl.frame.size.height, 150, 33);
    self.confirmBtn.frame = CGRectMake(self.frame.size.width/2-100/2, self.errorLbl.frame.origin.y+self.errorLbl.frame.size.height, 100, 33);
}

@end
