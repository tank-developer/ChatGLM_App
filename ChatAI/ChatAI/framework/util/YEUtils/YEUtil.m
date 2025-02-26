//
//  YEUtil.m
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import "YEUtil.h"

@implementation YEUtil
+ (void)setTextColor:(UILabel *)label index:(int)index andColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    //截取的范围
    NSString *InterceptStr = [NSString stringWithFormat:@"%@",[label.text substringFromIndex:index]];
    //获取改变的内容
    NSRange range = [label.text rangeOfString:InterceptStr];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    label.attributedText = str;
}


+ (void)addClickEvent:(id)target action:(SEL)action owner:(UIView *)view{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    gesture.numberOfTouchesRequired = 1;
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:gesture];
}

+ (void)makeCornerRadius:(CGFloat)cornerRadius view:(UIView *)view{
    CALayer *layer = view.layer;
    layer.cornerRadius = cornerRadius;
    layer.masksToBounds = YES;
    view.clipsToBounds = YES;
}


+ (void)makeBorderWidth:(CGFloat)borderWidth view:(UIView *)view borderColor:(UIColor *)borderColor{
    
    CALayer * fileslayer = [view layer];
    fileslayer.borderColor = [borderColor CGColor];
    fileslayer.borderWidth = borderWidth;
    
}


+ (void)setUILabel:(UILabel *)label data:(NSString *)string setData:(NSString *)setstring color:(UIColor *)color font:(CGFloat)font underline:(BOOL)isbool{
    NSRange str = [label.text rangeOfString:setstring];
    if (str.location != NSNotFound) {
        NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:label.text];
        [str1 addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(string.length,setstring.length)]; //设置字体颜色
        [str1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(string.length,setstring.length)];
        if (isbool) {
            
            [str1 addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(string.length,setstring.length)];
        }
        label.attributedText = str1;
    }
}


+ (void)setFoursides:(UIView *)view direction:(NSString *)dirction sizeW:(CGFloat)sizew color:(UIColor *)color{
    if ([dirction  isEqual: @"left"]) {
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.8, sizew)];
        bottomview.backgroundColor = color;
        [view addSubview:bottomview];
    }else if([dirction  isEqual: @"right"]){
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width - 0.5, 0, 0.5, sizew)];
        bottomview.backgroundColor = color;
        [view addSubview:bottomview];
    }else if([dirction  isEqual: @"top"]){
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizew, 0.5)];
        bottomview.backgroundColor = color;
        [view addSubview:bottomview];
    }else if([dirction  isEqual: @"bottom"]){
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - 0.5, sizew, 0.5)];
        bottomview.backgroundColor = color;
        [view addSubview:bottomview];
    }
}


+ (CGFloat)returnViewFrame:(UIView *)view Direction:(NSString *)string{
    if ([string  isEqual: @"Y"]) {
        return view.frame.origin.y + view.frame.size.height;
    }else{
        return view.frame.origin.x + view.frame.size.width;
    }
}


+ (void)TransferAnimationViewController{
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.6];//设置动画时间
    animation.type = kCATransitionFade;//设置动画类型
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
}


+ (BOOL)numTextField:(UITextField *)textField range:(NSRange)range replaceString:(NSString *)string{
    //    限制只能输入数字
    BOOL isHaveDian = YES;
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    if ([textField.text rangeOfString:@"."].location == NSNotFound) {
        isHaveDian = NO;
    }
    if ([string length] > 0) {
        unichar single = [string characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.') {//数据格式正确
            if([textField.text length] == 0){
                if(single == '.') {
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            //输入的字符是否是小数点
            if (single == '.') {
                if(!isHaveDian)//text中还没有小数点
                {
                    isHaveDian = YES;
                    return YES;
                }else{
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }else{
                if (isHaveDian) {//存在小数点
                    //判断小数点的位数
                    NSRange ran = [textField.text rangeOfString:@"."];
                    if (range.location - ran.location <= 2) {
                        return YES;
                    }else{
                        return NO;
                    }
                }else{
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else
    {
        return YES;
    }
}


+ (CGFloat)returnLabelHeightForText:(NSString *)text labelWidth:(CGFloat)width fontSize:(CGFloat)fontSize{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSDictionary *attrs = @{NSFontAttributeName:font};
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    return bounds.size.height;
}


+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font constraintSize:(CGSize)constraintSize {
    CGRect rect = [string boundingRectWithSize:constraintSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil];
    return rect.size;
}


+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font{
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    attrDict[NSFontAttributeName] = font;
    return [text sizeWithAttributes:attrDict];
}


+ (NSString *)timeStringFromDate:(NSDate *)date  format:(NSString *)format{
    NSDateFormatter *timeform=[[NSDateFormatter alloc]init];
    //@"yyyy-MM-dd  HH:mm:ss"
    [timeform setDateFormat:format];
    NSString *timeStr = [timeform stringFromDate:date];
    return timeStr;
}


+ (NSString *)timeStringTimeWithString:(NSString *)str format:(NSString *)format{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:str.integerValue];//时间需要注意需不需要
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *returnString =[formatter stringFromDate:date];
    return returnString;
}


+ (NSString *)timeStringWithTime:(NSString *)dateStr format:(NSString *)format{
    NSDate *date = [YEUtil dateWithTimeString:dateStr format:format];
    NSTimeInterval interval = [date timeIntervalSince1970];
    return [@(interval) stringValue];
}


+ (NSDate *)dateWithTimeString:(NSString *)str format:(NSString *)format{
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:format];
    NSDate *date  = [[NSDate alloc] init];
    date = [dateformater dateFromString:str];
    return date;
}


+ (NSString *)getCurrentTimeInterval{
    NSDate *currentDate = [[NSDate date] dateByAddingTimeInterval:8*3600];
    
    NSTimeInterval interval = [currentDate timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.f",interval];
}


+ (NSString*)getCurrentWeekDay{
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:interval];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:newDate];
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}


+ (NSString *)distanceTimeWithBeforeTimeStr:(NSString *)str{
    NSTimeInterval beTime= str.integerValue;
    NSTimeInterval now = [[NSDate date]timeIntervalSince1970];
    double distanceTime = now - beTime;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    NSString * timeStr = [df stringFromDate:beDate];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay = [df stringFromDate:[NSDate date]];
    NSString * lastDay = [df stringFromDate:beDate];
    
    if (distanceTime < 60) {//小于一分钟
        distanceStr = @"刚刚";
    }else if (distanceTime <60*60) {//时间小于一个小时
        distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
    }else if(distanceTime <24*60*60 && [nowDay integerValue] == [lastDay integerValue]){//时间小于一天
        distanceStr = [NSString stringWithFormat:@"今天 %@",timeStr];
    }else if(distanceTime<24*60*60*2 && [nowDay integerValue] != [lastDay integerValue]){
        if ([nowDay integerValue] - [lastDay integerValue] ==1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1)) {
            distanceStr = [NSString stringWithFormat:@"昨天 %@",timeStr];
        }else{
            [df setDateFormat:@"MM-dd HH:mm"];
            distanceStr = [df stringFromDate:beDate];
        }
    }else if(distanceTime <24*60*60*365){
        [df setDateFormat:@"MM-dd HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }else{
        [df setDateFormat:@"yyyy-MM-dd HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }
    return distanceStr;
}


+ (NSComparisonResult)sureLagerDate:(NSString *)largeDate compareSmallDate:(NSString *)smallDate format:(NSString *)format{
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    
    [dateformater setDateFormat:format];
    NSDate *large = [[NSDate alloc] init];
    NSDate *small = [[NSDate alloc] init];
    
    large = [dateformater dateFromString:largeDate];
    small = [dateformater dateFromString:smallDate];
    NSComparisonResult result = [large compare:small];
    return result;
}


+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
options:NSStringEnumerationByComposedCharacterSequences usingBlock:
^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                        const unichar ls = [substring characterAtIndex:1];
                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                             returnValue = YES;
                        }
                 }
            } else if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 if (ls == 0x20e3) {
                       returnValue = YES;
                 }
             } else {
                  // non surrogate
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


+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


+ (UIViewController *)getCurrentVC{
    for (UIWindow *window in [UIApplication sharedApplication].windows.reverseObjectEnumerator) {
        
        UIView *tempView = window.subviews.lastObject;
        
        for (UIView *subview in window.subviews.reverseObjectEnumerator) {
            if ([subview isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
                tempView = subview;
                break;
            }
        }
        
        BOOL(^canNext)(UIResponder *) = ^(UIResponder *responder){
            if (![responder isKindOfClass:[UIViewController class]]) {
                return YES;
            } else if ([responder isKindOfClass:[UINavigationController class]]) {
                return YES;
            } else if ([responder isKindOfClass:[UITabBarController class]]) {
                return YES;
            } else if ([responder isKindOfClass:NSClassFromString(@"UIInputWindowController")]) {
                return YES;
            }
            return NO;
        };
        
        UIResponder *nextResponder = tempView.nextResponder;
        
        while (canNext(nextResponder)) {
            tempView = tempView.subviews.firstObject;
            if (!tempView) {
                return nil;
            }
            nextResponder = tempView.nextResponder;
        }
        
        UIViewController *currentVC = (UIViewController *)nextResponder;
        if (currentVC) {
            return currentVC;
        }
    }
    return nil;
    
}


+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}
+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

+ (void)setupRoundedCornersWithView:(UIView *)view cutCorners:(UIRectCorner)rectCorner{
    CAShapeLayer *mask=[CAShapeLayer layer];
    UIBezierPath * path= [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(8,8)];
    mask.path=path.CGPath;
    mask.frame=view.bounds;
    view.layer.mask = mask;
}

@end
