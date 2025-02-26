//
//  CollectionViewCell.m
//  test
//
//  Created by admin on 2018/7/7.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.iconImageView = [[UIImageView alloc] init];
        [self addSubview:self.iconImageView];
        self.iconImageView.backgroundColor = [UIColor redColor];
        
        self.bottomLbl = [[UILabel alloc] init];
        [self addSubview:self.bottomLbl];
        self.bottomLbl.backgroundColor = [UIColor blueColor];
        self.bottomLbl.font = [UIFont systemFontOfSize:13];
        self.bottomLbl.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.iconImageView.frame = CGRectMake(20, 0, self.frame.size.width-40, self.frame.size.height-30);
    self.bottomLbl.frame = CGRectMake(0, self.iconImageView.frame.size.height, self.frame.size.width, 20);
}
@end
