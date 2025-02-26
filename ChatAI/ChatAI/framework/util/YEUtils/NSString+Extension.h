//
//  NSString+Extension.h
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/**
 * 获取字符串的首字母（不管是汉子还是拼音）
*/
- (NSString*)firstChar;

/**
 * 字符串是否为包含空格
*/
+ (BOOL)isBlank:(NSString*)str;

/**
 *  验证邮箱是不是可用
 */
+ (BOOL)isValidateEmail:(NSString *)str;

/**
 *  验证是不是数字
 */
+ (BOOL)isNumber:(NSString *)str;

/**
 *  验证是不是英文
 */
+ (BOOL)isEnglish:(NSString *)str;

/**
 *  验证是不是汉字
 */
+ (BOOL)isChinese:(NSString *)str;

/**
 *  是不是手机号码
 */
+ (BOOL)isMobileNumber:(NSString *)str;

/**
 *  判斷密碼格式
 */
+ (BOOL)isPassword:(NSString *)str;

/**
 *  身份证号码粗略判断
 */
+ (BOOL)validateIdentityCard:(NSString *)IDCardNumber;

/**
 *  不包含符号
 */
+ (BOOL)isNoSymbol:(NSString *)str;
/**
 
 判断是否包含emoji
 */
- (BOOL)isIncludingEmoji;

//验证金额格式
+ (BOOL)valiteMoneyWithMoney:(NSString *)money;
+ (BOOL)valite1000MoneyWithMoney:(NSString *)money;


//验证密码为数字字母符号中2种及以上。
+ (BOOL)checkIsHaveNumAndLetter:(NSString*)password;

// MD5加密
+ (NSString *)MD5:(NSString *)string;

//判断手机号正则表达式
+ (BOOL)validateMobile:(NSString *)mobile;

@end

NS_ASSUME_NONNULL_END
