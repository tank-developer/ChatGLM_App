

#import <UIKit/UIKit.h>
#import "YYUIButton.h"

@interface YYNavIconBtn : UIButton
@property (nonatomic,strong)UIImageView *btnImg;
@property (nonatomic,strong) NSString *elementKey;
-(instancetype)initWithFrame:(CGRect)frame btnImgName:(NSString *) btnImgName;
@end
