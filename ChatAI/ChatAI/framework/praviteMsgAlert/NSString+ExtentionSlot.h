//
//  NSString+ExtentionSlot.h
//  SimpleDiary
//
//  Created by APPLE on 2022/4/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ExtentionSlot)
#pragma mark - 文本size
/**
 文本size
 */
- (CGSize)stringSizeWithFont:(UIFont*)font constrainedSize:(CGSize)size;
 
/**只计算单行宽高，多行请调用：stringSizeWithFont：constrainedSize*/
- (CGSize)stringSizeWithFont:(UIFont*)font;
 
/**多关键字搜索*/
- (NSArray *)mutableRangeOfString:(NSString *)searchString;
 
/*是否包含emoji表情*/
- (BOOL)stringContrainsEmoji:(NSString *)string;
+ (BOOL)stringContrainsEmoji:(NSString *)string;


@end
@interface NSObject (ExtentionSlot)
@property (nonatomic,retain) NSObject *dataObject;
 
- (NSMutableDictionary*)toDictionary;
@end


@interface UIButton (targetBlock)
/**点击回调block,代替addTarget:action:forControlEvents,注意回环引用*/
- (void)addTargetActionBlock:(void (^)(UIButton *aButton))atBlock;
 
/**主动执行以上回调*/
- (void)performTargetActionBlock;
@end



typedef void (^KeyBoardFrameBlock)(CGRect kframe);
#pragma mark UIView
@interface UIView (addititonal)
- (void)addTargetAction:(void (^)(id view))actionBlock;
 
- (void)setBezierPath:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii strokeColor:(UIColor*)strokeColor fillColor:(UIColor*)fillColor;
@end

@interface UIImage (addititonal)
+ (UIImage *)imageWithColor:(UIColor *)color;
 
+ (UIImage *)imageWithStrokeColor:(UIColor*)strokeColor fillColor:(UIColor*)fillColor size:(CGSize)size borderWidth:(CGFloat)borderWidth corner:(CGFloat)corner;
@end



NS_ASSUME_NONNULL_END
