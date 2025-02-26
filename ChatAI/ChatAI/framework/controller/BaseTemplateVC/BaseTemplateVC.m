//
//  BaseTemplateVC.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTemplateVC.h"

@interface BaseTemplateVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation BaseTemplateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BaseTemplateService *) getBaseTemplateService{
    return nil;
}
-(BaseTemplateView *) getBaseTemplateView{
    return nil;
}
-(NSString *) getVCName{
    return nil;
}
- (void)initBaseView :(BaseView *) baseView{
    [self.view addSubview:baseView];
    [self addNavLeftBarButton];
    [self addNavRightBarButton];
    [self addNavtionItemTitleView:@""];
    self.pamDic = [[NSMutableDictionary alloc] init];
    if (self.elementObjList == nil) {
        self.elementObjList =[[NSMutableArray alloc]init];
    }
    [self applyElementKey];
    [self hideElementsByPermission];
    
    
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height, self.view.frame.size.width - 40, 150)];
    [self.view addSubview:self.datePicker];
    //默认根据手机本地设置显示为中文还是其他语言
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文显示
    self.datePicker.locale = locale;
    //四种 类型
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    //设置日期模式(Displays month, day, and year depending on the locale setting)
    // 设置当前显示时间
    [self.datePicker setDate:[NSDate date] animated:YES];
    //添加事件
    [self.datePicker addTarget:self action:@selector(valueChangekDatePicker:) forControlEvents:UIControlEventValueChanged];
    //设置显示格式
    self.datePicker.backgroundColor=[UIColor lightGrayColor];
    if (@available(iOS 13.4, *)) {
        self.datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    }

  


}


-(void)valueChangekDatePicker:(UIDatePicker *)datePicker{
}

-(CGFloat)getNavigationHeight{
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
    return navHeight;
}
-(CGFloat)getStatusBarHeight{
    CGFloat he = [[UIApplication sharedApplication] statusBarFrame].size.height;
    return he;
}



-(void)applyElementKey{
    
}

-(void)hideElementsByPermission{
    
}

-(void) addNavRightBarButton{
//    UIButton *backBtn = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 44, 44)];
//    [backBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.rightBarButtonItem = item;
//    [backBtn addTarget:self action:@selector(pushNewVC:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void) addNavLeftBarButton{
    YYNavLeftBtn *backBtn = [[YYNavLeftBtn alloc] initWithFrame: CGRectMake(0, 0, 44, 44) btnImgName:@"back" btnLbl:@""];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = item;
    [backBtn addTarget:self action:@selector(popToVC:) forControlEvents:UIControlEventTouchUpInside];
}

//-(void)pushNewVC:(UIButton *)btn{
//    
//}
//解决右滑返回的问题
- (BOOL)gestureRecognizerShouldBegin{

    [self popToVC:nil];

    return NO;
}

-(void)addNavtionItemTitleView:(NSString *)title{
    UILabel *topTile = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    topTile.text = title;
    topTile.textColor = [UIColor whiteColor];
    topTile.font = [UIFont systemFontOfSize:17];
    self.navigationItem.titleView = topTile;
}
-(void)popToVC:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//返回到上一级控制器
-(void)popToVCAnimated:(BOOL)isAnimated{
    [self.navigationController popViewControllerAnimated:isAnimated];
}
//返回到根控制器
-(void)popToRootVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//返回到指定控制器
-(void)popToVCWith:(UIViewController *)targetVC{
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[targetVC class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}
//push到下一个控制器。
-(void)pushToNextVCWith:(UIViewController *)vc ishidesBottomBar:(BOOL)hidesBottomBar animated:(BOOL)isAnimated{
    vc.hidesBottomBarWhenPushed = hidesBottomBar;
    [self.navigationController pushViewController:vc animated:isAnimated];
    //vc.hidesBottomBarWhenPushed = hidesBottomBar; 放在底部无效
}

-(void)popPhotosVC{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    // 设置代理
    imagePickerController.delegate = self;
    // 是否允许编辑（默认为NO）
    imagePickerController.allowsEditing = YES;
    // 设置进入相机时使用前置或后置摄像头
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // 展示选取照片控制器
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

-(void)popCameraVC{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    // 设置代理
    imagePickerController.delegate = self;
    // 是否允许编辑（默认为NO）
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 设置进入相机时使用前置或后置摄像头
    imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    // 展示选取照片控制器
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}
#pragma mark - UIImagePickerControllerDelegate
// 完成图片的选取后调用的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];

    /* 此处参数 info 是一个字典，下面是字典中的键值 （从相机获取的图片和相册获取的图片时，两者的info值不尽相同）
     * UIImagePickerControllerMediaType; // 媒体类型
     * UIImagePickerControllerOriginalImage; // 原始图片
     * UIImagePickerControllerEditedImage; // 裁剪后图片
     * UIImagePickerControllerCropRect; // 图片裁剪区域（CGRect）
     * UIImagePickerControllerMediaURL; // 媒体的URL
     * UIImagePickerControllerReferenceURL // 原件的URL
     * UIImagePickerControllerMediaMetadata // 当数据来源是相机时，此值才有效
     */
    // 从info中将图片取出，并加载到imageView当中
    self.selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
     NSData *imageData = UIImagePNGRepresentation(self.selectedImage);

    self.imageDic = [[NSMutableDictionary alloc] init];
    [self.imageDic setObject:imageData forKey:@"userLogoKey"];
    [self handleSelectedPhotosSuccess];
    
    [self loadImageFinished:self.selectedImage];
    
}

- (void)loadImageFinished:(UIImage *)image{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

// 取消选取调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:^{}];
    [self handelSelectedPhotosFail];
}
-(void)handleSelectedPhotosSuccess{
    
}
-(void)handelSelectedPhotosFail{
    
}

//-(void)addSearchBarIsHide:(BOOL)isYes{
//    self.searchBar.hidden = isYes;
////    self.searchBar = [[UISearchBar alloc] init];
////    self.searchBar.hidden = isYes;
////    self.searchBar.frame = CGRectMake(80, 10, SCREEN_WIDTH-100, 30);
////    [self.navigationController.navigationBar addSubview:self.searchBar];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)setStatusBarBackgroundColor:(UIColor *)color{
    if(@available(iOS 13.0, *)) {
        UIView *statusBar2 = nil;
        statusBar2 = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame] ;
                [[UIApplication sharedApplication].keyWindow addSubview:statusBar2];
        statusBar2.backgroundColor= color;
    }else{
        UIView *statusBar2 = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        if([statusBar2 respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar2.backgroundColor= color;
        }
    }
}

-(void)showProgresHUD:(NSString *)msg{
    MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    mbp.mode = MBProgressHUDModeText;
    mbp.label.text = msg;
    [mbp hideAnimated:YES afterDelay:1.0f];
}
-(CGFloat)getTabBarHeight{
    return self.tabBarController.tabBar.frame.size.height;;
}


#pragma mark ————— 导航栏 添加图片按钮 —————
/**
 导航栏添加图标按钮
 
 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray * items = [[NSMutableArray alloc] init];
    //调整按钮位置
    //    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    //将宽度设为负值
    //    spaceItem.width= -5;
    //    [items addObject:spaceItem];
    NSInteger i = 0;
    for (NSString * imageName in imageNames) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        if (isLeft) {
//            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
        }else{
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        
        btn.tag = [tags[i++] integerValue];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

/**
导航栏添加图标按钮

@param titles 标题数组
@param isLeft 是否是左边 非左即右
@param target 目标
@param action 点击方法
@param tags tags数组 回调区分用
*/
- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    
    //调整按钮位置
//    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //将宽度设为负值
//    spaceItem.width= -5;
//    [items addObject:spaceItem];
    
    NSMutableArray * buttonArray = [NSMutableArray array];
    NSInteger i = 0;
    for (NSString * title in titles) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [YEUtil makeCornerRadius:4 view:btn];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = kSystemFont(14);
        btn.backgroundColor = [UIColor redColor];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = [tags[i++] integerValue];
        [btn sizeToFit];
        
        //设置偏移
        if (isLeft) {
//            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
        }else{
//            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        [buttonArray addObject:btn];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

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
- (void)addNavigationItemWithTitles:(NSArray *)titles textColors:(NSArray *)textColors btnBackgroundColors:(NSArray *)btnBackgroundColors isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    
    //调整按钮位置
//    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //将宽度设为负值
//    spaceItem.width= -5;
//    [items addObject:spaceItem];
    
    NSMutableArray * buttonArray = [NSMutableArray array];
    NSInteger i = 0;
    for (NSString * title in titles) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [YEUtil makeCornerRadius:4 view:btn];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = kSystemFont(16);
        btn.tag = [tags[i++] integerValue];
        [btn sizeToFit];
        [btn setBackgroundColor:btnBackgroundColors[i]];
        [btn setTitleColor:textColors[i] forState:UIControlStateNormal];
        
        //设置偏移
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
        }else{
//            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        [buttonArray addObject:btn];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

-(void)windowShowWarning:(NSString *)text{
    MBProgressHUD *mbp = [[MBProgressHUD alloc] initWithView:self.view];
    [kAppWindow addSubview:mbp];
    mbp.detailsLabel.text = text;
    mbp.detailsLabel.font = [UIFont systemFontOfSize:15];
    mbp.mode = MBProgressHUDModeText;
    [mbp showAnimated:YES];
    [mbp hideAnimated:YES afterDelay:1.0f];
}
 
//json to NSDictionary
- (NSDictionary *)stringToDictionary:(NSString *)jsonString{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    return dic;
}
- (BOOL)isEmpty:(id)object{
    if (object == nil || [object isEqual:[NSNull null]]) {
        return YES;
    } else if ([object isKindOfClass:[NSString class]]) {
        return [object isEqualToString:@""];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [object isEqualToNumber:@(0)];
    }
    return NO;
}


/// 只实例化一个
- (void)setStaticStatusBarBackgroundColor:(UIColor *)color {
    if(@available(iOS 13.0, *)) {
        static UIView *statusBar1 = nil;
        if(!statusBar1) {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                statusBar1 = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame] ;
                [[UIApplication sharedApplication].keyWindow addSubview:statusBar1];
                statusBar1.backgroundColor= color;
            });
        }else{
            statusBar1.backgroundColor= color;
        }
    }else{
        UIView *statusBar2 = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        if([statusBar2 respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar2.backgroundColor= color;
        }
    }
}

- (void)setupNavigaionBarBackGroundImage:(NSString *)imageName isOpaque:(BOOL)isOpaque
{
    [self.navigationController.navigationBar navBarBackGroundColor:nil image:[UIImage imageNamed:imageName] isOpaque:isOpaque];
}
- (void)setupNavigaionBarBackGroundColor:(UIColor *)color isOpaque:(BOOL)isOpaque
{
    [self.navigationController.navigationBar navBarBackGroundColor:color image:nil isOpaque:isOpaque];
}
- (void)setupNavigationBarBackBtnWithImageName:(NSString *)imageName
{
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(0, 0, 40, 45);
    self.backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    //图像
    [self.backBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 0)];
    [self.backBtn addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
}
- (void)hiddenBottomLine{
    [self.navigationController.navigationBar navBarBottomLineHidden:YES];
}
/// 这是导航栏阴影图片
- (void)setupNavigationBarShadowImage:(NSString *)imageName{
    self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:imageName];
}
- (void)setupNavigationBarTitleColor:(UIColor *)color{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:color}];
}
- (void)backItemClick
{
    //解决视图上移直接点返回造成的view上移下不来的情况
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    
    if (viewcontrollers.count>1) {
        
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self) {
            
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else{
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    
}
//- (void)backHandle:(UIPanGestureRecognizer *)recognizer
//{
//    [self customControllerPopHandle:recognizer];
//}
//- (void)customControllerPopHandle:(UIPanGestureRecognizer *)recognizer
//{
//    if(self.navigationController.childViewControllers.count == 1)
//    {
//        return;
//    }
//    // _interactiveTransition就是代理方法2返回的交互对象，我们需要更新它的进度来控制POP动画的流程。（以手指在视图中的位置与屏幕宽度的比例作为进度）
//    CGFloat process = [recognizer translationInView:self.view].x/self.view.bounds.size.width;
//    process = MIN(1.0, MAX(0.0, process));
//
//    if(recognizer.state == UIGestureRecognizerStateBegan)
//    {
//        // 此时，创建一个UIPercentDrivenInteractiveTransition交互对象，来控制整个过程中动画的状态
//        _interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//    else if(recognizer.state == UIGestureRecognizerStateChanged)
//    {
//        [_interactiveTransition updateInteractiveTransition:process]; // 更新手势完成度
//    }
//    else if(recognizer.state == UIGestureRecognizerStateEnded ||recognizer.state == UIGestureRecognizerStateCancelled)
//    {
//        // 手势结束时，若进度大于0.5就完成pop动画，否则取消
//        if(process > 0.5)
//        {
//            [_interactiveTransition finishInteractiveTransition];
//        }
//        else
//        {
//            [_interactiveTransition cancelInteractiveTransition];
//        }
//
//        _interactiveTransition = nil;
//    }
//}
#pragma mark - 默认navigationBar左侧按钮触发方法 pop

-(void)createLeftBarButtonCustomItem:(NSString *)content Img:(UIImage *__nullable)img Select:(NSString*)method Margin:(CGFloat)margin Rect:(CGRect)bound{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setFrame:bound];
    if (content) {
        [leftBtn setTitle:content forState:UIControlStateNormal];
        [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, margin,0, 0);//偏移
    }
    if (img) {
        [leftBtn setImage:img forState:UIControlStateNormal];
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, margin,0, 0);//偏移
    }
    SEL mo = NSSelectorFromString(method);
    [leftBtn addTarget:self action:mo forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=backItem;
}
#pragma mark - 创建navigationBar右侧按钮
-(void)createRightBarButtonCustomItem:(NSString *)content Img:(UIImage *__nullable)img Select:(NSString*)method Margin:(CGFloat)margin Rect:(CGRect)bound{
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_rightBtn setFrame:bound];
    if (content) {
        [_rightBtn setTitle:content forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, margin,0, 0);//偏移
    }
    if (img) {
        [_rightBtn setImage:img forState:UIControlStateNormal];
        _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, margin,0, 0);//偏移
    }
    
    SEL mo = NSSelectorFromString(method);
    [_rightBtn addTarget:self action:mo forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
    
    self.navigationItem.rightBarButtonItem=rightItem;
}
/// 过滤数组相同的元素
/// @param originalArray 传入的数组
-(NSMutableArray *)filter:(NSArray *)originalArray{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSString *item in originalArray) {
        if (![resultArray containsObject:item]) {
          [resultArray addObject:item];
        }
    }
    return resultArray;
}


@end
