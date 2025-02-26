//
//  AICategoryChatVo.h
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "BaseTableViewVo.h"
#import "AICategoryChatService.h"
#import "MessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AICategoryChatVo : BaseTableViewVo
@property (nonatomic,strong)AICategoryChatService *categoryChatService;
-(void)addMsgMeType:(MessageModelType) type text:(NSString *)text;
-(void)addMsgOtherType:(MessageModelType) type;
-(void)addRefreshVo:(NSMutableDictionary *)dic type:(MessageModelType )type;
@end

NS_ASSUME_NONNULL_END
