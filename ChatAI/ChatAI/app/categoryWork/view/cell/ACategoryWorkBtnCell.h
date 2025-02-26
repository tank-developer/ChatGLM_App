//
//  ACategoryWorkBtnCell.h
//  ChatAI
//
//  Created by Apple on 2023/8/1.
//

#import "BaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACategoryWorkBtnCell : BaseTableCell
@property (nonatomic,strong)UIView *backContentView;
@property (nonatomic,strong)UIButton *comfirmBtn;
@property (nonatomic,strong)UILabel *title;
@end

NS_ASSUME_NONNULL_END
