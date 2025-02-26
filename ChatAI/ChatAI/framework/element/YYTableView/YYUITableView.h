//
//  YYUITableView.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYUITableView : UITableView
@property (nonatomic, strong) NSString *elementKey;
- (instancetype)initWithElementKey:(NSString *) elementKey; 
@end
