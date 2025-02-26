//
//  AICategoryVC.h
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "BaseTemplateVC.h"
#import "AICategoryView.h"
#import "AICategoryVo.h"
#import "AICategoryView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AICategoryVC : BaseTemplateVC
@property (nonatomic,strong)AICategoryView *categoryView;
@property (nonatomic,strong)AICategoryVo *categoryVo;


@end

NS_ASSUME_NONNULL_END
