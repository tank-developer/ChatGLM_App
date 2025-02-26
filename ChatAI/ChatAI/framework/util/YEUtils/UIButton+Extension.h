//
//  UIButton+Extension.h
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extension)

/*
 *设置Normal和Seleted时不同的显示标题和图片等
 */

// MARK: -- 设置标题
- (void)setNormalTitle:(NSString *)normalTitle selectedTitile:(NSString *)selectedTitle;

// MARK: -- 设置颜色
- (void)setNormalTitleColor:(UIColor *)normalTitleColor selectedTitileColor:(UIColor *)selectedTitleColor;

// MARK: -- 设置图片
- (void)setNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

// MARK: -- 设置是否切换
- (void)setSwithStatus;

/**
 自定义响应边界 UIEdgeInsetsMake(-3, -4, -5, -6). 表示扩大
 例如： self.btn.hitEdgeInsets = UIEdgeInsetsMake(-3, -4, -5, -6);
 */
@property(nonatomic, assign) UIEdgeInsets hitEdgeInsets;


/**
 自定义响应边界 自定义的边界的范围 范围扩大3.0
 例如：self.btn.hitScale = 3.0;
 */
@property(nonatomic, assign) CGFloat hitScale;

/*
 自定义响应边界 自定义的宽度的范围 范围扩大3.0
 例如：self.btn.hitWidthScale = 3.0;
 */
@property(nonatomic, assign) CGFloat hitWidthScale;

/*
 自定义响应边界 自定义的高度的范围 范围扩大3.0
 例如：self.btn.hitHeightScale = 3.0;
 */
@property(nonatomic, assign) CGFloat hitHeightScale;

@end

NS_ASSUME_NONNULL_END
