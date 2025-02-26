//
//  ChatAITool.h
//  ChatAI
//
//  Created by Apple on 2023/7/23.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ChatAIToolDelegate <NSObject>

-(void)didReceiveData:(NSString *)content;
-(void)connectionDidFinishLoading:(NSString *)content;
-(void)didFailWithError:(NSString *)content;


@end

@interface ChatAITool : NSObject<NSURLConnectionDataDelegate>
@property (nonatomic,copy)NSDictionary *header;
@property (nonatomic, strong) NSMutableData *fileData;
@property (nonatomic, strong) NSMutableString *fileContentStr;

+ (instancetype)shareInstance;
@property (nonatomic,assign)id<ChatAIToolDelegate> delegate;

//主页中的
-(void)setContent:(NSString *)contents;
//分类中
//-(void)setCategoryContent:(NSString *)contents;

@property (nonatomic,strong)AFHTTPSessionManager *manager;

-(void)setInvoteContent:(NSString *)contents;

@property (nonatomic,strong)AFNetworkReachabilityManager * reachabilityManager;


@end

NS_ASSUME_NONNULL_END
