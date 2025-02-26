//
//  AIChatService.h
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "BaseTableViewService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIChatService : BaseTableViewService
-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
