//
//  ChatAITool.m
//  ChatAI
//
//  Created by Apple on 2023/7/23.
//

#import "ChatAITool.h"
#import <JWT/JWT.h>
#import <YYModel/YYModel.h>
#import "AIResponse.h"
#import <MJExtension/MJExtension.h>
#import "AIHistoryModelDao.h"
#import "CommonUtil.h"
#import "CWSqliteModelTool.h"
#import "AIChatQuestionModel.h"


//异步
static NSString *asyncURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/chatglm_std/async-invoke";
//同步
static NSString *syncURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/chatglm_std/invoke";
//result
static NSString *resultURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/-/async-invoke/";
//SSE 标准
//static NSString *sseURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/chatglm_std/sse-invoke";
//SSE Pro
static NSString *ssePrpURL = @"https://open.bigmodel.cn/api/paas/v3/model-api/chatglm_pro/sse-invoke";


//GLM 4 异步调用
//static NSString *GLM4 = @"https://open.bigmodel.cn/api/paas/v4/async/chat/completions";
//GLM 4 sse调用
static NSString *GLM4 = @"https://open.bigmodel.cn/api/paas/v4/chat/completions";

//apiKey
#warning 这个需要开发者自己去智谱清言申请apiKey
static NSString *_apiKey = @"xxx";

static ChatAITool * instance = nil;

@implementation ChatAITool

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ChatAITool alloc] init];
    });
    return instance;
}
-(AFHTTPSessionManager *)manager{
    if(!_manager){
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.header = [self generate_token];
        __weak ChatAITool *weakSelf = self;
        AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
        [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
               switch (status) {
                   case AFNetworkReachabilityStatusUnknown:
                       NSLog(@"网络状态未知");
                       break;
                    case AFNetworkReachabilityStatusNotReachable:
                       NSLog(@"没有网络");
                       break;
                   case  AFNetworkReachabilityStatusReachableViaWWAN:
                       NSLog(@"3G|4G蜂窝移动网络");
                       break;
                   case AFNetworkReachabilityStatusReachableViaWiFi:
                       NSLog(@"WIFI网络");
                       break;
                   default:
                       break;
               }
           }];
        [reachabilityManager startMonitoring];

    }
    return self;
}


 -(NSMutableData *)fileData{
     if (!_fileData) {
         _fileData = [[NSMutableData alloc]init];
     }
     return _fileData;
 }
-(NSMutableString *)fileContentStr{
    if(!_fileContentStr){
        _fileContentStr = [[NSMutableString alloc] init];
    }
    return _fileContentStr;
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





-(void)setContent:(NSString *)contents{
    NSDictionary *contentDic = @{@"role":@"user",
                                @"content":contents};
    NSDictionary *contentDic1 = @{@"role":@"user",
                                @"content":@"你好"};
    NSDictionary *contentDic2 = @{@"role":@"user",
                                @"content":@"你好"};
    
    NSMutableArray *content = [NSMutableArray new];
    NSArray *modelArr = [self userQuestions:contents role:@"user"];
    for (int i = 0; i < modelArr.count; i++) {
        AIChatQuestionModel *model = [modelArr objectAtIndex:i];
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setObject:model.content forKey:@"content"];
        [dic setObject:model.role forKey:@"role"];
        [content addObject:dic];
    }
    NSMutableDictionary *paramDict = [NSMutableDictionary new];
    [paramDict setObject:content forKey:@"prompt"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramDict options:0 error:nil];
//    NSLog(@"ns data is %@",jsonData);
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    self.fileContentStr = [NSMutableString new];
    [self NSURLConnection:json];
}


-(NSArray *)userQuestions:(NSString *)contents role:(NSString *)role{
    AIChatQuestionModel *model = [AIChatQuestionModel new];
    model.content = contents;
    model.role = role;
    model.questionId = [CommonUtil questionIdIncrease];
    [CWSqliteModelTool insertOrUpdateModel:model];
    NSArray *modelArr = [CWSqliteModelTool queryAllModels:[AIChatQuestionModel class]];
    return modelArr;
}

-(void)setInvoteContent:(NSString *)contents{
    NSDictionary *contentDic = @{@"role":@"user",
                                @"content":contents};
    NSMutableArray *content = [NSMutableArray new];
    [content addObject:contentDic];
    NSMutableDictionary *paramDict = [NSMutableDictionary new];
    [paramDict setObject:content forKey:@"prompt"];
    [self invoke:paramDict];
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
-(void)NSURLConnection:(NSString *)content{
    NSString *json = content;
    //1、创建一个URL
    NSURL *url = [NSURL URLWithString:ssePrpURL];
    
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
    
    if(data.length != 0){
        // 处理数据
        NSString* dataStr  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSRange firstEventRange = [dataStr rangeOfString:@"event:"];
        if(firstEventRange.length != 0){
            NSString *firstEventContent = [dataStr substringFromIndex:firstEventRange.location];
            if([firstEventContent hasPrefix:@"event:interrupted"]){
                NSArray *dataArr = [firstEventContent componentsSeparatedByString:@"data:"];
                NSString *warnningText = [dataArr lastObject];
                [self.fileContentStr appendString:warnningText];
                if(self.delegate && [self.delegate respondsToSelector:@selector(didReceiveData:)]){
                    [self.delegate didReceiveData:self.fileContentStr];
                }
                return;
            }else if([firstEventContent hasPrefix:@"event:error"]){
                NSArray *dataArr = [firstEventContent componentsSeparatedByString:@"data:"];
                NSString *warnningText = [dataArr lastObject];
                [self.fileContentStr appendString:warnningText];
                if(self.delegate && [self.delegate respondsToSelector:@selector(didReceiveData:)]){
                    [self.delegate didReceiveData:self.fileContentStr];
                }
                return;
            }
        }
        NSArray *dataArr = [dataStr componentsSeparatedByString:@"\n\n"];
        NSMutableArray *muDataArr = [[NSMutableArray alloc] initWithArray:dataArr];
//        NSLog(@"muDataArr:%@",muDataArr);
        [muDataArr removeLastObject];
        for (int i = 0; i < muDataArr.count; i++) {
            NSString *cont = [muDataArr objectAtIndex:i];
//            if(![cont hasPrefix:@"event:"]){
//                cont = [NSString stringWithFormat:@"event:add\nid:%@",cont];
//            }
            
            NSRange eventRange = [cont rangeOfString:@"event:"];
            NSRange dataRange = [cont rangeOfString:@"data:"];
            if(eventRange.length == 0){
                cont = [NSString stringWithFormat:@"event:add\nid:%@",cont];
            }
            if(dataRange.length == 0){
                break;
            }
            
            //event:所有的数据
            NSString *eventContent = [cont substringFromIndex:eventRange.location];
            //data:所有的数据
            NSString *dataContent = [cont substringFromIndex:dataRange.location];
            
            NSArray *dataArr = [dataContent componentsSeparatedByString:@"data:"];
            for (int i = 0; i < dataArr.count; i++) {
                NSString *content = [dataArr objectAtIndex:i];
                if(![eventContent hasPrefix:@"event:finish"]){
                    [self.fileContentStr appendString:content];
                }else if([eventContent hasPrefix:@"event:finish"]){
                }
            }
        }
        [self.fileData appendData:data];
    }else{
        [self.fileContentStr appendString:@"无数据可提供."];
    }
    if(self.delegate && [self.delegate respondsToSelector:@selector(didReceiveData:)]){
        [self.delegate didReceiveData:self.fileContentStr];
    }
}


//3.当请求失败的时候调用
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"请求失败");
    if(self.delegate && [self.delegate respondsToSelector:@selector(didFailWithError:)]){
        [self.delegate didFailWithError:@"请求失败"];
    }
    NSArray *modelArr = [self userQuestions:self.fileContentStr role:@"assistant"];
}
//4.当请求结束(成功|失败)的时候调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // 请求完成
    NSLog(@"connectionDidFinishLoading");
    //解析数据
    NSString *str = [[NSString alloc]initWithData:self.fileData encoding:NSUTF8StringEncoding];
    if(self.delegate && [self.delegate respondsToSelector:@selector(connectionDidFinishLoading:)]){
        [self.delegate connectionDidFinishLoading:self.fileContentStr];
    }
    NSArray *modelArr = [self userQuestions:self.fileContentStr role:@"assistant"];
//    [self userCategoryWork:self.fileContentStr role:@"assistant"];
    
}



//同步调用
-(void)invoke:(NSMutableDictionary *)contentDic{
    NSMutableDictionary *paramDict = contentDic;
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
            NSMutableArray *choices = [data objectForKey:@"choices"];
            NSDictionary *contentDic = [choices firstObject];
            NSString *content = [contentDic objectForKey:@"content"];
            if(weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(didReceiveData:)]){
                [weakSelf.delegate didReceiveData:content];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败--%@",error);
        }];
}


-(void)insert:(NSString *)content user:(NSString *)usr{
    //当前用户发送时间
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strDate = [formatter stringFromDate:date];
    AIHistoryModelDao *dao = [AIHistoryModelDao new];
    dao.content = [NSString stringWithFormat:@"%@",content];
    dao.user = usr;
    dao.historyId = [CommonUtil increase];
    dao.date =strDate;
    BOOL result = [CWSqliteModelTool insertOrUpdateModel:dao];
}


- (NSString *)string2JSONString:(NSString *)string {
    NSMutableString *s = [NSMutableString stringWithString:string];
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    return [NSString stringWithString:s];
}

-(NSString *)JSONString:(NSString *)aString {
    NSMutableString *s = [NSMutableString stringWithString:aString];
    [s replaceOccurrencesOfString:@"\\" withString:@"\\\\" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    return [NSString stringWithString:s];
}


@end
