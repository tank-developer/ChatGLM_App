//
//  AISettingContactUsCell.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AISettingContactUsCell.h"

@implementation AISettingContactUsCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.textLabel.text = @"联系我们";
        self.detailTextLabel.text = @"1051136697@qq.com";
        self.detailTextLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
