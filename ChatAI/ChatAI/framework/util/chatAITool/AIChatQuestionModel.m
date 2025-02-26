//
//  AIChatQuestionModel.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AIChatQuestionModel.h"

@implementation AIChatQuestionModel
// 以schoolId为主键返回！
+ (NSString *)primaryKey {
   return @"questionId";
}
@end
