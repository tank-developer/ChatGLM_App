

#import "YYUITextField.h"

@interface YYUITextField ()

@property (nonatomic,strong) UIView *rBackGroundView;

@end

@implementation YYUITextField


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.rBackGroundView = [[UIView alloc] init];
        self.rBackGroundView.frame = CGRectMake(0, 0, 25, 25);
        self.rightViewMode = UITextFieldViewModeAlways;
        self.rightView = self.rBackGroundView;
        [self addSubview:self.rBackGroundView];
        self.rightIcon = [[UIImageView alloc] init];
        self.rightIcon.frame = CGRectMake(0, 0, 20, 20);
        [self.rBackGroundView addSubview:self.rightIcon];
    }
    return self;
}


- (instancetype)init
{
    self = [super init];
    [self setKeyboardType:UIKeyboardTypeNumberPad];//数字键盘
    return self;
}

- (instancetype)initWithElementKey:(NSString *) elementKey
{
    self = [super init];
    self.elementKey = elementKey;
    self.cellVo = nil;
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}



-(CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconrext = [super leftViewRectForBounds:bounds];
    iconrext.origin.x += 13;
    return iconrext;
}

//控制placeHolder的位置。
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(self.leftView.frame.size.width + 20,bounds.origin.y, 170, 45);
}

//控制，光标的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset= CGRectMake(self.leftView.frame.size.width + 20, bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
    return inset;
}

//编辑文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset= CGRectMake(self.leftView.frame.size.width + 20, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}


@end
