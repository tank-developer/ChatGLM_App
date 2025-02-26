

#import <UIKit/UIKit.h>

@interface YYUIButton : UIButton
@property (nonatomic,strong)UIImageView *btnImg;
@property (nonatomic,strong)UILabel *btnLbl;
@property (nonatomic,strong) NSString *elementKey;
-(void) setButtonTitleText:(NSString *) titleText;
@end
