//
//  AICategoryChatCell.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AICategoryChatCell.h"
#define MAX_LENGTH_LINE 30
#define MAX_LENGTH_ROWS 20

@interface AICategoryChatCell (){
}

/**
时间
 */
@property (nonatomic, strong) UILabel *timeLabel;

/**
 内容
 */
@property (nonatomic, strong) UIButton *contentBtn;

//@property (nonatomic, strong) YYTextView *contentTextView;
//
//
//@property (nonatomic, strong) YYLabel *contentLabel;

/**
 头像
 */
@property (nonatomic, strong) UIImageView *iconView;
@end

@implementation AICategoryChatCell

-(UILabel *)timeLabel{
    if(!_timeLabel){
        _timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}
-(UIButton *)contentBtn{
    if(!_contentBtn){
        _contentBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_contentBtn];
        _contentBtn.titleLabel.font = HQTextFont;
        _contentBtn.titleLabel.numberOfLines = 0;
        [_contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _contentBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentBtn;
}
-(UIImageView *)iconView{
    if(!_iconView){
        _iconView =[[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
    }
    return _iconView;
}
//-(YYTextView *)contentTextView{
//    if(!_contentTextView){
//        _contentTextView = [[YYTextView alloc] init];
//        _contentTextView.font = HQTextFont;
//        _contentTextView.editable = NO;
//        _contentTextView.textColor = [UIColor blackColor];
//        _contentTextView.backgroundColor = [UIColor clearColor];
//        _contentTextView.delegate = self;
//
////        [self.contentView addSubview:_contentTextView];
//    }
//    return _contentTextView;
//}
//-(YYLabel *)contentLabel{
//    if(!_contentLabel){
//        _contentLabel = [[YYLabel alloc] init];
//        _contentLabel.font = HQTextFont;
//        _contentLabel.textColor = [UIColor blackColor];
//        _contentLabel.numberOfLines = 0;
//        _contentLabel.lineBreakMode = 0;
//        [_contentLabel sizeToFit];
//
////        _contentLabel.backgroundColor = [UIColor colorWithWhite:0.134 alpha:1.000];
//
////        [self.contentView addSubview:_contentLabel];
//    }
//    return _contentLabel;
//}


/**
 重写init方法
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.timeLabel.text = @"";
        
        [self.contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
//        YYTextSimpleMarkdownParser *parser = [YYTextSimpleMarkdownParser new];
//        [parser setColorWithDarkTheme];
//        parser.textColor = [UIColor blackColor];
//        parser.controlTextColor = [UIColor redColor];
//        parser.headerTextColor = [UIColor greenColor];
//        parser.inlineTextColor = [UIColor purpleColor];
//        parser.codeTextColor = [UIColor orangeColor];
//        parser.linkTextColor = [UIColor blueColor];
//
//        self.contentTextView.textParser = parser;
        
        
//        self.contentLabel.textParser = parser;
        
        self.iconView.backgroundColor = [UIColor clearColor];
        //清空cell的背景颜色
        self.backgroundColor = [UIColor clearColor];
       
        /*
        CGFloat top =
        CGFloat left,
        CGFloat bottom,
        CGFloat right
         */
        //设置按钮的内边距
        self.contentBtn.contentEdgeInsets = UIEdgeInsetsMake(HQEdgeInsets, HQEdgeInsets, HQEdgeInsets, HQEdgeInsets);
//        self.contentTextView.contentInset = UIEdgeInsetsMake(HQEdgeInsets, HQEdgeInsets, HQEdgeInsets, HQEdgeInsets);
        
//        self.contentLabel.contentInset = UIEdgeInsetsMake(HQEdgeInsets, HQEdgeInsets, HQEdgeInsets, HQEdgeInsets);
        
    }
    return self;
}


-(void)setCellDataByCellVo:(BaseTableCellVo *)baseTableCellVo{
    MessageFrameModel *messageFrame = [baseTableCellVo.cellDataDic objectForKey:@"lbl11"];
    MessageModel *message = messageFrame.message;
    //1,设置时间
    self.timeLabel.frame = messageFrame.timeF;
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.text = message.time;
    //2,设置头像
    if (MessageModelTypeMe == message.type) {
        self.iconView.image = [UIImage imageNamed:@"me"];
        [self.contentBtn setBackgroundImage:[UIImage resizableImageWith:@"chat_send_nor"] forState:UIControlStateNormal];
    }
    else
    {
        [self.contentBtn setBackgroundImage:[UIImage resizableImageWith:@"chat_recive_nor"]  forState:UIControlStateNormal];
        self.iconView.image = [UIImage imageNamed:@"other"];
    }
    self.iconView.frame = messageFrame.iconF;
    NSString *text = [message.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    text = [text stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
    text = [text stringByReplacingOccurrencesOfString:@"\\\n" withString:@""];
    text = [text stringByReplacingOccurrencesOfString:@"\\\\\"" withString:@"\""];
    
    //3,设置正文
    [self.contentBtn setTitle:text forState:UIControlStateNormal];
    self.contentBtn.frame = messageFrame.textF;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
