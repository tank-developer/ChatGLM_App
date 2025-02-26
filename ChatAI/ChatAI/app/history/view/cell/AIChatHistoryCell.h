//
//  AIChatHistoryCell.h
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
#import "MessageFrameModel.h"
#import "UIImage+HQExtension.h"
//#import <YYText/YYText.h>
#import "BaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIChatHistoryCell : BaseTableCell
//@property (nonatomic, strong) MessageFrameModel *messageFrame;

+(instancetype) cellWithTableView:(UITableView *) tableview;
@end

NS_ASSUME_NONNULL_END
