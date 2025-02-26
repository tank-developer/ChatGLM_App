//
//  YETextView.h
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

NS_ASSUME_NONNULL_BEGIN

@interface YETextView : UITextView
/** 占位文字 */
@property (nonatomic, copy) IBInspectable NSString *placeholder;
/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
/** 字数限制 */
@property (nonatomic, assign) IBInspectable NSUInteger max_count;

@end

NS_ASSUME_NONNULL_END
