//
//  AICategoryWorkVC.h
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "BaseTableViewVC.h"
#import "AICategoryWorkView.h"
#import "AICategoryWorkVo.h"
#import "AICategoryWorkService.h"

NS_ASSUME_NONNULL_BEGIN

@interface AICategoryWorkVC : BaseTableViewVC
@property (nonatomic,strong)AICategoryWorkService *categoryWorkService;
@property (nonatomic,strong)AICategoryWorkVo *categoryWorkVo;
@property (nonatomic,strong)AICategoryWorkView *categoryWorkView;
@property (nonatomic,strong)NSMutableDictionary *contentDic;

@end

NS_ASSUME_NONNULL_END
