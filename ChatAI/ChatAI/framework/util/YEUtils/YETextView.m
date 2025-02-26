//
//  YETextView.m
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import "YETextView.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "YEMarcos.h"

@implementation YETextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 通知
        // 当UITextView的文字发生改变时，UITextView自己会发出一个UITextViewTextDidChangeNotification通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)awakeFromNib{
    
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    //    self.placeholder=@"";
    self.placeholderColor=[UIColor grayColor];
}

- (void)setMax_count:(NSUInteger)max_count{
    _max_count=max_count;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 * 监听文字改变
 */
- (void)textDidChange:(NSNotification*)ntf
{
    UITextView *textView=ntf.object;
    if (textView!=self) {
        return;
    }
    // 重绘（重新调用）
    [self setNeedsDisplay];
    //    UITextView *textView=self;
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    
    if (existTextNum > self.max_count)
    {
        //截取到最大位置的字符
        NSRange rangeIndex = [nsTextContent rangeOfComposedCharacterSequenceAtIndex:self.max_count];
        if (rangeIndex.length == 1)
        {
            textView.text = [nsTextContent substringToIndex:self.max_count];
        }
        else
        {
            NSRange rangeRange = [nsTextContent rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.max_count)];
            textView.text = [nsTextContent substringWithRange:rangeRange];
        }
        
        [self resignFirstResponder];
        NSString *tip =  [NSString stringWithFormat:@"最大输入%ld字",self.max_count];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kAppWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = tip;
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
        [hud hideAnimated:YES afterDelay:2.0];
        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:tip preferredStyle:(UIAlertControllerStyleAlert)];
//        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }
    
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    // setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // 如果有输入文字，就直接返回，不画占位文字
    if (self.hasText) return;
    
    // 文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor?self.placeholderColor:[UIColor grayColor];
    // 画文字
    //    [self.placeholder drawAtPoint:CGPointMake(5, 8) withAttributes:attrs];
    CGFloat x = 5;
    CGFloat w = rect.size.width - 2 * x;
    CGFloat y = 8;
    CGFloat h = rect.size.height - 2 * y;
    CGRect placeholderRect = CGRectMake(x, y, w, h);
    [self.placeholder drawInRect:placeholderRect withAttributes:attrs];
}


@end
