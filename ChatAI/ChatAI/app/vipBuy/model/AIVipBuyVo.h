//
//  AIVipBuyVo.h
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "BaseTableViewVo.h"
#import "AIVipBuyService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIVipBuyVo : BaseTableViewVo
@property (nonatomic,strong)AIVipBuyService *vipBuyService;
@end

NS_ASSUME_NONNULL_END
