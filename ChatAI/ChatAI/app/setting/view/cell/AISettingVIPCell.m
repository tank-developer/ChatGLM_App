//
//  AISettingVIPCell.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AISettingVIPCell.h"

@implementation AISettingVIPCell

-(UILabel *)countLbl{
    if(!_countLbl){
        _countLbl = [UILabel new];
        _countLbl.text = @"已经使用0/10次";
        _countLbl.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_countLbl];
    }
    return _countLbl;
}
-(UIImageView *)VIPImg{
    if(!_VIPImg){
        _VIPImg = [UIImageView new];
        [self.contentView addSubview:_VIPImg];
    }
    return _VIPImg;
}
-(UILabel *)updateVIPLbl{
    if(!_updateVIPLbl){
        _updateVIPLbl = [UILabel new];
        _updateVIPLbl.text = @"Update To Pro";
        _updateVIPLbl.layer.cornerRadius = 22;
        _updateVIPLbl.layer.borderColor = [UIColor redColor].CGColor;
        _updateVIPLbl.layer.borderWidth = 1.0f;
        _updateVIPLbl.layer.masksToBounds = YES;
        _updateVIPLbl.textColor = [UIColor redColor];
        _updateVIPLbl.font = [UIFont systemFontOfSize:14];
        _updateVIPLbl.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_updateVIPLbl];
    }
    return _updateVIPLbl;
}
-(UILabel *)ChatGLMLbl{
    if(!_ChatGLMLbl){
        _ChatGLMLbl = [UILabel new];
        _ChatGLMLbl.text = @"欢迎使用ChatGLM";
        _ChatGLMLbl.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_ChatGLMLbl];
    }
    return _ChatGLMLbl;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
//        self.VIPImg.image = [UIImage imageNamed:@""];
        self.countLbl.textColor = [UIColor whiteColor];
        self.ChatGLMLbl.textColor = [UIColor whiteColor];
        self.updateVIPLbl.textColor = [UIColor redColor];
    }
    return self;
}

-(void)setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    self.VIPImg.frame = CGRectMake(10, 40, 40, 40);
    self.countLbl.frame = CGRectMake(10, 20, 150, 30);
    self.ChatGLMLbl.frame = CGRectMake(10, self.countLbl.frame.size.height + self.countLbl.frame.origin.y + 5, 150, 30);
    self.updateVIPLbl.frame = CGRectMake(self.contentView.frame.size.width - (150+40), self.contentView.frame.size.height/2-44/2, 150, 40);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
