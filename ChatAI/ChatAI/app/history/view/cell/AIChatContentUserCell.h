//
//  AIChatContentUserCell.h
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "BaseTableCell.h"
//#import <YYText/YYText.h>



NS_ASSUME_NONNULL_BEGIN

@interface AIChatContentUserCell : BaseTableCell
@property (nonatomic,strong)UIButton *textView;

/**
时间
 */
@property (nonatomic, strong) UILabel *timeLabel;

/**
 内容
 */
@property (nonatomic, strong) UIButton *contentBtn;

//@property (nonatomic, strong) YYTextView *contentTextView;
//
//
//@property (nonatomic, strong) YYLabel *contentLabel;

/**
 头像
 */
@property (nonatomic, strong) UIImageView *iconView;


@end

NS_ASSUME_NONNULL_END
