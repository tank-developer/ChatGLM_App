//
//  AIVipBuyLblCell.h
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "BaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIVipBuyLblCell : BaseTableCell
@property (nonatomic,strong)UIView *bgContentView;
@property (nonatomic,strong)UILabel *freeLbl;
@property (nonatomic,strong)UIButton *apiLbl;//一天十条
@property (nonatomic,strong)UIButton *chatLbl;//不能查看记录

@property (nonatomic,strong)UILabel *proLbl;
@property (nonatomic,strong)UIButton *apiMoreLbl;//无限的调用次数
@property (nonatomic,strong)UIButton *chatRocordLbl;//能查看记录

@property (nonatomic,strong)UIButton *moreLbl;//后续的更多功能的使用

@property (nonatomic,strong)UILabel *descriptLbl;//购买详情

@property (nonatomic,strong)UIButton *buyBtn;//购买按钮


@property (nonatomic,strong)UIButton *reBuyBtn;//恢复购买按钮

@property (nonatomic,strong)UILabel *orderLbl;//订阅条款

@end

NS_ASSUME_NONNULL_END
