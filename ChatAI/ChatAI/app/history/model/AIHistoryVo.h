//
//  AIHistoryVo.h
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "BaseTableViewVo.h"
#import "AIHistoryService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIHistoryVo : BaseTableViewVo
@property (nonatomic,strong)AIHistoryService *historyService;
@end

NS_ASSUME_NONNULL_END
