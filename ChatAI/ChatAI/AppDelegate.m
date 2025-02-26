//
//  AppDelegate.m
//  ChatAI
//
//  Created by Apple on 2023/7/21.
//

#import "AppDelegate.h"
#import "demoVC.h"
#import "TabBarVC.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "SimpleChatMainViewController.h"
#import "ViewController.h"
#import "CWSqliteModelTool.h"
#import "AIChatQuestionModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;//点击背景是否收起键盘
    [IQKeyboardManager sharedManager].toolbarDoneBarButtonItemText = @"完成";
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[SimpleChatMainViewController alloc] init]];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = nav;
    [AppDelegate uncaughtSignalExceptionHandler];
    BOOL result = [CWSqliteModelTool deleteTableAllData:[AIChatQuestionModel class] uid:nil targetId:nil isKeepTable:YES];
    [CommonUtil deleteQuestionId];
//    [self test];
    return YES;
}
-(void)applicationWillTerminate:(UIApplication *)application{
}
+(void)uncaughtSignalExceptionHandler {
    NSSetUncaughtExceptionHandler(&CustomExceptionHandlers);
}
void CustomExceptionHandlers(NSException *exception){
    NSMutableDictionary *userInfo= [NSMutableDictionary dictionaryWithDictionary:[exception userInfo]];
    [userInfo setObject:exception.callStackSymbols forKey:@"CallstackSymbolsKey"];
    [userInfo setObject:[exception name] forKey:@"NameKey"];
    [userInfo setObject:[exception reason] forKey:@"ReasonKey"];
    NSLog(@"%@",userInfo);
    //可以在这个位置进行一些操作，比如保存或上传等，可以将堆栈信息一起上传
    BOOL result = [CWSqliteModelTool deleteTableAllData:[AIChatQuestionModel class] uid:nil targetId:nil isKeepTable:YES];
    [CommonUtil deleteQuestionId];
}

-(void)test{
    NSArray *array1 = @[@"2016-10-01",@"2016-10-02",@"2016-10-03",
     
                            @"2016-10-01",@"2016-10-02",@"2016-10-03",
     
                            @"2016-10-01",@"2016-10-02",@"2016-10-03",
     
                            @"2016-10-01",@"2016-10-02",@"2016-10-03",
     
                            @"2016-10-01",@"2016-10-02",@"2016-10-03",
     
                            @"2016-10-01",@"2016-10-02",@"2016-10-03",
     
                            @"2016-10-04",@"2016-10-06",@"2016-10-08",
     
                            @"2016-10-05",@"2016-10-07",@"2016-10-09"];
        NSMutableArray *array = [NSMutableArray arrayWithArray:array1];
     
        NSMutableArray *dateMutablearray = [@[] mutableCopy];
        for (int i = 0; i < array.count; i ++) {
     
            NSString *string = array[i];
     
            NSMutableArray *tempArray = [@[] mutableCopy];
     
            [tempArray addObject:string];
     
            for (int j = i+1; j < array.count; j ++) {
     
                NSString *jstring = array[j];
     
                if([string isEqualToString:jstring]){
     
                    [tempArray addObject:jstring];
     
                    [array removeObjectAtIndex:j];
                    j -= 1;
     
                }
     
            }
     
            [dateMutablearray addObject:tempArray];
     
        }
     
        NSLog(@"dateMutable:%@",dateMutablearray);
}
@end
