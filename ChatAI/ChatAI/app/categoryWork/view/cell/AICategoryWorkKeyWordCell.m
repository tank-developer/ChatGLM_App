//
//  AICategoryWorkKeyWordCell.m
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "AICategoryWorkKeyWordCell.h"

@implementation AICategoryWorkKeyWordCell

-(UILabel *)titelLbl{
    if(!_titelLbl){
        _titelLbl = [UILabel new];
        _titelLbl.textColor = [UIColor whiteColor];
        _titelLbl.text = @"";
        _titelLbl.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titelLbl];
    }
    return _titelLbl;
}
-(UITextField *)titeField{
    if(!_titeField){
        _titeField = [UITextField new];
        _titeField.placeholder = @"请输入字数(<=500)";
//        _titeField.layer.borderColor = [UIColor redColor].CGColor;
//        _titeField.layer.borderWidth = 0.5f;
//        _titeField.layer.cornerRadius = 5;
//        _titeField.layer.masksToBounds = YES;
        [self.contentView addSubview:_titeField];
    }
    return _titeField;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.titelLbl.text = @"";
        self.titeField.text = @"";
    }
    return self;
}
-(void)setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    self.titelLbl.text = [baseTableCellVo.cellDataDic objectForKey:@"lbl2"];
    self.titeField.text = [baseTableCellVo.cellDataDic objectForKey:@"lbl1"];
    self.titeField.placeholder = [baseTableCellVo.cellDataDic objectForKey:@"lbl3"];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.titelLbl.frame = CGRectMake(self.frame.size.width/2-300/2, 0, 300, 30);
    self.titeField.frame = CGRectMake(self.frame.size.width/2-300/2, self.titelLbl.frame.size.height + self.titelLbl.frame.origin.y + 15, 300, 44);
    CALayer *line2 = [CALayer layer];
    line2.frame = CGRectMake( self.titeField.frame.origin.x,  self.titeField.frame.origin.y +  self.titeField.frame.size.height,  self.titeField.frame.size.width, 0.5f);
    line2.backgroundColor = [UIColor redColor].CGColor;
    [self.contentView.layer addSublayer:line2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
