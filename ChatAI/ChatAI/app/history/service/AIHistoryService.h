//
//  AIHistoryService.h
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "BaseTableViewService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIHistoryService : BaseTableViewService
-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
