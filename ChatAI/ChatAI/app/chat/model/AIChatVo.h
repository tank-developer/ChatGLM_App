//
//  AIChatVo.h
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "BaseTableViewVo.h"
#import "AIChatService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIChatVo : BaseTableViewVo
@property (nonatomic,strong)AIChatService *chatService;
-(void)refreshVo:(NSString *)content;
@end

NS_ASSUME_NONNULL_END
