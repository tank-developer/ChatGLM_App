//
//  AIChatQuestionModel.h
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AIChatQuestionModel : NSObject
@property (nonatomic,assign)NSInteger questionId;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *role;


@end

NS_ASSUME_NONNULL_END
