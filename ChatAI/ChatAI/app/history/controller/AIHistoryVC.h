//
//  AIHistoryVC.h
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "BaseTableViewVC.h"
#import "AIHistoryView.h"
#import "AIHistoryVo.h"
#import "AIHistoryService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIHistoryVC : BaseTableViewVC
@property (nonatomic,strong)AIHistoryService *historyService;
@property (nonatomic,strong)AIHistoryVo *historyVo;
@property (nonatomic,strong)AIHistoryView *historyView;

@end

NS_ASSUME_NONNULL_END
