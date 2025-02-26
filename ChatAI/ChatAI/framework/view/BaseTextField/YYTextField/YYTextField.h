//
//  YYTextField.h
//   
//
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "BaseTextField.h"

@interface YYTextField : BaseTextField
@property (nonatomic,strong)UIImageView *leftImageVi;
@property (nonatomic,strong)UIButton *rightBtn;
-(void)showRightView;
@end
