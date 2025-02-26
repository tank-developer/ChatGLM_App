

#import <UIKit/UIKit.h>
#import "BaseTableCellVo.h"

@interface YYUITextField : UITextField
@property (nonatomic, strong) NSString *elementKey;
@property (nonatomic, strong) BaseTableCellVo *cellVo;
- (instancetype)initWithElementKey:(NSString *) elementKey;
@property (nonatomic,strong) UIImageView *rightIcon;
@end
