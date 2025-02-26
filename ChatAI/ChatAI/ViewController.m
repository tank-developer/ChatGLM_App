//
//  ViewController.m
//  ChatAI
//
//  Created by Apple on 2023/7/21.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <JWT/JWT.h>

//异步
static NSString *asyncURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/chatglm_std/async-invoke";
//同步
static NSString *syncURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/chatglm_std/invoke";
//result
static NSString *resultURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/-/async-invoke/";
//SSE
static NSString *sseURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/chatglm_std/sse-invoke";

//apiKey
static NSString *_apiKey = @"a843aa7e00ec9514fe1f256b15cf5c02.6CwRTID2TxoYKz0g";


@interface ViewController ()<NSURLConnectionDataDelegate>
@property (nonatomic,strong)AFHTTPSessionManager *manager;
@property (nonatomic,copy)NSDictionary *header;
/** 可变的二进制数据 */
@property (nonatomic, strong) NSMutableData *fileData;
@end

@implementation ViewController
/*
 懒加载
 */
 -(NSMutableData *)fileData{
     if (!_fileData) {
         _fileData = [[NSMutableData alloc]init];
     }
     return _fileData;
 }
-(AFHTTPSessionManager *)manager{
    if(!_manager){
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
-(NSMutableDictionary *)getContent{
    NSDictionary *contentDic = @{@"role":@"user",
                                @"content":@"用Java写一段代码"};
    NSDictionary *contentDic1 = @{@"role":@"user",
                                @"content":@"你好"};
    NSDictionary *contentDic2 = @{@"role":@"user",
                                @"content":@"你好"};
    
    NSMutableArray *content = [NSMutableArray new];
    [content addObject:contentDic];
    NSMutableDictionary *paramDict = [NSMutableDictionary new];
    [paramDict setObject:content forKey:@"prompt"];
    return paramDict;
}
-(NSString *)getContentStr{
    NSDictionary *contentDic = @{@"role":@"user",
                                @"content":@"你是谁"};
    NSDictionary *contentDic1 = @{@"role":@"user",
                                @"content":@"你好"};
    NSDictionary *contentDic2 = @{@"role":@"user",
                                @"content":@"你好"};
    
    NSMutableArray *content = [NSMutableArray new];
    [content addObject:contentDic];
    NSMutableDictionary *paramDict = [NSMutableDictionary new];
    [paramDict setObject:content forKey:@"prompt"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramDict options:0 error:nil];
    NSLog(@"ns data is %@",jsonData);
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return json;
}
-(NSDictionary *)generate_token{
    NSString *apiKey = _apiKey;
    NSArray *apiKeyArray = [apiKey componentsSeparatedByString:@"."];
    NSString *idStr = [NSString stringWithFormat:@"%@",[apiKeyArray firstObject]];
    NSString *secret = [NSString stringWithFormat:@"%@",[apiKeyArray objectAtIndex:1]];

    NSString *time = [self getNowTimeTimestamp];
    NSInteger exp = [time integerValue] + 1800;
    NSString *expstr = [NSString stringWithFormat:@"%ld",(long)exp];
    
    NSMutableDictionary *payload = [NSMutableDictionary new];
    [payload setObject:idStr forKey:@"api_key"];
    [payload setObject:expstr forKey:@"exp"];
    [payload setObject:time forKey:@"timestamp"];
    
    // encode it
    NSString *algorithmName = @"HS256";
    NSMutableDictionary *headers = [NSMutableDictionary new];
    [headers setObject:@"HS256" forKey:@"alg"];
    [headers setObject:@"SIGN" forKey:@"sign_type"];
    id<JWTAlgorithm> algorithm = [JWTAlgorithmFactory algorithmByName:algorithmName];
    JWTBuilder *encodeBuilder = [JWT encodePayload:payload];
    NSString *token = encodeBuilder.payload(payload).secret(secret).algorithm(algorithm).headers(headers).encode;
    if (encodeBuilder.jwtError == nil) {
        // handle encoded result
        NSLog(@"encoded result: %@", token);
    }
    else {
        // handle error
        NSLog(@"encode failed, error: %@", encodeBuilder.jwtError);
    }
    NSDictionary *requestHeaders = [[NSDictionary alloc] initWithObjectsAndKeys:token,@"Authorization", nil];
    return requestHeaders;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.header = [self generate_token];
    // Do any additional setup after loading the view.
    //sse请求
//    [self NSURLConnection];
//    [self NSURLSession];
    
    //同步
    [self invoke];
    //异步
//    [self async_method];
}
-(void)NSURLConnection{
    NSString *json = [self getContentStr];
    //1、创建一个URL
    NSURL *url = [NSURL URLWithString:sseURL];

    //2、创建请求(Request)对象 这里使用的是它的子类NSMutableURLRequest,因为子类才具有设置方法和设置请求体的属性
    NSMutableURLRequest *requst = [[NSMutableURLRequest alloc]initWithURL:url];
    //2.1、设置请求方法
    requst.HTTPMethod = @"POST";
    //2.2、设置请求体,因为传入的为Data数据所有这里需要转换
    requst.HTTPBody = [json dataUsingEncoding:NSUTF8StringEncoding];
    //2.3、设置请求超时时间，如果超过这个时间，请求为失败
    requst.timeoutInterval = 10;
    [requst setValue:@"text/event-stream" forHTTPHeaderField:@"Content-Type"];
    NSString *token = [self.header objectForKey:@"Authorization"];
    [requst setValue:token forHTTPHeaderField:@"Authorization"];
    [requst setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest:requst delegate:self startImmediately:NO];
    [connect start];
}
//2、实现代理中的四个方法
//1.当接受到服务器响应的时候会调用:response(响应头)
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"接受到相应");

}
//2.当接受到服务器返回数据的时候调用(会调用多次)
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // 处理数据
    NSString* dataStr  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"didReceiveData:%@",dataStr);
    [self.fileData appendData:data];
}
//3.当请求失败的时候调用
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
  NSLog(@"请求失败");
}
//4.当请求结束(成功|失败)的时候调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // 请求完成
    NSLog(@"connectionDidFinishLoading");
    //解析数据
    NSLog(@"%@",[[NSString alloc]initWithData:self.fileData encoding:NSUTF8StringEncoding]);

}



-(void)NSURLSession{
    
    NSString *json = [self getContentStr];

    //1、创建一个URL
    NSURL *url = [NSURL URLWithString:sseURL];

    //2、创建请求(Request)对象 这里使用的是它的子类NSMutableURLRequest,因为子类才具有设置方法和设置请求体的属性
    NSMutableURLRequest *requst = [[NSMutableURLRequest alloc]initWithURL:url];
    //2.1、设置请求方法
    requst.HTTPMethod = @"POST";
    //2.2、设置请求体,因为传入的为Data数据所有这里需要转换
    requst.HTTPBody = [json dataUsingEncoding:NSUTF8StringEncoding];
    //2.3、设置请求超时时间，如果超过这个时间，请求为失败
    requst.timeoutInterval = 10;
    [requst setValue:@"text/event-stream" forHTTPHeaderField:@"Content-Type"];
    NSString *token = [self.header objectForKey:@"Authorization"];

    [requst setValue:token forHTTPHeaderField:@"Authorization"];
    [requst setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //3、发送请求
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:requst completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
     if (error) {
         NSLog(@"Error: %@",error);
     } else {
         // 处理响应数据
         NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
         NSLog(@"Response: %@", responseString);
     }
    }];
    [task resume];
}
//同步调用
-(void)invoke{
    
    NSMutableDictionary *paramDict = [self getContent];
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //同步调用
    NSString *url = syncURL;
    
    __weak typeof(self) weakSelf = self;
    
    [self.manager POST:url parameters:paramDict headers:self.header progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@---%@",[responseObject class],responseObject);
            NSDictionary *obj = (NSDictionary *)responseObject;
            NSDictionary *data = [obj objectForKey:@"data"];
            NSLog(@"data:%@",data);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败--%@",error);
        }];
}
//异步调用
-(void)async_method{
    NSMutableDictionary *paramDict = [self getContent];

    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //异步调用
    NSString *url = asyncURL;
    
    __weak typeof(self) weakSelf = self;
    
    [self.manager POST:url parameters:paramDict headers:self.header progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@---%@",[responseObject class],responseObject);
            NSDictionary *obj = (NSDictionary *)responseObject;
            NSDictionary *data = [obj objectForKey:@"data"];
            
            NSString *task_id  = [data objectForKey:@"task_id"];
            [weakSelf getMsgRespone:task_id];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败--%@",error);
        }];
}
//查询结果接口
-(void)getMsgRespone:(NSString *)task_id{
    NSString *url = resultURL;
    NSString *allURL = [NSString stringWithFormat:@"%@%@",url,task_id];
    //1.创建会话管理者
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSMutableDictionary *paramDict = [NSMutableDictionary new];
    
    [self.manager GET:allURL parameters:paramDict headers:self.header progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@---%@",[responseObject class],responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败--%@",error);

        }];
}

-(NSString *)getNowTimeTimestamp{
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
     [formatter setDateStyle:NSDateFormatterMediumStyle];
     [formatter setTimeStyle:NSDateFormatterShortStyle];
     [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
     //设置时区,这个对于时间的处理有时很重要
     NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
     [formatter setTimeZone:timeZone];
     NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
     NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
     return timeSp;
}
@end
