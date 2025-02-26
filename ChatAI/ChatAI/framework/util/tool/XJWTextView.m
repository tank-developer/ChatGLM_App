//
//  XJWTextView.m
//  Keyboardtest
//
//  Created by Apple on 2021/11/13.
//

#import "XJWTextView.h"




@implementation XJWTextView


-(void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length == 0) {
        self.placeholderLable.text = placeholderText;
        [self.sendButton setBackgroundColor:[UIColor lightGrayColor]];
        self.sendButton.userInteractionEnabled = NO;
    }else{
        self.placeholderLable.text = nil;
        [self.sendButton setBackgroundColor:[UIColor colorWithRed:178.0f/255.0f green:34.0f/255.0f blue:34.0f/255.0f alpha:1]];
//        self.sendButton.backgroundColor = [UIColor colorWithRed:119.0f/255.0f green:246.0f/255.0f blue:198.0f/255.0f alpha:0.5f];
        self.sendButton.userInteractionEnabled = YES;
    }
    CGSize size = CGSizeMake(kScreenwidth - 65, CGFLOAT_MAX);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil];
    CGFloat curheight = [textView.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading attributes:dic context:nil].size.height;
    CGFloat y = CGRectGetMaxY(self.backGroundView.frame);
    
    if (curheight < 19.094) {
        statusTextView = NO;
        self.backGroundView.frame = CGRectMake(0, y-49, kScreenwidth, 49);
    }else if (curheight < MaxTextViewheight){
        statusTextView = NO;
        self.backGroundView.frame = CGRectMake(0, y - textView.contentSize.height - 10, kScreenwidth, textView.contentSize.height + 10);
        
    }else{
        statusTextView = YES;
        return;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (statusTextView == NO) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }else{
        
    }
}
-(void)setPlaceholderText:(NSString *)text{
    placeholderText = text;
    self.placeholderLable.text = placeholderText;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addConstraint];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        
        UITapGestureRecognizer *centerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(centerTapClick)];
        [self addGestureRecognizer:centerTap];
    }
    return self;
}



-(void)addConstraint{
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backGroundView).offset(6);
        make.left.equalTo(self.backGroundView).offset(5);
        make.bottom.equalTo(self.backGroundView).offset(-6);
        make.width.mas_equalTo(kScreenwidth - 65);
    }];
    [self.placeholderLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backGroundView).offset(5);
        make.left.equalTo(self.backGroundView).offset(10);
        make.height.mas_equalTo(39);
    }];
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backGroundView).offset(8);
        make.right.equalTo(self.backGroundView).offset(-5);
        make.width.mas_equalTo(50);
    }];
}

-(void)keyboardWillShow:(NSNotification *)aNotification{
    self.frame = kScreenBounds;
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardReact = [aValue CGRectValue];
    CGFloat height = keyboardReact.size.height;
    
    if (self.textView.text.length ==0) {
        self.backGroundView.frame = CGRectMake(0, kScreenheight - height - self.backGroundView.frame.size.height, kScreenwidth, 49);
        
    }else{
        CGRect react = CGRectMake(0, kScreenheight - self.backGroundView.frame.size.height - height, kScreenwidth, self.backGroundView.frame.size.height);
        self.backGroundView.frame = react;
    }
}

-(void)keyboardWillHide:(NSNotification *)aNotification{
    if (self.textView.text.length == 0) {
        self.backGroundView.frame = CGRectMake(0, 0, kScreenwidth, 49);
        self.frame = CGRectMake(0, kScreenheight, kScreenwidth, 49);
    }else{
        CGRect rect = CGRectMake(0, 0, kScreenwidth, self.backGroundView.frame.size.height);
        self.backGroundView .frame = rect;
        self.frame = CGRectMake(0, kScreenheight, kScreenwidth, self.backGroundView.frame.size.height);
        
    }
}

-(void)centerTapClick{
    [self.textView resignFirstResponder];
}


-(UIView *)backGroundView{
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenwidth, 49)];
        _backGroundView.backgroundColor = [UIColor colorWithRed:43.0f/255.0f green:35.0f/255.0f blue:46.0f/255.0f alpha:0.5f];
        [self addSubview:_backGroundView];
    }
    return _backGroundView;
}

-(UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.delegate = self;
        _textView.layer.cornerRadius = 5;
        [self.backGroundView addSubview:_textView];
    }
    return _textView;
}

-(UILabel *)placeholderLable{
    if (!_placeholderLable) {
        _placeholderLable = [[UILabel alloc] init];
        _placeholderLable.font = [UIFont systemFontOfSize:16];
        _placeholderLable.textColor = [UIColor grayColor];
        [self.backGroundView addSubview:_placeholderLable];
    }
    return _placeholderLable;
}

-(UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendButton setBackgroundColor:[UIColor lightGrayColor]];
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
        _sendButton.layer.cornerRadius = 5;
        _sendButton.userInteractionEnabled = NO;
        [self.backGroundView addSubview:_sendButton];
    }
    return _sendButton;
}

-(void)sendClick:(UIButton *)sender{
    [self.textView endEditing:YES];
    if (self.TextBlcok) {
        self.TextBlcok(self.textView.text);
    }
    self.textView.text = nil;
    self.placeholderLable.text = placeholderText;
    [self.sendButton setBackgroundColor:[UIColor lightGrayColor]];
    self.sendButton.userInteractionEnabled = NO;
    self.frame = CGRectMake(0, kScreenheight, kScreenwidth, 49);
    self.backGroundView.frame = CGRectMake(0, 0, kScreenwidth, 49);
}
@end

