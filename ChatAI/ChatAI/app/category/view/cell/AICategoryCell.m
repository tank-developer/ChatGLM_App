//
//  AICategoryCell.m
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "AICategoryCell.h"

@implementation AICategoryCell

-(UIImageView *)icon{
    if(!_icon){
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor clearColor];

        [self.contentView addSubview:_icon];
    }
    return _icon;
}
-(UILabel *)titleLb{
    if(!_titleLb){
        _titleLb = [UILabel new];
        _titleLb.backgroundColor = [UIColor clearColor];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.textAlignment =NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_titleLb];
    }
    return _titleLb;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.icon.image = [UIImage imageNamed:@"history"];
        self.titleLb.text = @"";
        self.contentView.backgroundColor = [UIColor blackColor];

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.icon.frame = CGRectMake(self.frame.size.width/2-30/2, 10, 30, 30);
    self.titleLb.frame = CGRectMake(self.frame.size.width/2-self.frame.size.width/2, self.icon.frame.size.height + self.icon.frame.origin.y + 5, self.frame.size.width, 20);
}


@end
