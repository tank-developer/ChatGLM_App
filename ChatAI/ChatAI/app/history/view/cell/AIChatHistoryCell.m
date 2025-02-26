//
//  AIChatHistoryCell.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AIChatHistoryCell.h"
#import "CBAppConfig.h"

#define MAX_LENGTH_LINE 30
#define MAX_LENGTH_ROWS 20

@interface AIChatHistoryCell (){
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

@implementation AIChatHistoryCell

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
        _contentBtn.layer.cornerRadius = 5;
        _contentBtn.layer.masksToBounds = YES;
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



/**
 重写init方法
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.timeLabel.text = @"";
        

        
        [self.contentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        
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

+(instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *identifier = @"message";
    AIChatHistoryCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AIChatHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
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
        [self.contentBtn setBackgroundColor:backgroundMeColor_Dark];

//        [self.contentBtn setBackgroundImage:[UIImage resizableImageWith:@"chat_send_nor"] forState:UIControlStateNormal];
    }
    else
    {
        [self.contentBtn setBackgroundColor:backgroundOtherColor_Dark];
//        [self.contentBtn setBackgroundImage:[UIImage resizableImageWith:@"chat_recive_nor"]  forState:UIControlStateNormal];
        self.iconView.image = [UIImage imageNamed:@"xchat"];
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
//-(void)setMessageFrame:(MessageFrameModel *)messageFrame{
//    _messageFrame = messageFrame;
//    MessageModel *message = _messageFrame.message;
//    //1,设置时间
//    self.timeLabel.frame = messageFrame.timeF;
//    self.timeLabel.textAlignment = NSTextAlignmentCenter;
//    self.timeLabel.text = message.time;
//    //2,设置头像
//    if (MessageModelTypeMe == message.type) {
//        self.iconView.image = [UIImage imageNamed:@"me"];
//        [self.contentBtn setBackgroundImage:[UIImage resizableImageWith:@"chat_send_nor"] forState:UIControlStateNormal];
//    }
//    else
//    {
//        [self.contentBtn setBackgroundImage:[UIImage resizableImageWith:@"chat_recive_nor"]  forState:UIControlStateNormal];
//        self.iconView.image = [UIImage imageNamed:@"other"];
//    }
//    self.iconView.frame = _messageFrame.iconF;
//    NSString *text = [message.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
//    text = [text stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
//    text = [text stringByReplacingOccurrencesOfString:@"\\\n" withString:@""];
//    text = [text stringByReplacingOccurrencesOfString:@"\\\\\"" withString:@"\""];
//    
//    //3,设置正文
//    [self.contentBtn setTitle:text forState:UIControlStateNormal];
//    self.contentBtn.frame = _messageFrame.textF;
//    
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
