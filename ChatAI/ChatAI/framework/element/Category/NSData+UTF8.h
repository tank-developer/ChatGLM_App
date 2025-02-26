//
//  NSData+UTF8.h
//  SoloCommunity
//
//  Created by APPLE on 2022/6/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (UTF8)
- (NSString *)utf8String;
- (NSData *)replaceNoUtf8:(NSData *)data;
@end

NS_ASSUME_NONNULL_END
