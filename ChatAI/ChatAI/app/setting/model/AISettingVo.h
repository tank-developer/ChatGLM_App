//
//  AISettingVo.h
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "BaseTableViewVo.h"
#import "AISettingService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AISettingVo : BaseTableViewVo
@property (nonatomic,strong)AISettingService *settingService;
@end

NS_ASSUME_NONNULL_END
