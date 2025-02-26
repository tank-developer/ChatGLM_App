//
//  UINavigationController+BBNavigationController.m
//  BookkeepingBookApp
//
//  Created by Apple on 2023/5/3.
//

//https://www.jianshu.com/p/6f1a29b98182
//解决右滑返回的问题



#import "UINavigationController+BBNavigationController.h"
#import "BaseTemplateVC.h"

@implementation UINavigationController (BBNavigationController)

- (void)viewDidLoad{
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

    BOOL ok = YES; // 默认为支持右滑反回

    if ([self.topViewController isKindOfClass:[BaseTemplateVC class]]) {

    if ([self.topViewController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
        BaseTemplateVC *vc = (BaseTemplateVC *)self.topViewController;
        ok = [vc gestureRecognizerShouldBegin];
        }
    }
    return ok;
}

@end
