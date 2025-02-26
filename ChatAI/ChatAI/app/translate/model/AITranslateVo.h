//
//  AITranslateVo.h
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "BaseTableViewVo.h"
#import "AITranslateService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AITranslateVo : BaseTableViewVo
@property (nonatomic,strong)AITranslateService *translateService;

-(void)refreshKeyWords:(NSString *)keyWords;
-(void)refreshContent:(NSString *)content;

-(void)refreshReset;
-(void)refreshTextView:(NSMutableDictionary *)dic;

-(NSMutableDictionary *)getContent;
-(NSMutableDictionary *)getJapanTranslateContent;
-(NSMutableDictionary *)getFrenchTranslateContent;
-(NSMutableDictionary *)getKoreanTranslateContent;
-(NSMutableDictionary *)getRussiaTranslateContent;
-(NSMutableDictionary *)getVietnamTranslateContent;
-(NSMutableDictionary *)getThaiTranslateContent;
@end

NS_ASSUME_NONNULL_END
