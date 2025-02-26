//
//  SMProtocalVC.m
//  SimpleDiary
//
//  Created by APPLE on 2022/4/11.
//

#import "SMProtocalVC.h"
#import "Masonry.h"
#import <WebKit/WebKit.h>

#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define NavBarHeight 44.0
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define TopHeight (StatusBarHeight + NavBarHeight)


@interface SMProtocalVC ()<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic,strong)WKWebView *webView;
@end

@implementation SMProtocalVC

-(BaseTemplateView *) getBaseTableView{
    return self.protocalView;
}
-(NSString *) getVCName{
    return @"SMProtocalVC";
}
-(void) initBaseView{
    self.protocalView = [[SMProtocalView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.protocalView];
    self.protocalView.backgroundColor = [UIColor whiteColor];
    [self addNavtionItemTitleView:@"靓仔笔记隐私政策"];
    [self.protocalView addSubview:self.webView];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"https://service-jex1t0lm-1259034525.gz.apigw.tencentcs.com/release/APIGWHtmlDemo-1641951350"]];
    [self.webView loadRequest:request];
}

- (WKWebView *)webView
{
    if (nil == _webView) {
        // 可以做一些初始化配置定制
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.selectionGranularity = WKSelectionGranularityDynamic;
        configuration.allowsInlineMediaPlayback = YES;
        
        WKPreferences *preferences = [WKPreferences new];
        //是否支持JavaScript
        preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
        configuration.preferences = preferences;
        
        // 初始化WKWebView
        _webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:configuration];

        // 有两种代理，UIDelegate负责界面弹窗，navigationDelegate负责加载、跳转等
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        
    }
    return _webView;
}

#pragma mark - WKNavigationDelegate
/* 页面开始加载 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
}
/* 开始返回内容 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
     
}
/* 页面加载完成 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
     
}
/* 页面加载失败 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
     
}
/* 在发送请求之前，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}
/* 在收到响应后，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
     
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}
#pragma mark - WKUIDelegate
/// 处理alert弹窗事件
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    
    [self alert:@"温馨提示" message:message?:@"" buttonTitles:@[@"确认"] handler:^(int index, NSString *title) {
       completionHandler();
    }];
}

/// 处理Confirm弹窗事件
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    
    [self alert:@"温馨提示" message:message?:@"" buttonTitles:@[@"取消", @"确认"] handler:^(int index, NSString *title) {
       completionHandler(index != 0);
    }];
}

/// 处理TextInput弹窗事件
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:prompt preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(nil);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *text = [alert.textFields firstObject].text;
        NSLog(@"字符串：%@", text);
        completionHandler(text);
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 弹窗
- (void)alert:(NSString *)title message:(NSString *)message {
    [self alert:title message:message buttonTitles:@[@"确定"] handler:nil];
}

- (void)alert:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles handler:(void(^)(int, NSString *))handler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < buttonTitles.count; i++) {
        [alert addAction:[UIAlertAction actionWithTitle:buttonTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(i, action.title);
            }
        }]];
    }
    [self presentViewController:alert animated:YES completion:nil];
}



-(void)load{
    NSString *detailText;
    NSError *error;
    
    if (self.detaiType == DetailTypePrivacyPolicy) {
        [self addNavtionItemTitleView:@"靓仔笔记隐私政策"];
        detailText = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"隐私政策" ofType:@"txt"] encoding:NSUTF8StringEncoding error: &error];
    }else{
        [self addNavtionItemTitleView:@"靓仔笔记用户协议"];
        detailText = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"服务协议" ofType:@"txt"] encoding:NSUTF8StringEncoding error: &error];
    }
    UITextView *detailTextView = [UITextView new];
    detailTextView.backgroundColor = [UIColor whiteColor];
    detailTextView.showsVerticalScrollIndicator = NO;
    detailTextView.editable = NO;
    detailTextView.textAlignment = NSTextAlignmentCenter;
    
    [self.protocalView addSubview:detailTextView];
    
    [detailTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(TopHeight + 10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(0);
    }];
    
    
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:detailText];
    
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:10];
    
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [detailText length])];
    
    [attributedString1 addAttribute:NSFontAttributeName
     
                          value:[UIFont systemFontOfSize:14.0f]
     
                          range:NSMakeRange(0, [detailText length])];
//    if (self.detaiType == DetailTypePrivacyPolicy) {
//        NSString *str = @"掌上数据库隐私政策";
//        [attributedString1 addAttribute:NSFontAttributeName
//        value:[UIFont systemFontOfSize:18]
//        range:[[attributedString1 string] rangeOfString:str]];
//    }else{
//        NSString *str = @"掌上数据库App用户协议";
//        [attributedString1 addAttribute:NSFontAttributeName
//        value:[UIFont systemFontOfSize:18]
//        range:[[attributedString1 string] rangeOfString:str]];
//    }
    
    
    [detailTextView setAttributedText:attributedString1];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [detailTextView setContentOffset:CGPointMake(0, 0)];

//    });
}
@end
