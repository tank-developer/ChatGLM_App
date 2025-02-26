//
//  AISettingVIPCell.h
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "BaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AISettingVIPCell : BaseTableCell
@property (nonatomic,strong)UILabel *updateVIPLbl;
@property (nonatomic,strong)UIImageView *VIPImg;
@property (nonatomic,strong)UILabel *countLbl;
@property (nonatomic,strong)UILabel *ChatGLMLbl;

@end

NS_ASSUME_NONNULL_END
