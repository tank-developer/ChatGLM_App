//
//  AIChatContentUserCell.m
//  ChatAI
//
//  Created by Apple on 2023/7/22.
//

#import "AIChatContentUserCell.h"
#import "MessageFrameModel.h"


@implementation AIChatContentUserCell

-(UIButton *)textView{
    if(!_textView){
        _textView = [[UIButton alloc] init];
        [self.contentView addSubview:_textView];
        [_textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _textView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.textView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    NSString *markdownString = [NSString stringWithFormat:@"我:%@",[baseTableCellVo.cellDataDic objectForKey:@"lbl1"]];
    MessageFrameModel *model = [baseTableCellVo.cellDataDic objectForKey:@"lbl11"];
    
    MessageModel *message = model.message;

    NSString *text = [message.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    text = [text stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
    text = [text stringByReplacingOccurrencesOfString:@"\\\n" withString:@""];
    text = [text stringByReplacingOccurrencesOfString:@"\\\\\"" withString:@"\""];
    
    [self.textView setTitle:text forState:UIControlStateNormal];
    self.textView.frame = model.textF;
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
