//
//  BaseTemplateVC.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseVC.h"
#import "BaseTemplateView.h"
#import "BaseTemplateService.h"
#import "CommonUtil.h"
#import "UIDevice+Recognition.h"
#import "YYNavLeftBtn.h"
#import "YYNavIconBtn.h"
#import "UINavigationBar+handle.h"
#import "YEUtil.h"
#import "YEMarcos.h"
#import "CBAppConfig.h"
#import "URLConstant.h"
#import "UINavigationController+BBNavigationController.h"



@interface BaseTemplateVC : BaseVC
@property (nonatomic,strong)NSString *currentAction;
@property (nonatomic,strong)NSString *viewDidApearAction;
@property (nonatomic, strong) NSString *viewDidApearURL;
@property (nonatomic,strong)NSMutableDictionary *pamDic;
@property (nonatomic, strong) NSString *currentVCAction;
@property (nonatomic,strong)NSString *viewWillApearAction;
@property (nonatomic, strong) NSString *viewWillApearURL;
@property (nonatomic, strong) NSMutableArray *elementObjList;

@property (nonatomic, strong) NSMutableArray *eleObjWithPermissionList;
@property (nonatomic, strong) NSMutableArray *eleObjWithoutPermissionList;
@property (nonatomic,strong)UISearchBar *searchBar;
@property (nonatomic,strong)UIDatePicker *datePicker;

-(CGFloat)getNavigationHeight;
-(CGFloat)getStatusBarHeight;

-(void) addNavLeftBarButton;
-(void) addNavRightBarButton;
-(void)addNavtionItemTitleView:(NSString *)title;
-(BaseTemplateService *) getBaseTemplateService;
-(void)popToVCAnimated:(BOOL)isAnimated;
-(void)popToRootVC;
-(void)popToVCWith:(UIViewController *)targetVC;
-(void)popToVC:(id)sender;
-(void)pushToNextVCWith:(UIViewController *)vc ishidesBottomBar:(BOOL)hidesBottomBar animated:(BOOL)isAnimated;

-(void)valueChangekDatePicker:(UIDatePicker *)datePicker;

-(CGFloat)getTabBarHeight;


-(void)popPhotosVC;
-(void)popCameraVC;

-(void)handleSelectedPhotosSuccess;
@property (nonatomic,strong)UIImage *selectedImage;
@property (nonatomic,strong)NSMutableDictionary *imageDic;

- (void)setStatusBarBackgroundColor:(UIColor *)color;
-(void)showProgresHUD:(NSString *)msg;

//解决右滑返回的问题
- (BOOL)gestureRecognizerShouldBegin;


/**
 导航栏添加文本按钮

 @param titles 文本数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

/**
 导航栏添加图标按钮

 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

/**
 导航栏添加文字按钮（文字颜色、背景颜色）

 @param titles 标题数组
 @param textColors 文字颜色
 @param btnBackgroundColors 文字背景颜色
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
*/
- (void)addNavigationItemWithTitles:(NSArray *)titles textColors:(NSArray *)textColors btnBackgroundColors:(NSArray *)btnBackgroundColors isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

//弹出框
-(void)windowShowWarning:(NSString *)text;

//json to NSDictionary
- (NSDictionary *)stringToDictionary:(NSString *)jsonString;

//判断对象是否为空
- (BOOL)isEmpty:(id)object;






/**
 创建默认navigationBar左侧返回
 */
//- (void)createBackOfNavi;
/// 每次实例化一个  因为登录过后切换root问题
- (void)setStatusBarBackgroundColor:(UIColor *)color;
/// 只实例化一个
- (void)setStaticStatusBarBackgroundColor:(UIColor *)color;
/// 设置导航栏背景颜色
/// @param color 颜色
- (void)setupNavigaionBarBackGroundColor:(UIColor *)color isOpaque:(BOOL)isOpaque;

/// 这是导航栏背景图片
/// @param iamgeName 图片名字
- (void)setupNavigaionBarBackGroundImage:(NSString *)iamgeName isOpaque:(BOOL)isOpaque;

/// 设置返回按钮图片
/// @param imageName 图片名字
- (void)setupNavigationBarBackBtnWithImageName:(NSString *)imageName;

/// 设置导航栏titile文字颜色
/// @param color 色值
- (void)setupNavigationBarTitleColor:(UIColor *)color;


/// 设置导航栏阴影图片
/// @param imageName 图片名字
- (void)setupNavigationBarShadowImage:(NSString *)imageName;


-(void)createLeftBarButtonCustomItem:(NSString *)content Img:(UIImage *__nullable)img Select:(NSString*)method Margin:(CGFloat)margin Rect:(CGRect)bound;

/**
 创建右边的navigationbar上的按钮
 
 @param content 标题
 @param img 图片
 @param method 方法名称的字符串
 @param margin  (+ / -) + 为向右，- 为向左 偏移
 @param bound 宽高
 */
-(void)createRightBarButtonCustomItem:(NSString *)content Img:(UIImage *__nullable)img Select:(NSString*)method Margin:(CGFloat)margin Rect:(CGRect)bound;


/// 隐藏导航栏下面的线
- (void)hiddenBottomLine;


@property (nonatomic , strong)UIButton *backBtn;
@property (nonatomic , strong)UIButton *rightBtn;



/// 过滤数组相同的元素
/// @param originalArray 传入的数组
-(NSMutableArray *)filter:(NSArray *)originalArray;



@end
