//
//  NSString+ExtentionSlot.m
//  SimpleDiary
//
//  Created by APPLE on 2022/4/13.
//

#import "NSString+ExtentionSlot.h"


//
//  NSExtentionSloter.m
//  UIMKit
//
//  Created by on 2020/5/8.
//  Copyright © 2020 icarbon@foxmail.com. All rights reserved.
//
 
//#import "NSExtentionSloter.h"
 
@implementation NSString (ExtentionSlot)
 
#pragma mark - 文本size
/**
 文本size
 */
- (CGSize)stringSizeWithFont:(UIFont*)font constrainedSize:(CGSize)size
{
    NSString *str = [NSString stringWithFormat:@"%@",self];
    CGSize labelSize = CGSizeZero;
    if (str.length > 0)
    {
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    font, NSFontAttributeName,
                                    [NSParagraphStyle defaultParagraphStyle], NSParagraphStyleAttributeName,
                                    nil];
        labelSize = [str boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
#else
        labelSize = [str sizeWithFont:font constrainedToSize:size];
#endif
        labelSize.height = ceilf(labelSize.height);
        labelSize.width = ceilf(labelSize.width);
    }
    
    return labelSize;
}
 
 
- (CGSize)stringSizeWithFont:(UIFont*)font
{
    NSString *str = [NSString stringWithFormat:@"%@",self];
    CGSize labelSize = CGSizeZero;
    if (str.length > 0)
    {
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    font, NSFontAttributeName,
                                    [NSParagraphStyle defaultParagraphStyle], NSParagraphStyleAttributeName,
                                    nil];
        labelSize = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, ceilf(font.lineHeight)) options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
#else
        labelSize = [str sizeWithFont:font constrainedToSize:size];
#endif
        labelSize.height = ceilf(labelSize.height);
        labelSize.width = ceilf(labelSize.width);
    }
    
    return labelSize;
}
 
 
- (NSArray *)mutableRangeOfString:(NSString *)searchString
{
    NSString *parten = [NSString stringWithString:searchString];
    NSError* error = NULL;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:parten options:NSRegularExpressionCaseInsensitive error:&error];
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:0];
    NSArray* match = [reg matchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, [self length])];
    [match enumerateObjectsUsingBlock:^(NSTextCheckingResult *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSRange range = [obj range];
        [list addObject:[NSValue valueWithRange:range]];
    }];
    
    return list;
}
 
/*是否包含emoji表情*/
- (BOOL)stringContrainsEmoji:(NSString *)string
{
    return [NSString stringContrainsEmoji:string];
}
 
+ (BOOL)stringContrainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, string.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        const unichar hs = [substring characterAtIndex:0];
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
@end
 
 
#pragma mark - NSObject 增加属性
@implementation NSObject (ExtentionSlot)
@dynamic dataObject;
 
- (id)dataObject
{
    return objc_getAssociatedObject(self, "dataObject");
}
 
 
- (void)setDataObject:(id)anObject
{
    objc_setAssociatedObject(self, "dataObject", anObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
 
 
- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([self class], &propsCount);//获得属性列表
    for(int i = 0;i < propsCount; i++)
    {
        objc_property_t prop = props[i];
        
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];//获得属性的名称
        id value = [self valueForKey:propName];//kvc读值
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self hashMap:value];//自定义处理数组，字典，其他类
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}
 
- (id)hashMap:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self hashMap:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self hashMap:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [obj toDictionary];
}
@end
 
typedef void (^ButtonActionBlock)(UIButton *thisButton);
 
@implementation UIButton (targetBlock)
 
- (void)addTargetActionBlock:(void (^)(UIButton *aButton))atBlock
{
    [self setActionBlock:atBlock];
    
    [super addTarget:self action:@selector(buttonDidTouchIniside) forControlEvents:UIControlEventTouchUpInside];
}
 
 
- (void)buttonDidTouchIniside
{
    ButtonActionBlock aBlock = [self actionBlock];
    if (aBlock)
    {
        aBlock(self);
    }
}
 
 
- (void)performTargetActionBlock
{
    [self buttonDidTouchIniside];
}
 
 
- (ButtonActionBlock)actionBlock
{
    return objc_getAssociatedObject(self, "targetBlock");
}
 
 
- (void)setActionBlock:(ButtonActionBlock)actionBlock
{
    objc_setAssociatedObject(self, "targetBlock", actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
 
 
#pragma mark UIView
@implementation UIView (addititonal)
-(void)addTargetAction:(void (^)(id view))actionBlock
{
    __block typeof(self) this = self;
    CGRect rt=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self setUserInteractionEnabled:YES];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:rt];
    button.backgroundColor=[UIColor clearColor];
    [button addTargetActionBlock:^(UIButton *aButton)
    {
        if (actionBlock)
        {
            actionBlock(this);
        }
    }];
    [self addSubview:button];
}
 
 
- (void)setBezierPath:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii strokeColor:(UIColor*)strokeColor fillColor:(UIColor*)fillColor
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    maskLayer.lineWidth = 1.0;
    maskLayer.strokeColor = strokeColor.CGColor;
    maskLayer.fillColor = fillColor.CGColor;
    maskLayer.cornerRadius = cornerRadii.width;
    self.layer.mask = maskLayer;
}
 
@end
 
@implementation UIImage (addititonal)
 
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
 
 
+ (UIImage *)imageWithStrokeColor:(UIColor*)strokeColor fillColor:(UIColor*)fillColor size:(CGSize)size borderWidth:(CGFloat)borderWidth corner:(CGFloat)corner
{
    CGFloat scale = [UIScreen mainScreen].scale;
    size.width *= scale;
    size.height *= scale;
    corner *= scale;
    
    CGFloat w = size.width;
    CGFloat h = size.height;
    if (corner < 0)
    {
        corner = 0;
    }
    else if (corner > MIN(w, h))
    {
        corner = MIN(w, h) / 2.;
    }
    
    UIImage *image = nil;
    CGRect imageFrame = CGRectMake(borderWidth, borderWidth, w-2*borderWidth, h-2*borderWidth);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(context, YES);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect: imageFrame cornerRadius: corner];
    if (fillColor)
    {
        [fillColor setFill];
    }
    else
    {
        [[UIColor clearColor] setFill];
    }
    [path fill];
    if (strokeColor)
    {
        [strokeColor setStroke];
    }
    else
    {
        [[UIColor clearColor] setStroke];
    }
    path.lineWidth = borderWidth*scale;
    [path stroke];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



@end
