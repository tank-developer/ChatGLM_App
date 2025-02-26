//
//  YETextField.m
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import "YETextField.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "YEMarcos.h"

@implementation YETextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 通知
        // 当UITextField的文字发生改变时，UITextField自己会发出一个UITextFieldTextDidChangeNotification通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:self];
    }
    return self;
}
-(void)awakeFromNib{
    
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:self];
    
}
-(void)setMax_count:(NSUInteger)max_count{
    _max_count=max_count;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)textDidChange:(NSNotification *)obj {
    UITextField *textField = (UITextField *)obj.object;
    
    if (textField!=self) {
        return;
    }
    NSString *toBeString = textField.text;
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position||!selectedRange)
    {
        if (toBeString.length > self.max_count)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.max_count];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:self.max_count];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.max_count)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
            [self resignFirstResponder];
            NSString *tip =  [NSString stringWithFormat:@"最大输入%lu字",(unsigned long)self.max_count];
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kAppWindow animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.detailsLabel.text = tip;
            hud.detailsLabel.font = [UIFont systemFontOfSize:15];
            [hud hideAnimated:YES afterDelay:2.0];
            
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:tip preferredStyle:(UIAlertControllerStyleAlert)];
//            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        }
        
    }
}


- (void)setLeftVacancyLength:(CGFloat)length{
    
    if (length < 10) {
        length = 10;
    }
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,length, 0)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
