//
//  NSString+Extension.m
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)

- (NSString*)firstChar {
    if([NSString isBlank:self])
        return @"#";
    NSMutableString *source = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *str = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSString *ss = [[NSString stringWithFormat:@"%@",[source substringToIndex:1]] uppercaseString];
    if([str rangeOfString:ss].location == NSNotFound)
        return @"#";
    return ss;
}

+ (BOOL)isBlank:(NSString *)str{
    NSRange _range = [str rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        return YES;
    }else {
        return NO;
    }
}

#pragma mark - 正则表达式
// 判断邮件格式正则表达式
static NSString *EMAIL_REGEX_NAME = @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b";

// 判断数字正则表达式
static NSString *NUMBER_REGEX_NAME = @"^[0-9]*$";

// 判断英文正则表达式
static NSString *ENGLISH_REGEX_NAME = @"^[A-Za-z]+$";

// 判断中文正则表达式
static NSString *CHINESE_REGEX_NAME = @"^[\u4E00-\u9FA5]*$";

// 判断网址正则表达式
static NSString *INTERNET_URL_REGEX_NAME = @"((http|ftp|https)://)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\&%_\./-~-]*)?";

//判斷密碼
//static NSString *PASSWORD_REGEX_NAME = @"^[^\u4e00-\u9fa5\uf900-\ufa2d]{6,20}$";
static NSString *PASSWORD_REGEX_NAME = @"^[\\w+$]{6,20}$";
static NSString *NOSYMBOL_REGEX_NAME = @"[^%&',;=?$x22]+";


+ (BOOL)isValidateEmail:(NSString *)str
{
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", EMAIL_REGEX_NAME];
    return [regex evaluateWithObject:str];
}

+ (BOOL)isNumber:(NSString *)str
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NUMBER_REGEX_NAME];
    return [predicate evaluateWithObject:str];
}

+ (BOOL)isEnglish:(NSString *)str
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ENGLISH_REGEX_NAME];
    return [predicate evaluateWithObject:str];
}


+ (BOOL)isChinese:(NSString *)str
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CHINESE_REGEX_NAME];
    return [predicate evaluateWithObject:str];
}

+ (BOOL)isInternetUrl:(NSString *)str
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", INTERNET_URL_REGEX_NAME];
    return [predicate evaluateWithObject:str];
}

+ (BOOL)isMobileNumber:(NSString *)str
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|7[0]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189,17,14
     */
    NSString * CT = @"^1((|7[0-9]|4[0-9]|33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    //NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSString * OTHER = @"^1\\d{10}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestOther = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",OTHER];
    
    if (([regextestmobile evaluateWithObject:str] == YES)
        || ([regextestcm evaluateWithObject:str] == YES)
        || ([regextestct evaluateWithObject:str] == YES)
        || ([regextestcu evaluateWithObject:str] == YES)
        || ([regextestOther evaluateWithObject:str] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isPassword:(NSString *)str
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PASSWORD_REGEX_NAME];
    return [predicate evaluateWithObject:str];
}

+ (BOOL)validateIdentityCard:(NSString *)IDCardNumber
{
    if (IDCardNumber.length == 15) {
        //|  地址  |   年    |   月    |   日    |
        NSString *regex = @"^(\\d{6})([3-9][0-9][01][0-9][0-3])(\\d{4})$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [identityCardPredicate evaluateWithObject:IDCardNumber];
    } else if (IDCardNumber.length == 18) {
        //|  地址  |      年       |   月    |   日    |
        NSString *regex = @"^(\\d{6})([1][9][3-9][0-9][01][0-9][0-3])(\\d{4})(\\d|[xX])$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [identityCardPredicate evaluateWithObject:IDCardNumber];
    } else {
        return NO;
    }
}

+ (BOOL)isNoSymbol:(NSString *)str
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NOSYMBOL_REGEX_NAME];
    return [predicate evaluateWithObject:str];
}

- (BOOL)isEmoji {
    //    const unichar high = [self characterAtIndex: 0];
    //
    //    // Surrogate pair (U+1D000-1F77F)
    //    if (0xd800 <= high && high <= 0xdbff) {
    //        const unichar low = [self characterAtIndex: 1];
    //        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
    //
    //        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
    //
    //        // Not surrogate pair (U+2100-27BF)
    //    } else {
    //        return (0x2100 <= high && high <= 0x27bf);
    //    }
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              const unichar hs = [substring characterAtIndex:0];
                              if (0xd800 <= hs && hs <= 0xdbff) {
                                  if (substring.length > 1) {
                                      const unichar ls = [substring characterAtIndex:1];
                                      const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                      //                    if (0x1d000 <= uc && uc <= 0x1f77f) { 9c0
                                      if ((0x1d000 <= uc && uc <= 0x1f9c0) ) {//对新增iOS 11表情过滤Unicode最大值增加
                                          returnValue = YES;
                                      }
                                  }
                              } else if (substring.length > 1) {
                                  const unichar ls = [substring characterAtIndex:1];
                                  if (ls == 0x20e3) {
                                      returnValue = YES;
                                  }
                                  /**
                                   UTF16 [0x231A 0xFE0F ] 最小
                                   UTF16 [0x2764 0xFE0F ] 最大
                                   UTF16 [0x26F9 0xFE0F 0x200D 0x2640 0xFE0F ]
                                   对新增iOS 11表情过滤
                                   */
                                  
                                  if ((hs >= 0x231a && hs <= 0x2764) && ls == 0xfe0f) {
                                      returnValue = YES;
                                  }
                                  
                              } else {
                                  if (0x2100 <= hs && hs <= 0x27ff) {
                                      returnValue = YES;
                                  } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                      returnValue = YES;
                                  } else if (0x2934 <= hs && hs <= 0x2935) {
                                      returnValue = YES;
                                  } else if (0x3297 <= hs && hs <= 0x3299) {
                                      returnValue = YES;
                                  } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                      returnValue = YES;
                                  }
                              }
                          }];
    
    return returnValue;
}

- (BOOL)isIncludingEmoji {
    BOOL __block result = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    
    return result;
}

+ (BOOL)checkIsHaveNumAndLetter:(NSString*)password
{
    //数字条件
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //符合数字条件的有几个字节
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:password options:NSMatchingReportProgress range:NSMakeRange(0, password.length)];
    
    //英文字条件
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //符合英文字条件的有几个字节
    NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:password options:NSMatchingReportProgress range:NSMakeRange(0, password.length)];
    
    if (tNumMatchCount == password.length) {
        //全部符合数字，表示沒有英文
        return NO;
    } else if (tLetterMatchCount == password.length) {
        //全部符合英文，表示沒有数字
        return NO;
    }else if(tNumMatchCount == 0 && tLetterMatchCount == 0){
        //全部为符号,表示没有数字和字母
        return NO;
    }else {
        //其他所有情况。
        return YES;
    }
}

+ (NSString *)MD5:(NSString *)string{
    
    const char* input = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

+ (BOOL)validateMobile:(NSString *)mobile
{
    NSString *phoneRegex = @"^1[1|2|3|4|5|6|7|8|9][0-9]\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


@end
