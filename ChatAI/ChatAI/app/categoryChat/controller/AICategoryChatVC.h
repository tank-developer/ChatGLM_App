//
//  AICategoryChatVC.h
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "BaseTableViewVC.h"
#import "AICategoryChatView.h"
#import "AICategoryChatVo.h"
#import "AICategoryChatService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AICategoryChatVC : BaseTableViewVC
@property (nonatomic,strong)AICategoryChatService *categoryChatService;
@property (nonatomic,strong)AICategoryChatVo *categoryChatVo;
@property (nonatomic,strong)AICategoryChatView *categoryChatView;
@end

NS_ASSUME_NONNULL_END
