//
//  XJWTextView.h
//  Keyboardtest
//
//  Created by Apple on 2021/11/13.
//

#import <UIKit/UIKit.h>
//#import "Masonry.h"
#import <Masonry/Masonry.h>
#define MaxTextViewheight 80
#define kScreenBounds ([[UIScreen mainScreen] bounds])
#define kScreenwidth (kScreenBounds.size.width)
#define kScreenheight (kScreenBounds.size.height)
//#define MaxTextViewheight 80
//#define MaxTextViewheight 80

NS_ASSUME_NONNULL_BEGIN
typedef void (^XBTextViewBlcok)(NSString *text);

@interface XJWTextView : UIView<UITextViewDelegate,UIScrollViewDelegate>{
    BOOL statusTextView;
    NSString *placeholderText;
}
/* 唤醒 */
@property (nonatomic,strong) UITextView *textView;
/*发送文本 */
@property (nonatomic,copy) XBTextViewBlcok TextBlcok;
/*设置占位符 */
-(void)setPlaceholderText:(NSString *)text;

@property (nonatomic,strong) UIView *backGroundView;
@property (nonatomic,strong) UILabel *placeholderLable;
@property (nonatomic,strong) UIButton *sendButton;


@end

NS_ASSUME_NONNULL_END
