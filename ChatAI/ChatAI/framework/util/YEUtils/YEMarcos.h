//
//  YEMarcos.h
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#ifndef YEMarcos_h
#define YEMarcos_h

#pragma mark - ===================屏幕宽高===========================
#define KScreenWidth ([[UIScreen mainScreen]bounds].size.width)
#define KScreenHeight [[UIScreen mainScreen]bounds].size.height
#define kScreenBounds [UIScreen mainScreen].bounds
#define Iphone6ScaleWidth(width) KScreenWidth *width/375.0
#define Iphone6ScaleHeight(height) KScreenHeight *height/667.0

// 是否刘海屏
#define isIPhoneX (([[UIApplication sharedApplication] statusBarFrame].size.height > 20)?1:0)
// 状态栏高度
#define kStatusBarHeight           ([[UIApplication sharedApplication] statusBarFrame].size.height)
// 导航栏高度
#define kNavBarHeight              (44.f)
// tab高度
#define kTabBarHeight               (49.f)
// 底部安全区域高度
#define kBottomSafeHeight               (isIPhoneX?34:0)
// 状态栏和导航栏高度
#define kTopStatusAndNavBarHeight  (kStatusBarHeight + kNavBarHeight)
// 安全区域和tab高度
#define kBottomSafeHeightAndTabBarHeight    (kTabBarHeight + kBottomSafeHeight)


#pragma mark - ===================颜色===========================
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define kRandomColor RGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
// 16进制颜色值 以0x开头，如：0x4db2fa
#define COLOR_FromHex(a)            [UIColor colorWithRed:(((a & 0xFF0000) >> 16))/255.0 green:(((a &0xFF00) >>8))/255.0 blue:((a &0xFF))/255.0 alpha:1.0]


#pragma mark - ===================字体===========================
// 系统字体
#define kSystemFont(x) [UIFont systemFontOfSize:x]
// 粗体
#define kBoldFont(x) [UIFont boldSystemFontOfSize:x]


#pragma mark - ===================获取系统对象===========================
#define kApplication [UIApplication sharedApplication]
#define kAppWindow [UIApplication sharedApplication].delegate.window
#define kAppDelegate [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kCurrentAppDelegate   ((AppDelegate *)[UIApplication sharedApplication].delegate)
// 系统版本
#define  kSystemVersion  [[[UIDevice currentDevice] systemVersion] floatValue]
// 当前应用版本
#define kCurrentVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 生成图片
#define kImage(imageName)  [UIImage imageNamed:imageName]


#pragma mark - ===================强弱引用===========================
// weakSelf
#define weakSelf(self) __weak typeof(self) weakSelf = self;
// strongSelf
#define strongSelf(weakSelf) __weak typeof(weakSelf) strongSelf = weakSelf;


#pragma mark - ===================通知===========================
// 发送通知
#define KNotification_Post(name) [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
// 删除所有通知
#define KNotification_RemoveAll(observer) [[NSNotificationCenter defaultCenter] removeObserver:observer];


#pragma mark - ===================数据验证===========================
#define YESafeStr(f)(YEStrValid(f)?f:@"")
#define YEValidStr(f)YEStrValid(f)
#define YEStrValid(f)(f!=nil &&[f isKindOfClass:[NSString class]]&& ![f isEqualToString:@""])
#define YEValidDict(f)(f!=nil &&[f isKindOfClass:[NSDictionary class]])
#define YEValidArray(f)(f!=nil &&[f isKindOfClass:[NSArray class]]&&[f count]>0)
#define YEValidNum(f)(f!=nil &&[f isKindOfClass:[NSNumber class]])
#define YEValidClass(f,cls)(f!=nil &&[f isKindOfClass:[cls class]])
#define YEValidData(f)(f!=nil &&[f isKindOfClass:[NSData class]])


#pragma mark - ===================打印日志===========================(如果日志太长有打印不完整的情况)
#ifdef DEBUG
#   define YELog(fmt, ...) NSLog((@"✪✪✪✪✪✪: %s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define YELog(...)
#endif

#endif /* YEMarcos_h */
