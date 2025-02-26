//
//  AIHistoryModelDao.h
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import <Foundation/Foundation.h>
#import "CWSqliteModelTool.h"
NS_ASSUME_NONNULL_BEGIN

@interface AIHistoryModelDao : NSObject<CWModelProtocol>
@property (nonatomic,copy)NSString *content;
@property (nonatomic,assign)NSInteger historyId;
@property (nonatomic,copy)NSString *date;
@property (nonatomic,copy)NSString *user;

@end

NS_ASSUME_NONNULL_END
