//
//  ACategoryWorkBtnCell.m
//  ChatAI
//
//  Created by Apple on 2023/8/1.
//

#import "ACategoryWorkBtnCell.h"

@implementation ACategoryWorkBtnCell

//-(UIView *)backContentView{
//    if(!_backContentView){
//        _backContentView = [[UIView alloc] init];
//        [self addSubview:_backContentView];
//    }
//    return _backContentView;
//}

-(UIButton *)comfirmBtn{
    if(!_comfirmBtn){
        _comfirmBtn = [UIButton new];
        _comfirmBtn.layer.cornerRadius = 10;
        _comfirmBtn.layer.borderColor = [UIColor redColor].CGColor;
        _comfirmBtn.layer.borderWidth = 0.5f;
        _comfirmBtn.layer.masksToBounds = YES;
        [_comfirmBtn setBackgroundColor:[UIColor clearColor]];
        [_comfirmBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return _comfirmBtn;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
//        self.backContentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.comfirmBtn];
        [self.comfirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    }
    return self;
}
-(void)setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    [self.comfirmBtn setTitle:[baseTableCellVo.cellDataDic objectForKey:@"lbl1"] forState:UIControlStateNormal];
}
- (void)layoutSubviews{
    [super layoutSubviews];

    
//    self.backContentView.frame = CGRectMake(1, self.baseTableView.frame.size.height + self.baseTableView.frame.origin.y, SCREEN_WIDTH, 60);
    self.comfirmBtn.frame = CGRectMake(self.frame.size.width/2-200/2, self.frame.size.height/2-35/2, 200, 35);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
