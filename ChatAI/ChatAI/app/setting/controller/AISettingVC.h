//
//  AISettingVC.h
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "BaseTableViewVC.h"
#import "AISettingView.h"
#import "AISettingService.h"
#import "AISettingVo.h"

NS_ASSUME_NONNULL_BEGIN

@interface AISettingVC : BaseTableViewVC
@property (nonatomic,strong)AISettingService *settingService;
@property (nonatomic,strong)AISettingVo *settingVo;
@property (nonatomic,strong)AISettingView *settingView;
@end

NS_ASSUME_NONNULL_END
