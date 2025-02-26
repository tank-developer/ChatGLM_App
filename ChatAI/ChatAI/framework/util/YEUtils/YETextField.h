//
//  YETextField.h
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface YETextField : UITextField
/** 字数限制 */
@property (nonatomic, assign) IBInspectable NSUInteger max_count;


/**
 设置左边距空缺

 @param length 空缺长度,不小于10,建议15
 */
- (void)setLeftVacancyLength:(CGFloat)length;

@end

NS_ASSUME_NONNULL_END
