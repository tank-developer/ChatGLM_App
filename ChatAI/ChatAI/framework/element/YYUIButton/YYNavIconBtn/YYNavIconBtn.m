

#import "YYNavIconBtn.h"

@interface YYNavIconBtn ()


@end

@implementation YYNavIconBtn

- (instancetype)init
{
    self = [super init];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame btnImgName:(NSString *) btnImgName{
    self = [super initWithFrame:frame];
    if (self) {
        self.btnImg = [[UIImageView alloc] init];
        [self addSubview:self.btnImg];
        self.btnImg.backgroundColor = [UIColor clearColor];
        self.btnImg.image = [UIImage imageNamed:btnImgName];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.btnImg setFrame:CGRectMake(self.frame.size.width/2-20/2, 0, 20, 20)];
}


@end
