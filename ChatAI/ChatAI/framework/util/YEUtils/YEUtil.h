//
//  YEUtil.h
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 时间格式
static NSString *const TIME_DatePoint = @"yyyy.MM.dd";
static NSString *const TIME_DateEE = @"yyyy.MM.dd EEEE";
static NSString *const TIME_Date = @"yyyy-MM-dd";
static NSString *const TIME_Date_HH = @"yyyy-MM-dd HH:mm";
static NSString *const TIME_Date_EE_HH = @"yyyy-MM-dd EEEE HH:mm";
static NSString *const TIME_ALL = @"yyyy-MM-dd HH:mm:ss";
static NSString *const TIME_ZhHans_YMD = @"yyyy年MM月dd日 HH:mm";
static NSString *const TIME_ZH_YMD = @"yyyy年MM月dd日";

@interface YEUtil : NSObject


/// 不同字体颜色
/// @param label 控件
/// @param index 下标
/// @param vaColor 颜色
+ (void)setTextColor:(UILabel *)label index:(int)index andColor:(UIColor *)vaColor;


/// 添加单击手势
/// @param target 目标
/// @param action 方法名
/// @param view 控件
+ (void)addClickEvent:(id)target action:(SEL)action owner:(UIView *)view;


/// 圆角
/// @param cornerRadius 圆角大小
/// @param view 控件
+ (void)makeCornerRadius:(CGFloat)cornerRadius view:(UIView *)view;


/// 边框宽度颜色
/// @param borderWidth 边框宽度
/// @param view 控件
/// @param borderColor 边框颜色
+ (void)makeBorderWidth:(CGFloat)borderWidth view:(UIView *)view borderColor:(UIColor *)borderColor;


/// UILabel的不同颜色与大小
/// @param label 控件
/// @param string 文字(目标文字之前的文字)
/// @param setstring 目标文字
/// @param color 目标颜色
/// @param font 字体
/// @param isbool 是否下划线
+ (void)setUILabel:(UILabel *)label data:(NSString *)string setData:(NSString *)setstring color:(UIColor *)color font:(CGFloat)font underline:(BOOL)isbool;


/// 控件边缘灰色线条
/// @param view 控件
/// @param dirction left/right/top/bottom
/// @param sizew 控件宽度
/// @param color 线条颜色
+ (void)setFoursides:(UIView *)view direction:(NSString *)dirction sizeW:(CGFloat)sizew color:(UIColor *)color;


/// 计算控件高度
/// @param view 控件
/// @param string X/Y
+ (CGFloat)returnViewFrame:(UIView *)view Direction:(NSString *)string;

/// 专场动画
+ (void)TransferAnimationViewController;


/// 获取当前控制器
+ (UIViewController *)getCurrentVC;


/// 获取最顶层控制器
+ (UIViewController *)topViewController;


/// 输入的数字限制
/// @param textField 输入框
/// @param range 范围
/// @param string 字符串
+ (BOOL)numTextField:(UITextField *)textField range:(NSRange)range replaceString:(NSString *)string;


/**
 *  动态计算行高
 *
 *  @param text     文本内容
 *  @param width    控件的宽
 *  @param fontSize 字体大小
 *
 *  @return 行高
 */
+ (CGFloat)returnLabelHeightForText:(NSString *)text labelWidth:(CGFloat)width fontSize:(CGFloat)fontSize;


/**
 文字的自适应尺寸
 @param string 需要显示的文本
 @param font 文字的大小
 @param constraintSize 预设size大小
 @return 适配显示的size大小
 */
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font constraintSize:(CGSize)constraintSize;


/**
 计算文字宽度
 
 @param text 文字内容
 @param font 字体大小
 @return size
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font;


/**
 日期转成字符串
 
 @param date 需要转化的时间
 @param format 结果格式
 1.TIME_Date：年月日，
 2.TIME_ALL：年月日，时分秒，
 3.也可能自定义格式按照"yyyy-MM-dd HH:mm:ss"来自定义
 @return TIME_Date
 */
+ (NSString *)timeStringFromDate:(NSDate *)date  format:(NSString *)format;



/**
 时间截转字符串
 
 @param str 需要传入的时间截字符串
 @param format 时间格式
 @return 时间字符串
 */
+ (NSString *)timeStringTimeWithString:(NSString *)str format:(NSString *)format;


/**
 时间字符串转时间截
 
 @param dateStr 时间字符串
 @param format 时间格式
 @return 时间截字符串
 */
+ (NSString *)timeStringWithTime:(NSString *)dateStr format:(NSString *)format;


/**
 字符串转日期
 
 @param str 需要转化的时间字符串
 @param format 时间格式
 @return 时间NSDate对象
 */
+ (NSDate *)dateWithTimeString:(NSString *)str format:(NSString *)format;


/**
 获取当前时间截
 
 @return 时间截字符串
 */
+ (NSString *)getCurrentTimeInterval;


/**
 返回当天星期几
 */
+ (NSString*)getCurrentWeekDay;


/**
 距离现在的时间
 @param str 需要传入的时间截字符串
 @return 字符串
 */
+ (NSString *)distanceTimeWithBeforeTimeStr:(NSString *)str;


/**
 比较日期大小
 @param largeDate 大日期字符串
 @param smallDate 小日期字符串
 @param format 格式同上
 @return  NSOrderedAscending:大于   NSOrderedSame:相等   NSOrderedDescending:小于
 */
+ (NSComparisonResult)sureLagerDate:(NSString *)largeDate compareSmallDate:(NSString *)smallDate format:(NSString *)format;


/**
 判断字符串中是否有表情
 
 @return BOOL 是否有表情
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;


/**
 图片旋转了的问题
 
 @return image 可用的图片
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;

/**
 按钮的圆角设置

 @param view view类控件
 @param rectCorner UIRectCorner要切除的圆角
 */
+ (void)setupRoundedCornersWithView:(UIView *)view cutCorners:(UIRectCorner)rectCorner;
@end

NS_ASSUME_NONNULL_END
