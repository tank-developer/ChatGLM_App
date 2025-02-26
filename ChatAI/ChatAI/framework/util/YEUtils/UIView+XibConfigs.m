//
//  UIView+XibConfigs.m
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import "UIView+XibConfigs.h"

static void *cornerRadiusKey = &cornerRadiusKey;
static void *borderwidthkey = &borderwidthkey;
static void *borderborderColorkey = &borderborderColorkey;

@implementation UIView (XibConfigs)

- (void)setCornerRadius:(NSString*)cornerRadius {
    objc_setAssociatedObject(self, & cornerRadiusKey, cornerRadius, OBJC_ASSOCIATION_COPY);
    self.layer.cornerRadius=[cornerRadius integerValue];
    self.layer.masksToBounds=YES;
}

- (NSString *)cornerRadius {
    return objc_getAssociatedObject(self, &cornerRadiusKey);
}

- (void)setBorderWidth:(NSString*)borderWidth {
    objc_setAssociatedObject(self, & borderwidthkey, borderWidth, OBJC_ASSOCIATION_COPY);
    self.layer.borderWidth=[borderWidth integerValue];
}

- (NSString *)borderWidth {
    return objc_getAssociatedObject(self, &borderwidthkey);
}

- (void)setBorderColor:(UIColor*)borderColor {
    objc_setAssociatedObject(self, & borderborderColorkey, borderColor, OBJC_ASSOCIATION_COPY);
    self.layer.borderColor=borderColor.CGColor;
}

- (UIColor *)borderColor{
    return objc_getAssociatedObject(self, &borderborderColorkey);
}

@end
