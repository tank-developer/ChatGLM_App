//
//  AICategoryWorkTextViewCell.m
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "AICategoryWorkTextViewCell.h"

@implementation AICategoryWorkTextViewCell

-(UITextView *)titelTextView{
    if(!_titelTextView){
        _titelTextView = [UITextView new];
        _titelTextView.text = @"";
        _titelTextView.editable = NO;
        _titelTextView.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_titelTextView];
    }
    return _titelTextView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.titelTextView.text = @"";
    }
    return self;
}
-(void)setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    self.titelTextView.text = [baseTableCellVo.cellDataDic objectForKey:@"lbl1"];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.titelTextView.frame = CGRectMake(self.frame.size.width/2-300/2, 0, 300, self.contentView.frame.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
