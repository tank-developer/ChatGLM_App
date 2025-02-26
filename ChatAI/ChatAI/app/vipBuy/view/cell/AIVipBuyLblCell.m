//
//  AIVipBuyLblCell.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AIVipBuyLblCell.h"
#import "CBAppConfig.h"
@implementation AIVipBuyLblCell

-(UIView *)bgContentView{
    if(!_bgContentView){
        _bgContentView = [[UIView alloc] init];
        _bgContentView.layer.cornerRadius = 20;
        _bgContentView.layer.masksToBounds = YES;
        [self.contentView addSubview:_bgContentView];
    }
    return _bgContentView;
}
-(UILabel *)freeLbl{
    if(!_freeLbl){
        _freeLbl = [UILabel new];
        _freeLbl.text = @"免费";
        _freeLbl.font = [UIFont systemFontOfSize:13];
        [self.bgContentView addSubview:_freeLbl];
    }
    return _freeLbl;
}
-(UIButton *)apiLbl{
    if(!_apiLbl){
        _apiLbl = [UIButton new];
        [_apiLbl setTitle:@"一天十次的使用" forState:UIControlStateNormal];
        _apiLbl.titleLabel.font = [UIFont systemFontOfSize:16];
        int space = 20;
        [_apiLbl setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
        _apiLbl.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
        _apiLbl.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
        
        _apiLbl.titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.bgContentView addSubview:_apiLbl];
    }
    return _apiLbl;
}
-(UIButton *)chatLbl{
    if(!_chatLbl){
        _chatLbl = [UIButton new];
        [_chatLbl setTitle:@"不能查看历史记录" forState:UIControlStateNormal];
        _chatLbl.titleLabel.font = [UIFont systemFontOfSize:16];
        [_chatLbl setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
        int space = 8;
        _chatLbl.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
        _chatLbl.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
        _chatLbl.titleLabel.textAlignment = NSTextAlignmentLeft;

        [self.bgContentView addSubview:_chatLbl];
    }
    return _chatLbl;
}
-(UILabel *)proLbl{
    if(!_proLbl){
        _proLbl = [UILabel new];
        _proLbl.text = @"Pro";
        _proLbl.font = [UIFont systemFontOfSize:13];
        [self.bgContentView addSubview:_proLbl];
    }
    return _proLbl;
}
-(UIButton *)apiMoreLbl{
    if(!_apiMoreLbl){
        _apiMoreLbl = [UIButton new];
        [_apiMoreLbl setTitle:@"无限次的使用" forState:UIControlStateNormal];
        [_apiMoreLbl setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        int space = 20;
        _apiMoreLbl.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
        _apiMoreLbl.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
        [self.bgContentView addSubview:_apiMoreLbl];
    }
    return _apiMoreLbl;
}
-(UIButton *)chatRocordLbl{
    if(!_chatRocordLbl){
        _chatRocordLbl = [UIButton new];
        [_chatRocordLbl setTitle:@"查看历史记录" forState:UIControlStateNormal];
        _chatRocordLbl.titleLabel.font = [UIFont systemFontOfSize:16];
        [_chatRocordLbl setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        int space = 32;
        _chatRocordLbl.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
        _chatRocordLbl.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
        [self.bgContentView addSubview:_chatRocordLbl];
    }
    return _chatRocordLbl;
}
-(UIButton *)moreLbl{
    if(!_moreLbl){
        _moreLbl = [UIButton new];
        [_moreLbl setTitle:@"后续的更多的功能的使用" forState:UIControlStateNormal];
        _moreLbl.titleLabel.font = [UIFont systemFontOfSize:16];
        [_moreLbl setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        int space = 2;
        _moreLbl.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
        _moreLbl.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
        [self.bgContentView addSubview:_moreLbl];
    }
    return _moreLbl;
}
-(UILabel *)descriptLbl{
    if(!_descriptLbl){
        _descriptLbl = [UILabel new];
        _descriptLbl.text = @"7天免费试用，然后以¥98/年自动续费";
        _descriptLbl.font = [UIFont systemFontOfSize:12];
        [self.bgContentView addSubview:_descriptLbl];
    }
    return _descriptLbl;
}
-(UIButton *)buyBtn{
    if(!_buyBtn){
        _buyBtn = [UIButton new];
        [_buyBtn setTitle:@"7天免费使用" forState:UIControlStateNormal];
        [_buyBtn setBackgroundColor:[UIColor colorWithRed:178.0f/255.0f green:34.0f/255.0f blue:34.0f/255.0f alpha:1]];
        _buyBtn.layer.cornerRadius = 5;
        _buyBtn.layer.masksToBounds = YES;
        [self.bgContentView addSubview:_buyBtn];
    }
    return _buyBtn;
}
-(UIButton *)reBuyBtn{
    if(!_reBuyBtn){
        _reBuyBtn = [UIButton new];
        [_reBuyBtn setTitle:@"恢复购买" forState:UIControlStateNormal];
        [self.bgContentView addSubview:_reBuyBtn];
    }
    return _reBuyBtn;
}
-(UILabel *)orderLbl{
    if(!_orderLbl){
        _orderLbl = [UILabel new];
        _orderLbl.text = @"订阅条款";
        _orderLbl.textAlignment = NSTextAlignmentCenter;
//        _orderLbl.font = [UIFont systemFontOfSize:12];
        [self.bgContentView addSubview:_orderLbl];
    }
    return _orderLbl;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //2F4F4F
        self.bgContentView.backgroundColor = kBACKGROUDcolor;
        self.freeLbl.backgroundColor = [UIColor clearColor];
        self.apiLbl.backgroundColor = [UIColor clearColor];
        self.chatLbl.backgroundColor = [UIColor clearColor];
        self.proLbl.backgroundColor = [UIColor clearColor];
        self.apiMoreLbl.backgroundColor = [UIColor clearColor];
        self.chatRocordLbl.backgroundColor = [UIColor clearColor];
        self.moreLbl.backgroundColor = [UIColor clearColor];
        self.descriptLbl.backgroundColor = [UIColor clearColor];
        self.buyBtn.backgroundColor = KAPPCOLOR;
        self.reBuyBtn.backgroundColor = [UIColor clearColor];
        self.orderLbl.backgroundColor = [UIColor clearColor];

    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.bgContentView.frame = CGRectMake(30, 30, self.frame.size.width - 60, self.frame.size.height - 60);
    self.freeLbl.frame = CGRectMake(10, 20, 100, 20);
    self.apiLbl.frame = CGRectMake(10, self.freeLbl.frame.size.height + self.freeLbl.frame.origin.y + 20, 200, 20);
    self.chatLbl.frame = CGRectMake(10, self.apiLbl.frame.size.height + self.apiLbl.frame.origin.y + 20, 200, 20);
    self.proLbl.frame = CGRectMake(10, self.chatLbl.frame.size.height + self.chatLbl.frame.origin.y + 20, 200, 20);
    self.apiMoreLbl.frame = CGRectMake(10, self.proLbl.frame.size.height + self.proLbl.frame.origin.y + 20, 200, 20);
    self.chatRocordLbl.frame = CGRectMake(10, self.apiMoreLbl.frame.size.height + self.apiMoreLbl.frame.origin.y + 20, 200, 20);
    self.moreLbl.frame = CGRectMake(10, self.chatRocordLbl.frame.size.height + self.chatRocordLbl.frame.origin.y + 20, 250, 20);
    self.descriptLbl.frame = CGRectMake(self.bgContentView.frame.size.width/2-250/2, self.moreLbl.frame.size.height + self.moreLbl.frame.origin.y + 30, 250, 20);
    self.buyBtn.frame = CGRectMake(self.bgContentView.frame.size.width/2-200/2, self.descriptLbl.frame.size.height + self.descriptLbl.frame.origin.y + 30, 200, 50);
    self.reBuyBtn.frame = CGRectMake(self.bgContentView.frame.size.width/2-120/2, self.buyBtn.frame.size.height + self.buyBtn.frame.origin.y + 20, 120, 30);
    self.orderLbl.frame = CGRectMake(self.bgContentView.frame.size.width/2-120/2, self.reBuyBtn.frame.size.height + self.reBuyBtn.frame.origin.y + 20, 120, 30);
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
