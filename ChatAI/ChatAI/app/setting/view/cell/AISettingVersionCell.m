//
//  AISettingVersionCell.m
//  ChatAI
//
//  Created by Apple on 2023/8/2.
//

#import "AISettingVersionCell.h"

@implementation AISettingVersionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.textLabel.text = @"版本：1.0.0";
        self.textLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
