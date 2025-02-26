//
//  ProFormSelectedView.h
//  
//
//  Created by melonGo on 2018/7/30.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProFormSelectedVo.h"
#import "PopViewTableViewCell.h"
//#import <SDWebImage/UIImageView+WebCache.h>

//创建协议
@protocol ProFormSelectedViewBDelegate <NSObject>
- (void)handelFormDic:(NSMutableDictionary *)valueDic; //声明协议方法
@end

@interface ProFormSelectedView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIImageView *goodsImageView;
@property (nonatomic,strong)UILabel *goodsFormSelectLbl;
@property (nonatomic,strong)UILabel *goodsLbl;
@property (nonatomic,strong)UILabel *goodsPriceLbl;
@property (nonatomic,strong)UILabel *goodsStockLbl;

@property (nonatomic,strong)UILabel *goodsSizeLbl;
@property (nonatomic,strong)UILabel *goodsSizeCountLbl;

@property (nonatomic,strong)UITableView *goodSizeCountTable;

@property (nonatomic,strong)UILabel *goodsColorLbl;
@property (nonatomic,strong)UILabel *goodsColorContentLbl;

@property (nonatomic,strong)UIView *changeGoodsCountView;
@property (nonatomic,strong)UIButton *reduceBtn;
@property (nonatomic,strong)UIButton *increaseBtn;
@property (nonatomic,strong)UILabel *goodsCountLbl;

@property (nonatomic,strong)UIView *rightBottomView;
@property (nonatomic,strong)UIButton *shopCarBtn;
@property (nonatomic,strong)UIButton *buyBtn;

-(void)refreshThisViewWith:(ProFormSelectedVo *)proFormSelectedVo;
-(void)refreshGoodsCountLbl:(NSInteger)count;
@property (nonatomic,strong)NSMutableArray *formDatasource;
@property (nonatomic, weak)id<ProFormSelectedViewBDelegate> delegate; //声明协议变量

@end
