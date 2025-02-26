//
//  AITranslateVC.h
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "BaseTableViewVC.h"
#import "AITranslateView.h"
#import "AITranslateVo.h"
#import "AITranslateService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AITranslateVC : BaseTableViewVC
@property (nonatomic,strong)AITranslateService *translateService;
@property (nonatomic,strong)AITranslateVo *translateVo;
@property (nonatomic,strong)AITranslateView *translateView;
@property (nonatomic,strong)NSMutableDictionary *contentDic;

@end

NS_ASSUME_NONNULL_END
