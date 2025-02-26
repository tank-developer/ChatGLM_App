//
//  NSObject+MBProgressHUD.h
//  MessageDemo
//
//  Created by Youe on 2022/3/8.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#pragma mark - UIView
@interface UIView (toast)

- (MBProgressHUD *)showMessageHud:(NSString *)message;
- (MBProgressHUD *)showSuccessHud:(NSString *)message;
- (MBProgressHUD *)showFailureHud:(NSString *)message;
- (MBProgressHUD *)showFailureHudWithYOffset:(NSString *)message;
- (MBProgressHUD *)showUpImageSuccessHud:(NSString *)message;

- (MBProgressHUD *)showLoadingHud:(NSString *)message;
- (void)dismissHud;

@end
#pragma mark - UIViewController
@interface UIViewController (toast)

- (MBProgressHUD *)showMessageHud:(NSString *)message;
- (MBProgressHUD *)showSuccessHud:(NSString *)message;
- (MBProgressHUD *)showFailureHud:(NSString *)message;
- (MBProgressHUD *)showFailureHudWithYOffset:(NSString *)message;
- (MBProgressHUD *)showUpImageSuccessHud:(NSString *)message;

- (MBProgressHUD *)showLoadingHud:(NSString *)message;
- (void)dismissHud;

@end
