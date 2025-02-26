//
//  TabBarVC.m
//  
//
//  Created by melonGo on 2018/7/24.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "TabBarVC.h"

#import "NavgationVC.h"

#import "AIChatVC.h"
#import "AIHistoryVC.h"
//#import "BBSettingVC.h"
#import "CBAppConfig.h"


@interface TabBarVC ()<UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        AIChatVC *homeVC = [[AIChatVC alloc]init];
        UINavigationController *homtnavvc = [[UINavigationController alloc] initWithRootViewController:homeVC];
        UIImage *homeImg = [[UIImage imageNamed:@"明细_doc-detail"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *homeImgSelect = [[UIImage imageNamed:@"明细_doc-detail-select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        homtnavvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"明细" image:homeImg selectedImage:homeImgSelect];
        [self addChildViewController:homtnavvc];
        
        AIHistoryVC *newsVC = [[AIHistoryVC alloc]init];
        UINavigationController *navNewsvc = [[UINavigationController alloc] initWithRootViewController:newsVC];
        UIImage *newsImg = [[UIImage imageNamed:@"统计_excel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *newsImgSelect = [[UIImage imageNamed:@"统计_excel-select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        navNewsvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"统计" image:newsImg selectedImage:newsImgSelect];
        [self addChildViewController:navNewsvc];
        
    
        
        
//        UIColor *selectColor = KAPPCOLOR;
        UIColor *normalColor = [UIColor blackColor];
        //[UIFont fontWithName:@"PingFang-SC-Bold" size:18]
        //设置tabbar的颜色字体。
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15],  NSForegroundColorAttributeName:normalColor} forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15], NSForegroundColorAttributeName :[UIColor redColor]} forState:UIControlStateSelected];
        [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
        [UITabBar appearance].translucent = YES;//这句表示取消tabBar的透明效果。
        [[UITabBar appearance] setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:1.0f]];
        self.delegate = self;
        
//        [UINavigationBar appearance].translucent = YES;
//        [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.1f]];
        [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    }
    return self;
}

//-(void)addViewControllerWith:(UIViewController *)VC TaBbartitle:(NSString *)title TabBarselectImage:(NSString *)selectImage TabBarImage:(NSString *)normalImage{
//    VC.navigationItem.title = title;
//    VC.tabBarItem.title = title;
//    VC.tabBarController.tabBarItem.title = title;
//    VC.tabBarController.tabBar.tintColor = [UIColor redColor];
//    UIImage *selectImageV = [UIImage imageNamed:selectImage];
//    UIImage *normalImageV = [UIImage imageNamed:normalImage];
//    selectImageV = [selectImageV imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    VC.tabBarItem.image = normalImageV;
//    VC.tabBarItem.selectedImage = selectImageV;
//    [VC.tabBarItem setImageInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
//    NavgationVC *nav = [[NavgationVC alloc] initWithRootViewController:VC];
//
////    [self addChildViewController:VC];
//    [self addChildViewController:nav];
//
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0F],  NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0F], NSForegroundColorAttributeName :[UIColor orangeColor]} forState:UIControlStateSelected];
//}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NavgationVC *nav = (NavgationVC *)viewController;

//    if ([tabBarController.tabBar.selectedItem.title isEqualToString:@"消息"]) {
//        NavgationVC *nav = (NavgationVC *)viewController;
////        for (int i =0; i < nav.viewControllers.count; i++) {
////            UIViewController *vc = nav.viewControllers[i];
////            if ([vc isEqual:[SCMessageVC class]]) {
////                SCMessageVC *messageVC = (SCMessageVC *)vc;
////                messageVC.segmentSelectNumber = self.segmentSelectNumber;
////
////            }
////        }
//        SCMessageVC *vc = (SCMessageVC *)nav.viewControllers[tabBarController.selectedIndex];
//        vc.segmentSelectNumber = 1;
//        return YES;
//    }
    return YES;
}

//-(void)dismissViewController{
//    [self dismissViewControllerAnimated:YES completion:^{
//        NavgationVC *nav = (NavgationVC *)self.viewControllers[0];
//        EMHeaderVC *vc = (EMHeaderVC *)nav.topViewController;
//        [vc refreshTableView];
//    }];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
