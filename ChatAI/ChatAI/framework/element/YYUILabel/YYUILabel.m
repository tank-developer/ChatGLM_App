

#import "YYUILabel.h"

@interface YYUILabel ()


@end

@implementation YYUILabel

- (instancetype)init
{
    self = [super init];
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
//    [self.iconRight makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.right).offset(-5);
//        make.top.equalTo(self.top).offset(8);
//        make.bottom.equalTo(self.bottom).offset(-8);
//        make.width.equalTo(20);
//    }];
    
}
- (instancetype)initWithElementKey:(NSString *) elementKey
{
    self = [super init];
    self.elementKey = elementKey;
    self.iconRight = [[UIImageView alloc] init];
    self.iconRight.backgroundColor = [UIColor clearColor];
    self.iconRight.hidden = YES;
    [self addSubview:self.iconRight];
    return self;
}

@end
