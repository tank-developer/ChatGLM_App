//
//  UILauncherAlertView.h
//  SimpleDiary
//
//  Created by APPLE on 2022/4/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILauncherAlertView : UIView
- (void)showIn:(UIViewController *)controller completion:(void(^)(BOOL vl))completion;

@end

NS_ASSUME_NONNULL_END
