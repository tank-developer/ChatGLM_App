//
//  BaseVC.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseVC.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "JLSizeConstant.h"
#import "TabBarVC.h"
#import "CommonUtil.h"
//#import "SCAppleDelegate.h"
#import "AppDelegate.h"
#import "CBAppConfig.h"


@interface BaseVC ()


@end

@implementation BaseVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.loginService = [[LoginService alloc] init];
    self.sessionManager = [[AFHTTPSessionManager alloc] init];
    //设置超时时间
    [self.sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    self.sessionManager.requestSerializer.timeoutInterval = 10.f;
    [self.sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    self.requestWithURLDic = [[NSDictionary alloc] init];
    [self initBaseVo];
    [self initBaseView];
    [self initService];
    
}
- (void)initBaseVo{}
- (void)initBaseView{}
- (void)initService{}

- (void)initBaseVo :(BaseVo *) baseVo{
    baseVo = [[BaseVo alloc] init];
}

- (void)initBaseView :(BaseView *) baseView{
    [self.view addSubview:baseView];
}

-(void) popupMsgAlertView:(NSString *)title message:(NSString *)message{
    //[CommonUtil alertWithTitle:title msg:message];
    // 参数preferredStyle:是IAlertController的样式
    // UIAlertControllerStyleAlert 创建出来相当于UIAlertView
    // UIAlertControllerStyleActionSheet 创建出来相当于 UIActionSheet
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self handlePopupMsgAlertViewSaveAction];
    }];
    [alertController addAction:saveAction];
    [self presentViewController:alertController animated:YES completion:nil];
    //Donot know why the FJQAlertView not work
    /*FJQAlertView *alertView = [[FJQAlertView alloc] initWithTitle:title message:message delegate:self buttonTitles:@"确定", nil];
     [alertView show];
     [alertView setMessageColor:[UIColor blackColor] fontSize:14];
     [alertView setButtonTitleColor:[UIColor blackColor] fontSize:18 atIndex:0];
     */
}
-(void)popAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withButton1:(NSString *)button1 withButton2:(NSString *)button2
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:button1 style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self handlePopupAlertViewButton1Action];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:button2 style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
        [self handlePopupAlertViewButton2Action];
    }];
    //title
    //    NSMutableAttributedString *alertTitleStr = [[NSMutableAttributedString alloc] initWithString:title];
    //    [alertTitleStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 2)];
    //    [alertTitleStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 2)];
    //    [alertController setValue:alertTitleStr forKey:@"attributedTitle"];
    
    //    NSMutableAttributedString *alertMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
    //    [alertMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, 7)];
    //    [alertMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(5, 2)];
    //    [alertController setValue:alertMessageStr forKey:@"attributedMessage"];
    
    [cancelAction setValue:[UIColor whiteColor] forKey:@"_titleTextColor"];
    [saveAction setValue:[UIColor whiteColor] forKey:@"_titleTextColor"];
    
    [alertController addAction:saveAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void) popupYesOrNoAlertView:(NSString *)title message:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self handlePopupYesOrNoAlertViewYesAction];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
        [self handlePopupYesOrNoAlertViewNoAction];
    }];
    [alertController addAction:saveAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
    //[CommonUtil alertYesOrNoWithTitle:title msg:message];
    //Donot know why the FJQAlertView not work
    /*FJQAlertView *alertView = [[FJQAlertView alloc] initWithTitle:title message:message delegate:self buttonTitles:@"确定",@"取消", nil];
     [alertView show];
     [alertView setMessageColor:[UIColor blackColor] fontSize:14];
     [alertView setButtonTitleColor:[UIColor blackColor] fontSize:18 atIndex:0];
     */
}
-(void) popupAlertViewEditView:(NSString *)title message:(NSString *)message editViewPlaceHolder:(NSString *)placeholderText{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholderText;
    }];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        UITextField *text = alertController.textFields.firstObject;
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setObject:text.text forKey:@"text"];
        [self handleAlertControllerEditView:dic];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
    }];
    [alertController addAction:saveAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)handleAlertControllerEditView:(NSMutableDictionary *)alertDic{
    
}
-(void) popupAlertViewEditView2:(NSString *)title message:(NSString *)message editViewPlaceHolder:(NSString *)placeholderText editViewPlaceHolder2:(NSString *)placeholderText2{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholderText;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholderText2;
    }];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        UITextField *text = alertController.textFields.firstObject;
        UITextField *text2 = alertController.textFields.lastObject;
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setObject:text.text forKey:@"text"];
        [dic setObject:text2.text forKey:@"text2"];
        [self handleAlertControllerEditView2:dic];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
    }];
    [alertController addAction:saveAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)handleAlertControllerEditView2:(NSMutableDictionary *)alertDic{
    
}
-(void)requestWithURL:url withParameter:(NSMutableDictionary *)pamDic loadingText:(NSString *) loadingText{
    [self requestWithURLWithLoadingText:url withParameter:pamDic withLoadingText:loadingText];
}
//post请求
-(void)requestWithURL:(NSString *)url withParameter:(NSMutableDictionary *)pamDic isHeader:(BOOL)isHeader{
    if (isHeader) {
        [self requestWithURLAndrequestHeader:url withParameter:pamDic];
        return;
    }
    [self requestWithURLWithLoadingText:url withParameter:pamDic withLoadingText:@"加载中..."];
}


//get请求需要请求头
-(void)requestGetHaveHeaderWithURL:(NSString *)url  withParameter:(NSMutableDictionary *)pamDic{
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程执行
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            mbp.mode = MBProgressHUDModeIndeterminate;
        });
        self.sessionManager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"text/json",@"text/javascript",@"application/json", nil];
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
        NSDictionary *dict = @{@"Content-Type":@"application/json"};
        for (id obj in dict) {
            [self.sessionManager.requestSerializer setValue:dict[obj] forHTTPHeaderField:obj];
        }
        [self.sessionManager GET:url parameters:pamDic headers:[NSDictionary new] progress:^(NSProgress * _Nonnull downloadProgress) {
            [self handleRequestWithURLProgress:url ];
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSObject *responseData = (NSObject *)responseObject;
                    self.requestWithURLDic = (NSDictionary *)responseData;
//                    [self popupMsgAlertView:@"提示" message:[self.requestWithURLDic objectForKey:@"msg"]];
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [self handleRequestWithURLSuccess:url];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"userInfo:%@,code:%ld",error.userInfo,(long)error.code);
                    self.errorMsg = error;
                    if (error.code == -1009) {
                        [self popupMsgAlertView:@"提示" message:@"网络断开了"];
                    }else if (error.code == -1001){
                        [self popupMsgAlertView:@"提示" message:@"请求超时"];
                    }else{
//                        [self popupMsgAlertView:@"提示" message:error.debugDescription];
                    }
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [self handleRequestWithURLFailure:url ];
                }];

}

//get请求不需要请求头
-(void)requestGetWithURL:(NSString *)url  withParameter:(NSMutableDictionary *)pamDic{
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程执行
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            mbp.mode = MBProgressHUDModeText;
            mbp.label.text = @"加载中...";
        });
        self.sessionManager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"text/json",@"text/javascript",@"application/json", nil];
        [self.sessionManager GET:url parameters:pamDic headers:[NSDictionary new] progress:^(NSProgress * _Nonnull downloadProgress) {
            [self handleRequestWithURLProgress:url ];
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSObject *responseData = (NSObject *)responseObject;
                    self.requestWithURLDic = (NSDictionary *)responseData;
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //主线程执行
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                    });
                    [self handleRequestWithURLSuccess:url];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"userInfo:%@,code:%ld",error.userInfo,(long)error.code);
                    self.errorMsg = error;

                    if (error.code == -1009) {
                        [self popupMsgAlertView:@"提示" message:@"网络断开了"];
                    }else if (error.code == -1001){
                        [self popupMsgAlertView:@"提示" message:@"请求超时"];
                    }else{
                        [self popupMsgAlertView:@"提示" message:error.debugDescription];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //主线程执行
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                    });
                    [self handleRequestWithURLFailure:url ];
                }];


}
//post需要请求头
-(void)requestWithURLAndrequestHeader:(NSString *)url withParameter:(NSMutableDictionary *)pamDic{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //主线程执行
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        mbp.mode = MBProgressHUDModeIndeterminate;
        [mbp.bezelView setHidden:YES];
    });

    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    NSDictionary *dict = @{@"Content-Type":@"application/json"};
        for (id obj in dict) {
            [self.sessionManager.requestSerializer setValue:dict[obj] forHTTPHeaderField:obj];
        }
        //    __weak BaseVC *weakSelf= self;
        [self.sessionManager POST:url parameters:pamDic headers:[NSDictionary new] progress:^(NSProgress * _Nonnull uploadProgress) {
            [self handleRequestWithURLProgress:url ];

                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSObject *responseData = (NSObject *)responseObject;
                    self.requestWithURLDic = (NSDictionary *)responseData;
                    [self popupMsgAlertView:@"提示" message:[self.requestWithURLDic objectForKey:@"msg"]];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //主线程执行
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                    });
                    [self handleRequestWithURLSuccess:url];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"userInfo:%@,code:%ld",error.userInfo,(long)error.code);
                    self.errorMsg = error;
                    if (error.code == -1009) {
                        [self popupMsgAlertView:@"提示" message:@"网络断开了"];
                    }else if (error.code == -1001){
                        [self popupMsgAlertView:@"提示" message:@"请求超时"];
                    }else{
                        [self popupMsgAlertView:@"提示" message:error.debugDescription];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //主线程执行
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                    });
                    [self handleRequestWithURLFailure:url ];
                }];
//    });
}
//post不需要请求头
-(void)requestWithURLWithLoadingText:(NSString *)url withParameter:(NSMutableDictionary *)pamDic withLoadingText:(NSString *)loadingText{
    
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程执行
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            mbp.mode = MBProgressHUDModeIndeterminate;
            [mbp.bezelView setHidden:YES];
        });
        self.sessionManager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"text/json",@"text/javascript",@"application/json", nil];
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        //    __weak BaseVC *weakSelf= self;
        [self.sessionManager POST:url parameters:pamDic headers:[NSDictionary new] progress:^(NSProgress * _Nonnull uploadProgress) {
            [self handleRequestWithURLProgress:url ];
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //主线程执行
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                    });
                    NSObject *responseData = (NSObject *)responseObject;
                    self.requestWithURLDic = (NSDictionary *)responseData;
//                    NSLog(@"responseObject:%@",responseObject);
                    [self handleRequestWithURLSuccess:url];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"userInfo:%@,code:%ld",error.userInfo,(long)error.code);
                    self.errorMsg = error;
                    if (error.code == -1009) {
                        [self popupMsgAlertView:@"提示" message:@"网络断开了"];
                    }else if (error.code == -1001){
                        [self popupMsgAlertView:@"提示" message:@"请求超时"];
                    }else{
//                        [self popupMsgAlertView:@"提示" message:error.debugDescription];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //主线程执行
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                    });
                    [self handleRequestWithURLFailure:url ];
                }];
}

-(void) handleRequestWithURLProgress:url {
    self.requestURL = url;
}
-(void) handleRequestWithURLSuccess:url {
    self.requestURL = url;
}
-(void) handleRequestWithURLFailure:url {
    self.requestURL = url;
}
-(void)handlePopupYesOrNoAlertViewYesAction{
}
-(void)handlePopupYesOrNoAlertViewNoAction{
}
-(void)handlePopupAlertViewButton1Action{
}
-(void)handlePopupAlertViewButton2Action{
}
-(void)handlePopupMsgAlertViewSaveAction{
    if ([@"99" isEqualToString:[self.requestWithURLDic objectForKey:@"status"]]) {
//        [self goToTargetVC:[[LoginVC alloc]init]];
    }
}
-(void)goToTargetVC:(UIViewController *)vc{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    appDelegate.window.rootViewController = vc;
    [appDelegate.window makeKeyAndVisible];
}

-(UIButton *)addInputBtn{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIButton *inputBtn = [UIButton new];
    inputBtn.frame = CGRectMake(SCREEN_WIDTH - (100+20), SCREEN_HEIGHT - 150, 100, 44);
    [appDelegate.window addSubview:inputBtn];
    inputBtn.backgroundColor = [UIColor whiteColor];
    [inputBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [inputBtn addTarget:self action:@selector(inputAction:) forControlEvents:UIControlEventTouchUpInside];
    [inputBtn setTitle:@"记一笔" forState:UIControlStateNormal];
//    [inputBtn setImage:[UIImage imageNamed:@"编辑_edit-one"] forState:UIControlStateNormal];
    inputBtn.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    inputBtn.layer.shadowOffset = CGSizeMake(0, 6); // 阴影偏移量，默认（0,0）
    inputBtn.layer.shadowOpacity = 1; // 不透明度
    inputBtn.layer.shadowRadius = [UIScreen mainScreen].bounds.size.width/375*10;
    // 添加边框
    inputBtn.layer.borderColor = [UIColor redColor].CGColor;
    inputBtn.layer.borderWidth = 0.5;
    inputBtn.layer.masksToBounds = NO; // 剪切边界，如果视图上的子视图layer超过视图layer部分，就会裁减掉，所以，如果添加阴影，这个必须设置为NO，不然会裁减掉阴影
    inputBtn.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/375*7.5;
    
    return inputBtn;
}
-(void)inputAction:(UIButton *)btn{
    
}
@end
