//
//  AISettingService.h
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "BaseTableViewService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AISettingService : BaseTableViewService
-(NSMutableArray *)getCellVoArray:(NSMutableDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
