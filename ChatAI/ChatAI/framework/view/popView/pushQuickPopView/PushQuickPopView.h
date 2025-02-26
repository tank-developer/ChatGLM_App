//
//  PushQuickPopView.h
//   
//
//  Created by melonGo on 2018/8/1.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushQuickPopView : UIView
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)UIImageView *logoImageView;
@property (nonatomic,strong)UILabel *warnningLbl;
@property (nonatomic,strong)UILabel *errorLbl;
@property (nonatomic,strong)UIButton *confirmBtn;
@end
