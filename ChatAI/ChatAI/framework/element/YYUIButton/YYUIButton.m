

#import "YYUIButton.h"

@interface YYUIButton ()


@end

@implementation YYUIButton

- (instancetype)init
{
    self = [super init];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.btnImg = [[UIImageView alloc] init];
    self.btnLbl = [[UILabel alloc] init]; 
    return self;
}

-(void) setButtonTitleText:(NSString *) titleText{
    [self setTitle:titleText forState:UIControlStateNormal];
    [self setTitle:titleText forState:UIControlStateSelected];
}



@end
