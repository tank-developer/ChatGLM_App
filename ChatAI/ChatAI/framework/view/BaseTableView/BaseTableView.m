//
//  BaseTableView.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _baseTableView = [[YYUITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [self addSubview:_baseTableView];
        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _baseTableView.separatorColor = [UIColor grayColor];
        UIEdgeInsets inset;
        inset.left = -40;
        [_baseTableView setSeparatorInset:inset];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

-(void) reloadView:(BaseTableViewVo *)baseTableViewVo{
    [self reloadTableView];
    [self reloadOtherViewsByVo:baseTableViewVo];
}

-(void) reloadTableViewImmediately{
    [self.baseTableView reloadData];
}

-(void) reloadTableView{
    [self.baseTableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.2];
    [self.baseTableView layoutIfNeeded];
}

-(void) reloadOtherViewsByVo:(BaseTableViewVo *)baseTableViewVo{
}

@end
