//
//  ProFormSelectedVo.h
//   
//
//  Created by melonGo on 2018/7/30.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProFormSelectedVo : NSObject
@property (nonatomic,strong)NSMutableDictionary *dataDic;
- (instancetype)initByDic:(NSMutableDictionary *)dic;
@end
