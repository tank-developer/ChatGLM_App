//
//  BaseVC.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "CoreVC.h"
#import "BaseView.h"
#import "BaseVo.h"
//#import "AFHTTPSessionManager.h"
#import <AFNetworking/AFNetworking.h>
#import "URLConstant.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "constant.h"

@interface BaseVC : CoreVC
@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;

//网络
@property (nonatomic,strong) NSString * requestWithURLMsg;
@property (nonatomic,strong) NSDictionary *requestWithURLDic;
@property (nonatomic,strong) NSString * requestWithURLRstCode;
@property (nonatomic,strong) NSError *errorMsg;
@property (nonatomic,copy) NSString *requestURL;
-(void)goToTargetVC:(UIViewController *)vc;

/**
 *post 默认无请求头
 */
-(void)requestWithURL:url withParameter:(NSMutableDictionary *)pamDic loadingText:(NSString *) loadingText;
/**
 * post isHeader  是否有请求头
 */
-(void)requestWithURL:(NSString *)url withParameter:(NSMutableDictionary *)pamDic isHeader:(BOOL)isHeader;

/**
 * get isHeader  没有请求头
 */
-(void)requestGetWithURL:(NSString *)url  withParameter:(NSMutableDictionary *)pamDic;
/**
 * get isHeader  有请求头
 */
-(void)requestGetHaveHeaderWithURL:(NSString *)url  withParameter:(NSMutableDictionary *)pamDic;

-(void) handleRequestWithURLProgress:url;
-(void) handleRequestWithURLFailure:url;
-(void) handleRequestWithURLSuccess:url;

//初始化
- (void)initBaseView :(BaseView *) baseView;
- (void)initBaseVo :(BaseVo *) baseVo;
- (void)initBaseView;
- (void)initBaseVo;
- (void)initService;
//alertView
-(void)popAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withButton1:(NSString *)button1 withButton2:(NSString *)button2;
-(void) popupYesOrNoAlertView:(NSString *)title message:(NSString *)message;
-(void) popupMsgAlertView:(NSString *)title message:(NSString *)message;
-(void) popupAlertViewEditView:(NSString *)title message:(NSString *)message editViewPlaceHolder:(NSString *)placeholderText;
-(void) popupAlertViewEditView2:(NSString *)title message:(NSString *)message editViewPlaceHolder:(NSString *)placeholderText editViewPlaceHolder2:(NSString *)placeholderText2;

// 回调
-(void)handlePopupYesOrNoAlertViewYesAction;
-(void)handlePopupYesOrNoAlertViewNoAction;
-(void)handlePopupAlertViewButton1Action;
-(void)handlePopupAlertViewButton2Action;
-(void)handlePopupMsgAlertViewSaveAction;
-(void)handleAlertControllerEditView:(NSMutableDictionary *)alertDic;
-(void)handleAlertControllerEditView2:(NSMutableDictionary *)alertDic;


//正则判断手机号
//- (BOOL)ja_justNumber;

-(UIButton *)addInputBtn;
-(void)inputAction:(UIButton *)btn;

@end
