//
//  AIResponse.h
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AIResponse : NSObject
@property (nonatomic,copy)NSString *event;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *data;

@end

NS_ASSUME_NONNULL_END
