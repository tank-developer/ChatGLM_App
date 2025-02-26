//
//  UILauncherAlertView.m
//  SimpleDiary
//
//  Created by APPLE on 2022/4/13.
//

#ifndef RGB
    #define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#endif
 
#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
    #ifndef intToStr
        #define intToStr(A)   [NSString stringWithFormat:@"%ld",(NSInteger)A]
    #endif
    #ifndef boolToStr
        #define boolToStr(A)  [NSString stringWithFormat:@"%d",(bool)A]
    #endif
#else
    #ifndef intToStr
        #define intToStr(A)   [NSString stringWithFormat:@"%d",(NSInteger)A]
    #endif
    #ifndef boolToStr
        #define boolToStr(A)  [NSString stringWithFormat:@"%d",(bool)A]
    #endif
#endif


#import "UILauncherAlertView.h"
#import "NSString+ExtentionSlot.h"
#import "SMProtocalVC.h"


@interface UILauncherAlertView ()
@property (nonatomic,assign) UIImageView *bgView;
@end

@implementation UILauncherAlertView
@synthesize bgView;
- (instancetype)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    if (self = [super initWithFrame:frame])
    {
        
    }
    return self;
}

//这个方法很重要，你要根据你的启动页面布局实现同样的布局VIEW，从视觉上让用户感觉到仍然是在启动页面上展示的此页面
- (instancetype)init
{
    if (self = [super init])
    {
        CGRect rect = CGRectMake(([UIScreen mainScreen].bounds.size.width-250)/2, 213, 250, 181);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
        [imageView setImage:[UIImage imageNamed:@"lc_center.png"]];
        [self addSubview:imageView];
        
        rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        imageView = [[UIImageView alloc] initWithFrame:rect];
        [imageView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
        [self setBgView:imageView];
        [imageView setAlpha:.0];
        
//        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction)];
//        [imageView addGestureRecognizer:singleTap];
//        [imageView setUserInteractionEnabled:YES];
        
        [self addSubview:imageView];
        
        UIImage *iamge = [UIImage imageNamed:@"userlogo"];//lc_buttom
        CGFloat y = [UIScreen mainScreen].bounds.size.height-50-[[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom;
        rect = CGRectMake(([UIScreen mainScreen].bounds.size.width-30*(iamge.size.width/iamge.size.height))/2, y, 30*(iamge.size.width/iamge.size.height), 30);
        imageView = [[UIImageView alloc] initWithFrame:rect];
//        [imageView setImage:iamge];
        [self addSubview:imageView];
    }
    return self;
}
#pragma mark - otherMethod
- (void)tapGestureAction
{
    UIView *effectview = [self viewWithTag:8];
    [UIView animateWithDuration:0.2 animations:^{
        [self.bgView setAlpha:0];
        effectview.transform=CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
 
 
//把你的文本显示按照这个赋值即可
 
- (void)showIn:(UIViewController *)controller completion:(void(^)(BOOL vl))completion
{
    [self setBackgroundColor:[UIColor whiteColor]];
    NSString *cnt = @"请你务必审慎阅读，充分理解隐私政策各条款，包括但不限于:为了向你提供推荐本地相关信息、即时通讯等服务，我们需要收集你的设备、位置等信息，你可以在\"设置\"中管理你的授权。";
    CGSize size = [cnt stringSizeWithFont:[UIFont systemFontOfSize:13] constrainedSize:CGSizeMake(self.frame.size.width-92-40, CGFLOAT_MAX)];
    
    NSString *t1 = @"你可阅读";
    CGFloat w1 = [t1 stringSizeWithFont:[UIFont systemFontOfSize:13]].width;
    
//    NSString *t2 = @"《服务协议》";
    NSString *t2 = @"";
    CGFloat w2 = [t2 stringSizeWithFont:[UIFont systemFontOfSize:13]].width;
    
    NSString *t3 = @"和";
    CGFloat w3 = [t3 stringSizeWithFont:[UIFont systemFontOfSize:13]].width;
    
    NSString *t4 = @"《隐私政策》";
    CGFloat w4 = [t4 stringSizeWithFont:[UIFont systemFontOfSize:13]].width;
    
    CGFloat tw = w1+w2+w3+w4;
    CGFloat nw = 0;
    NSString *lcnt = @"了解详细信息。如你同意请点击\"同意\"开始接受我们的服务。";
    NSString *spText = @"";
    while (nw < tw)
    {
        spText = [spText stringByAppendingFormat:@" "];
        nw = [spText stringSizeWithFont:[UIFont systemFontOfSize:13]].width;
    }
    lcnt = [spText stringByAppendingString:lcnt];
    CGSize lcntSize = [lcnt stringSizeWithFont:[UIFont systemFontOfSize:13] constrainedSize:CGSizeMake(self.frame.size.width-92-40, CGFLOAT_MAX)];
    
    CGFloat cntHeight = 44+(size.height+20)+[UIFont systemFontOfSize:13].lineHeight+lcntSize.height+64;
    CGFloat cntWidth = self.frame.size.width-92;
    CGRect rect = CGRectMake(46, (self.frame.size.height-cntHeight)/2, cntWidth, cntHeight);
//    CGRect rect = CGRectMake(46, [UIScreen mainScreen].bounds.size.height, cntWidth, cntHeight);
    UIView *effectview = [[UIView alloc] initWithFrame:rect];
    [effectview setTag:8];
    [self addSubview:effectview];
    
    rect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    [imageView setBackgroundColor:[UIColor whiteColor]];
    [imageView.layer setMasksToBounds:YES];
    [imageView.layer setCornerRadius:8];
    [effectview addSubview:imageView];
    
    rect = CGRectMake(0, 0, rect.size.width, 44);
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
//    [label setText:@"服务协议及隐私政策"];
    [label setText:@"隐私政策"];
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [effectview addSubview:label];
    
    rect = CGRectMake(20, rect.origin.y+rect.size.height, rect.size.width-40, size.height+20);
    label = [[UILabel alloc] initWithFrame:rect];
    [label setText:cnt];
    [label setNumberOfLines:0];
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [effectview addSubview:label];
    
    rect = CGRectMake(20, rect.origin.y+rect.size.height, w1, [UIFont systemFontOfSize:13].lineHeight);
    label = [[UILabel alloc] initWithFrame:rect];
    [label setText:t1];
    [label setNumberOfLines:0];
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [effectview addSubview:label];
    
    rect.origin.x += rect.size.width;
    rect.size.width = w2;
    label = [[UILabel alloc] initWithFrame:rect];
    [label setText:t2];
    [label setTextColor:[UIColor blueColor]];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [effectview addSubview:label];
    [label addTargetAction:^(id  _Nonnull view) {
        //服务协议跳转页面
//        [controller.navigationController pushViewController:[[SMProtocalVC alloc]init] animated:YES];
        [controller presentViewController:[[SMProtocalVC alloc]init] animated:YES completion:nil];

    }];
    
    rect.origin.x += rect.size.width;
    rect.size.width = w3;
    label = [[UILabel alloc] initWithFrame:rect];
    [label setText:t3];
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [effectview addSubview:label];
    
    rect.origin.x += rect.size.width;
    rect.size.width = w4;
    label = [[UILabel alloc] initWithFrame:rect];
    [label setText:t4];
    [label setTextColor:[UIColor blueColor]];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [effectview addSubview:label];
    [label addTargetAction:^(id  _Nonnull view) {
        //跳转到隐私政策页面
        dispatch_async(dispatch_get_main_queue(), ^{
           // UI更新代码
            UIViewController *topRootViewController = [[UIApplication  sharedApplication] keyWindow].rootViewController;
            // 在这里加一个这个样式的循环
            while (topRootViewController.presentedViewController){
                // 这里固定写法
              topRootViewController = topRootViewController.presentedViewController;
            }
//             然后再进行present操作
             [topRootViewController presentViewController:[[SMProtocalVC alloc]init] animated:YES completion:nil];
        });
    }];
    rect = CGRectMake(20, rect.origin.y, cntWidth-40, lcntSize.height);
    label = [[UILabel alloc] initWithFrame:rect];
    [label setText:lcnt];
    [label setNumberOfLines:0];
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [effectview addSubview:label];
    
    rect = CGRectMake(0, cntHeight-54, effectview.frame.size.width, 0.5);
    imageView = [[UIImageView alloc] initWithFrame:rect];
    [imageView setBackgroundColor:[UIColor colorWithRed:245.0f/255.0f green:245.0f/255.0f blue:245.0f/255.0f alpha:1]];
    
    [effectview addSubview:imageView];
    
    NSString *title = @"暂不使用";
    CGRect fm = CGRectMake(0, cntHeight-54, cntWidth/2,50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:fm];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTargetActionBlock:^(UIButton * _Nonnull aButton) {
        if (completion)
        {
            completion(NO);
        }
        exit(0);
    }];
    [effectview addSubview:button];
    
    title = @"同意";
    fm.origin.x += fm.size.width;
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:fm];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTargetActionBlock:^(UIButton * _Nonnull aButton) {
        [self tapGestureAction];
        if (completion)
        {
            completion(YES);
        }
    }];
    [effectview addSubview:button];
    
    fm.size.width = 0.5;
    fm.size.height = effectview.frame.size.height-fm.origin.y;
    imageView = [[UIImageView alloc] initWithFrame:fm];
    [imageView setBackgroundColor:[UIColor colorWithRed:245.0f/255.0f green:245.0f/255.0f blue:245.0f/255.0f alpha:1]];
    [effectview addSubview:imageView];
    
    [[[UIApplication sharedApplication] delegate].window addSubview:self];
    
//    effectview.transform=CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration: 0.2 animations:^
    {
        [self.bgView setAlpha:1];
//        effectview.transform=CGAffineTransformMakeScale(1, 1);
    }];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.2;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    [effectview.layer addAnimation:animation forKey:@"animationAlertKey"];
}






@end
