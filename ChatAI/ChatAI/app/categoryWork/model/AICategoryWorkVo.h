//
//  AICategoryWorkVo.h
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "BaseTableViewVo.h"
#import "AICategoryWorkService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AICategoryWorkVo : BaseTableViewVo
@property (nonatomic,strong)AICategoryWorkService *categoryWorkService;
-(void)refreshKeyWords:(NSString *)keyWords;
-(void)refreshContent:(NSString *)content;

-(void)refreshTextView:(NSMutableDictionary *)dic;

-(void)refreshReset;

-(NSMutableDictionary *)getContent;
-(NSMutableDictionary *)getSpeechContent;
-(NSMutableDictionary *)getAdContent;
-(NSMutableDictionary *)getHappyToYouContent;
-(NSMutableDictionary *)getSorryBookContent;
-(NSMutableDictionary *)getZongJieContent;
-(NSMutableDictionary *)getReportContent;
-(NSMutableDictionary *)getDayReportContent;
-(NSMutableDictionary *)getMonthReportContent;

@end

NS_ASSUME_NONNULL_END
