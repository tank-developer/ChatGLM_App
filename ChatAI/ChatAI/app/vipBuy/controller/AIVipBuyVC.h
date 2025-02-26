//
//  AIVipBuyVC.h
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "BaseTableViewVC.h"
#import "AIVipBuyView.h"
#import "AIVipBuyVo.h"
#import "AIVipBuyService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIVipBuyVC : BaseTableViewVC
@property (nonatomic,strong)AIVipBuyService *vipBuyService;
@property (nonatomic,strong)AIVipBuyVo *vipBuyVo;
@property (nonatomic,strong)AIVipBuyView *vipBuyView;
@end

NS_ASSUME_NONNULL_END
