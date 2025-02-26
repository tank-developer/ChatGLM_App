

#import "YYNavLeftBtn.h"

@interface YYNavLeftBtn ()


@end

@implementation YYNavLeftBtn

- (instancetype)init
{
    self = [super init];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame btnImgName:(NSString *) btnImgName btnLbl:(NSString *)btnLbl{
    self = [super initWithFrame:frame];
    if (self) { 
        [self addSubview:self.btnImg];
        [self addSubview:self.btnLbl];
        self.btnLbl.backgroundColor = [UIColor clearColor];
        self.btnImg.backgroundColor = [UIColor clearColor];
        self.btnLbl.text = btnLbl;
        self.btnLbl.textColor = [UIColor whiteColor];
        self.btnImg.image = [UIImage imageNamed:btnImgName];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.btnImg setFrame:CGRectMake(0, 12, 30, 30)];
    [self.btnLbl setFrame:CGRectMake(30, 0, 50, 50)];
}

@end
