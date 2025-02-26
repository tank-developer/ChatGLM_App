//
//  YYTextField.m
//   
//
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "YYTextField.h"
#import "JLColorConstant.h"
#define rightBtnWidth 90
@implementation YYTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftImageVi = [[UIImageView alloc] init];
        self.leftView = self.leftImageVi;
        self.leftImageVi.backgroundColor = [UIColor clearColor];
        self.leftViewMode = UITextFieldViewModeAlways;
        
        
        UIView *rightBG = [[UIView alloc] init];
        rightBG.frame = CGRectMake(0, 10, rightBtnWidth, 30);
        self.rightView = rightBG;
        [self addSubview:rightBG];
        self.rightBtn = [[UIButton alloc] init];
        [rightBG addSubview:self.rightBtn];

        self.rightBtn.backgroundColor = [UIColor clearColor];
        self.rightViewMode = UITextFieldViewModeNever;
        self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.rightBtn setTitleColor:itemColor forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];

    }
    return self;
}
-(void)showRightView{
    self.rightViewMode = UITextFieldViewModeAlways;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.leftImageVi setFrame:CGRectMake(0, 10, 20, 20)];
    [self.rightBtn setFrame:CGRectMake(0, 5, rightBtnWidth, 30)];

}
@end
