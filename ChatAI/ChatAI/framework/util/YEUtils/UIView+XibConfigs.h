//
//  UIView+XibConfigs.h
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
IB_DESIGNABLE

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XibConfigs)
//注意:加上 IBInspectable 就可以可视化显示相关的属性
@property (nonatomic, copy) IBInspectable NSString  *cornerRadius;
@property (nonatomic, copy) IBInspectable NSString  *borderWidth;
@property (nonatomic, strong) IBInspectable UIColor  *borderColor;
@end


NS_ASSUME_NONNULL_END
