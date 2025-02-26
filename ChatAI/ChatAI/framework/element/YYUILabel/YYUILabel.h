

#import <UIKit/UIKit.h>

@interface YYUILabel : UILabel
@property (nonatomic, strong) NSString *elementKey;
- (instancetype)initWithElementKey:(NSString *) elementKey;
@property (nonatomic,strong)UIImageView *iconRight;
@end
