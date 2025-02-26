//
//  SMShareInstance.h
//  SimpleDiary
//
//  Created by Apple on 2022/4/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMShareInstance : NSObject{
    NSInteger count;
}
+ (instancetype)shareInstance;
-(void)increase;
-(NSInteger)getCount;

@end

NS_ASSUME_NONNULL_END
