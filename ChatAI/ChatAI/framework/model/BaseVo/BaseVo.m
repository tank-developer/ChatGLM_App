//
//  BaseVo.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseVo.h"

@implementation BaseVo
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
