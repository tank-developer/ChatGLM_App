//
//  AICategoryWorkView.h
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AICategoryWorkView : BaseTableView
@property (nonatomic,strong)UIView *backContentView;
@property (nonatomic,strong)UIButton *comfirmBtn;
@property (nonatomic,strong)UILabel *title;

@end

NS_ASSUME_NONNULL_END
