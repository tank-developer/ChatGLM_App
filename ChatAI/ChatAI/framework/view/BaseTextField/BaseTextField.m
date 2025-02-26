//
//  BaseTextField.m
//
//
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.textColor = [UIColor whiteColor];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}
-(CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconrext = [super leftViewRectForBounds:bounds];
    iconrext.origin.x += 10;
    return iconrext;
}
//控制placeHolder的位置。
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(self.leftView.frame.size.width + 10,bounds.origin.y, 100, 45);
}

//控制，光标的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset= CGRectMake(self.leftView.frame.size.width + 10, bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
    return inset;
}

//编辑文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset= CGRectMake(self.leftView.frame.size.width + 10, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}

@end
