//
//  JLSizeConstant.h
//  test
//
//  Created by admin on 2018/7/7.
//  Copyright © 2018年 melon. All rights reserved.
//
/*
 //获取状态栏的rect
 CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
 //获取导航栏的rect
 CGRect navRect = self.navigationController.navigationBar.frame;
 那么导航栏+状态栏的高度
 statusRect.size.height+navRect.size.height
 */
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)       //屏幕宽度
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)      //屏幕高度
#define SCREEN_SCALE ([UIScreen mainScreen].scale)
#define appStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define appNavBarHeight self.navigationController.navigationBar.frame.size.height
#define appTabbarHeight self.tabBarController.tabBar.frame.size.height

#define tabBarHeight 49
#define navBar 44
#define statusBar 20

#define iPhoneXNavBar 44
#define iPhoneXStatusBar 44

#define collectCellHeigth 250
