//
//  AIChatVC.h
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "BaseTableViewVC.h"
#import "AIChatView.h"
#import "AIChatVo.h"
#import "AIChatService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIChatVC : BaseTableViewVC
@property (nonatomic,strong)AIChatView *chatView;
@property (nonatomic,strong)AIChatVo *chatVo;
@property (nonatomic,strong)AIChatService *chatService;
@end

NS_ASSUME_NONNULL_END
