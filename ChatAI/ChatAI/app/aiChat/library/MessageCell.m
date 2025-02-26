//
//  MessageCell.m
//  QQPage
//
//  Created by 李海群 on 2017/7/4.
//  Copyright © 2017年 李海群. All rights reserved.
//

#import "MessageCell.h"

#import "MMMarkdown.h"
#import <WebKit/WebKit.h>
#import "CBAppConfig.h"


#define MAX_LENGTH_LINE 30
#define MAX_LENGTH_ROWS 20

@interface MessageCell (){
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


@property (nonatomic, strong) WKWebView *webview;


@end

@implementation MessageCell

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
-(WKWebView *)webview{
    if(!_webview){
        _webview = [[WKWebView alloc]initWithFrame:_messageFrame.textF];
//        [self.contentView addSubview:_webview];
    }
    return _webview;
}
/**
 重写init方法
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.timeLabel.text = @"";
        
        [self.contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
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
        
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *identifier = @"message";
    MessageCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.contentView.backgroundColor = [UIColor blackColor];
    return cell;
}

-(void)setMessageFrame:(MessageFrameModel *)messageFrame
{
    _messageFrame = messageFrame;
    MessageModel *message = _messageFrame.message;
    //1,设置时间
    self.timeLabel.frame = messageFrame.timeF;
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.text = message.time;
    //2,设置头像
    if (MessageModelTypeMe == message.type) {
        self.iconView.image = [UIImage imageNamed:@"me"];
        [self.contentBtn setBackgroundColor:backgroundMeColor_Dark];
        [self.contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.contentBtn setBackgroundImage:[UIImage resizableImageWith:@"chat_send_nor"] forState:UIControlStateNormal];
    }
    else
    {
//        [self.contentBtn setBackgroundImage:[UIImage resizableImageWith:@"chat_recive_nor"]  forState:UIControlStateNormal];
        [self.contentBtn setBackgroundColor:backgroundOtherColor_Dark];
        self.iconView.image = [UIImage imageNamed:@"xchat"];
        [self.contentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    self.iconView.frame = _messageFrame.iconF;
    NSString *text = [message.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    text = [text stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
    text = [text stringByReplacingOccurrencesOfString:@"\\\n" withString:@""];
    text = [text stringByReplacingOccurrencesOfString:@"\\\\\"" withString:@"\""];
    
    //3,设置正文
    [self.contentBtn setTitle:text forState:UIControlStateNormal];
    self.contentBtn.frame = _messageFrame.textF;
    
    
    

//    self.contentTextView.text = message.text;
//    self.contentTextView.text = [message.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
//    self.contentTextView.frame = messageFrame.textF;

    


//    self.contentLabel.text = [message.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
//    self.contentLabel.text = text;
//    self.contentLabel.frame = messageFrame.textF;
    
    
    

    
    
}

-(void)setHtml{
    NSError *error;
    NSString *htmlString = [MMMarkdown HTMLStringWithMarkdown:@"" error:&error];
    self.webview.frame = _messageFrame.textF;
    [self.webview loadHTMLString:htmlString baseURL:nil];
}

-(NSString *)JSONString:(NSString *)aString {
    NSMutableString *s = [NSMutableString stringWithString:aString];
    [s replaceOccurrencesOfString:@"\\" withString:@"\\\\" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    return [NSString stringWithString:s];
}
- (NSString *)string2JSONString:(NSString *)string {
    NSMutableString *s = [NSMutableString stringWithString:string];
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    return [NSString stringWithString:s];
}
- (NSString *)string22JSONString:(NSString *)string {
    NSMutableString *s = [NSMutableString stringWithString:string];
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    return [NSString stringWithString:s];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
