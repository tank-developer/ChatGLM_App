//
//  ProFormSelectedView.m
//   
//
//  Created by melonGo on 2018/7/30.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "ProFormSelectedView.h"
#import "JLColorConstant.h"
#define FYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define FYRandomColor FYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

@implementation ProFormSelectedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.goodsImageView = [[UIImageView alloc] init];
        [self addSubview:self.goodsImageView];
        self.goodsImageView.backgroundColor = [UIColor clearColor];
        
        self.goodsFormSelectLbl = [[UILabel alloc] init];
        [self addSubview:self.goodsFormSelectLbl];
        self.goodsFormSelectLbl.backgroundColor = [UIColor clearColor];
        self.goodsFormSelectLbl.textColor = [UIColor whiteColor];
        
        self.goodsLbl = [[UILabel alloc] init];
        [self addSubview:self.goodsLbl];
        self.goodsLbl.backgroundColor = [UIColor clearColor];
        self.goodsLbl.textColor = [UIColor whiteColor];
        
        self.goodsPriceLbl = [[UILabel alloc] init];
        [self addSubview:self.goodsPriceLbl];
        self.goodsPriceLbl.backgroundColor = [UIColor clearColor];
        self.goodsPriceLbl.textColor = [UIColor whiteColor];
        
        self.goodsStockLbl = [[UILabel alloc] init];
        [self addSubview:self.goodsStockLbl];
        self.goodsStockLbl.backgroundColor = [UIColor clearColor];
//        self.goodsStockLbl.font = [UIFont systemFontOfSize:14];
        self.goodsStockLbl.textColor = [UIColor whiteColor];
        
        self.goodsSizeLbl = [[UILabel alloc] init];
        [self addSubview:self.goodsSizeLbl];
        self.goodsSizeLbl.textColor = [UIColor whiteColor];
        self.goodsSizeLbl.backgroundColor = [UIColor clearColor];
        //废弃，但先别删,有用
        self.goodsSizeCountLbl = [[UILabel alloc] init];
        [self addSubview:self.goodsSizeCountLbl];
        self.goodsSizeCountLbl.backgroundColor = [UIColor clearColor];
        
        
        self.goodSizeCountTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        [self addSubview:self.goodSizeCountTable];
        //对TableView要做的设置
        self.goodSizeCountTable.transform=CGAffineTransformMakeRotation(-M_PI / 2);
        self.goodSizeCountTable.showsVerticalScrollIndicator=NO;
        self.goodSizeCountTable.delegate = self;
        self.goodSizeCountTable.dataSource = self;
        self.goodSizeCountTable.backgroundColor = [UIColor clearColor];
        self.goodSizeCountTable.separatorStyle = UITableViewCellSeparatorStyleNone;
//        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.goodSizeCountTable selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];

        
        self.goodsColorLbl = [[UILabel alloc] init];
        [self addSubview:self.goodsColorLbl];
        self.goodsColorLbl.backgroundColor = [UIColor clearColor];
        self.goodsColorLbl.textColor = [UIColor whiteColor];
        
        self.goodsColorContentLbl = [[UILabel alloc] init];
        [self addSubview:self.goodsColorContentLbl];
        self.goodsColorContentLbl.backgroundColor = [UIColor clearColor];
        self.goodsColorContentLbl.textColor = [UIColor whiteColor];
        self.goodsColorContentLbl.layer.cornerRadius = 15;
        self.goodsColorContentLbl.layer.masksToBounds = YES;
        self.goodsColorContentLbl.textAlignment = NSTextAlignmentCenter;
        self.goodsColorContentLbl.font = [UIFont systemFontOfSize:12];
        
        //添加数量
        self.changeGoodsCountView = [[UIView alloc] init];
        [self addSubview:self.changeGoodsCountView];
        self.changeGoodsCountView.backgroundColor = [UIColor clearColor];
        self.changeGoodsCountView.layer.cornerRadius = 10;
        self.changeGoodsCountView.layer.borderWidth = 1;
        self.changeGoodsCountView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.changeGoodsCountView.layer.masksToBounds = YES;
        
        self.reduceBtn = [[UIButton alloc] init];
        [self.changeGoodsCountView addSubview:self.reduceBtn];
        self.reduceBtn.backgroundColor = [UIColor clearColor];
        [self.reduceBtn setTitle:@"-" forState:UIControlStateNormal];
        self.reduceBtn.titleLabel.textColor = [UIColor whiteColor];
        self.reduceBtn.titleLabel.textAlignment = NSTextAlignmentCenter;

        self.increaseBtn = [[UIButton alloc] init];
        [self.changeGoodsCountView addSubview:self.increaseBtn];
        self.increaseBtn.backgroundColor = [UIColor clearColor];
        [self.increaseBtn setTitle:@"+" forState:UIControlStateNormal];
        self.increaseBtn.titleLabel.textColor = [UIColor whiteColor];
        self.increaseBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.goodsCountLbl = [[UILabel alloc] init];
        [self.changeGoodsCountView addSubview:self.goodsCountLbl];
        self.goodsCountLbl.backgroundColor = [UIColor purpleColor];
        self.goodsCountLbl.textAlignment = NSTextAlignmentCenter;
        self.goodsCountLbl.backgroundColor = [UIColor whiteColor];
        
        //添加到购物车
        self.rightBottomView = [[UIView alloc] init];
        [self addSubview:self.rightBottomView];
        self.rightBottomView.backgroundColor = [UIColor clearColor];
        self.shopCarBtn = [[UIButton alloc] init];
        [self.rightBottomView addSubview:self.shopCarBtn];
        self.shopCarBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.shopCarBtn.layer.cornerRadius = 20;
        self.shopCarBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.shopCarBtn.layer.borderColor = [UIColor blueColor].CGColor;
        self.shopCarBtn.layer.borderWidth = 1;
        self.shopCarBtn.layer.masksToBounds = YES;
        self.shopCarBtn.backgroundColor = [UIColor blackColor];
        [self.shopCarBtn setTitleColor:itemBlueColor forState:UIControlStateNormal];
        
        self.buyBtn = [[UIButton alloc] init];
        [self.rightBottomView addSubview:self.buyBtn];
        self.buyBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.buyBtn.layer.cornerRadius = 20;
        self.buyBtn.layer.masksToBounds = YES;
        self.buyBtn.backgroundColor = itemBlueColor;
        self.buyBtn.titleLabel.textColor = [UIColor whiteColor];

        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.goodsImageView.frame = CGRectMake(10, 5, 100, 90);
    self.goodsFormSelectLbl.frame = CGRectMake(self.goodsImageView.frame.size.width+self.goodsImageView.frame.origin.x+10, 5, 120, 30);
    self.goodsLbl.frame = CGRectMake(self.goodsImageView.frame.size.width+self.goodsImageView.frame.origin.x+10, self.goodsFormSelectLbl.frame.origin.y+self.goodsFormSelectLbl.frame.size.height, 100, 30);
    self.goodsPriceLbl.frame = CGRectMake(self.goodsImageView.frame.size.width+self.goodsImageView.frame.origin.x+10, self.goodsLbl.frame.origin.y+self.goodsLbl.frame.size.height, 100, 30);
    self.goodsStockLbl.frame = CGRectMake(self.goodsPriceLbl.frame.origin.x+self.goodsPriceLbl.frame.size.width+5, self.goodsLbl.frame.origin.y+self.goodsLbl.frame.size.height, 120, 30);
    
    
    self.goodsSizeLbl.frame = CGRectMake(10, self.goodsImageView.frame.origin.y+self.goodsImageView.frame.size.height+10, 50, 40);
    self.goodsSizeCountLbl.frame = CGRectMake(10, self.goodsSizeLbl.frame.origin.y+self.goodsSizeLbl.frame.size.height, 50, 40);
    
    
    self.goodSizeCountTable.frame = CGRectMake(10, self.goodsSizeLbl.frame.origin.y+self.goodsSizeLbl.frame.size.height, 300,40);
    
    
    self.goodsColorLbl.frame = CGRectMake(10, self.goodsSizeCountLbl.frame.origin.y+self.goodsSizeCountLbl.frame.size.height+10, 50, 40);
    self.goodsColorContentLbl.frame = CGRectMake(10, self.goodsColorLbl.frame.origin.y+self.goodsColorLbl.frame.size.height, 50, 40);
    
    self.changeGoodsCountView.frame = CGRectMake(self.frame.size.width-150, self.goodsColorContentLbl.frame.origin.y+self.goodsColorContentLbl.frame.size.height+10, 140, 40);
    self.reduceBtn.frame = CGRectMake(0, 0, self.changeGoodsCountView.frame.size.width/3-10, 40);
    self.increaseBtn.frame = CGRectMake(self.changeGoodsCountView.frame.size.width-self.reduceBtn.frame.size.width, 0, self.reduceBtn.frame.size.width, 40);
    self.goodsCountLbl.frame = CGRectMake(self.reduceBtn.frame.size.width, 0, self.changeGoodsCountView.frame.size.width-(self.reduceBtn.frame.size.width+self.increaseBtn.frame.size.width), 40);
    
    
    self.rightBottomView.frame = CGRectMake(self.frame.size.width-210, self.changeGoodsCountView.frame.origin.y+self.changeGoodsCountView.frame.size.height+30, 200, 40);
    self.shopCarBtn.frame = CGRectMake(0, 0, self.rightBottomView.frame.size.width/2-5, 40);
    self.buyBtn.frame = CGRectMake(self.shopCarBtn.frame.size.width+5, 0, self.shopCarBtn.frame.size.width-5, 40);
}
-(void)refreshThisViewWith:(ProFormSelectedVo *)proFormSelectedVo{
    NSMutableDictionary *data = [proFormSelectedVo.dataDic objectForKey:@"data"];
    self.formDatasource = [data objectForKey:@"goodsstyle1"];
    
    NSMutableDictionary *datails = [data objectForKey:@"datails"];

    [self.goodsLbl setText:[datails objectForKey:@"proname"]];
    self.goodsPriceLbl.text = [NSString stringWithFormat:@"¥ %@",[datails objectForKey:@"vipprice"]];
//    self.goodsImageView.image = [UIImage imageNamed:@"mineHeader"];
    NSURL *url = [NSURL URLWithString:[datails objectForKey:@"proimg"]];
//    [self.goodsImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"mineHeader"] options:SDWebImageRetryFailed];
    self.goodsSizeLbl.text = @"尺寸";
    self.goodsColorLbl.text = @"颜色";
    self.goodsFormSelectLbl.text = @"产品规格选择";
    [self.shopCarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self.buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [self.goodSizeCountTable reloadData];
}

-(void)refreshGoodsCountLbl:(NSInteger)count{
    self.goodsCountLbl.text = [NSString stringWithFormat:@"%ld",(long)count];
}

#pragma mark - tableView delegate datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.formDatasource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PopViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PopViewTableViewCell"];
    if (!cell) {
        cell = [[PopViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PopViewTableViewCell"];
    }
    NSMutableDictionary *dic = self.formDatasource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.formLbl.text = [dic objectForKey:@"stylename1"];
    cell.backgroundColor=[UIColor clearColor];
    cell.formLbl.transform = CGAffineTransformMakeRotation(M_PI/2);
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableDictionary *dic = self.formDatasource[indexPath.row];
    if ([_delegate respondsToSelector:@selector(handelFormDic:)]) {
        [_delegate handelFormDic:dic];
    }
    self.goodsColorContentLbl.text = [dic objectForKey:@"stylename"];
    NSString *stockCount = [NSString stringWithFormat:@"库存%@件",[dic objectForKey:@"kucun"]];
    NSString *priceCount = [NSString stringWithFormat:@"¥ %@",[dic objectForKey:@"price"]];
    self.goodsStockLbl.text = stockCount;
//    self.goodsPriceLbl.text = priceCount;
    self.goodsColorContentLbl.backgroundColor = itemRedColor;
    PopViewTableViewCell *cell = (PopViewTableViewCell *)[self.goodSizeCountTable cellForRowAtIndexPath:indexPath];
    cell.formLbl.backgroundColor = itemRedColor;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    PopViewTableViewCell *cell = (PopViewTableViewCell *)[self.goodSizeCountTable cellForRowAtIndexPath:indexPath];
    cell.formLbl.backgroundColor = [UIColor clearColor];
}
@end
