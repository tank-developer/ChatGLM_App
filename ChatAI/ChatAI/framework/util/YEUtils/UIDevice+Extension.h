//
//  UIDevice+Extension.h
//  MessageDemo
//
//  Created by Youe on 2022/3/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Extension)
/**
 设备宽度类型
 - DeviceScreenType_320: 320宽度
 - DeviceScreenType_375: 375宽度
 - DeviceScreenType_414: 414宽度
 */
typedef NS_ENUM(NSUInteger, DeviceScreenType) {
    DeviceScreenType_320,
    DeviceScreenType_375,
    DeviceScreenType_414,
};

/// 获取当前系统版本号
+ (float)iosVersion;

/// 获取当前设备CUP频率
+ (NSUInteger)cpuFrequency;

///
+ (NSUInteger)busFrequency;

/// 获取设备内存大小
+ (NSUInteger)ramSize;

/// 获取设备CUP数量
+ (NSUInteger)cpuCount;

///  设备总的内存
+ (NSUInteger)totalMemory;

/// 当前设备非内核内存
+ (NSUInteger)userMemory;

/// 当前设备总磁盘空间
+ (NSNumber *)totalDiskSpace;

/// 当前设备空闲磁盘空间
+ (NSNumber *)freeDiskSpace;

/// 当前设备的MAC地址
+ (NSString *)macAddress;

/// 生成一个惟一的标识符并存储到standardUserDefaults
+ (NSString *)uniqueIdentifier;

/// 得到本机ip地址
+ (NSString *)getLocalIPAddress;

/// Return the device platform string
/// Example: "iPhone3,2"
+ (NSString *)devicePlatform;

/// Return the user-friendly device platform string
/// Example: "iPad Air (Cellular)"
+ (NSString *)devicePlatformString;

/// 网络状态
/// Example: 0 - 无网络; 1 - 2G; 2 - 3G; 3 - 4G; 4 - WIFI
+ (NSNumber *)deviceNetworkType;

#pragma mark - USerInterface
// 是否横屏
+ (BOOL)isHorizontal;


#pragma mark - Action
/// 打电话
+ (void)makePhoneCall:(NSString *)number;

/// safari打开网页
+ (void)openURLWithSafary:(NSString *)URL;

/// 跳转系统协议
+ (void)openSystemURL:(NSString *)URL;

/// 判断用户是否允许接收通知
+ (BOOL)isUserNotificationEnable;

@end

NS_ASSUME_NONNULL_END
