//
//  AICategoryChatView.m
//  ChatAI
//
//  Created by Apple on 2023/7/30.
//

#import "AICategoryChatView.h"
#import "YYUITableView.h"

@implementation AICategoryChatView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.origin.y + self.frame.size.height, SCREEN_WIDTH, 44)];
        self.backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backView];
        
        self.bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-300/2, self.backView.frame.size.height/2-40/2, 300, 40)];
        self.bottomBtn.backgroundColor = [UIColor blackColor];
//        [self.bottomBtn addTarget:self action:@selector(popKeyboard:) forControlEvents:UIControlEventTouchUpInside];
        [self.backView addSubview:self.bottomBtn];
        self.bottomBtn.layer.cornerRadius = 10;
        self.bottomBtn.layer.masksToBounds = YES;
        self.bottomBtn.backgroundColor = [UIColor blackColor];
        [self.bottomBtn setTitle:@"输入问题..." forState:UIControlStateNormal];
        [self.backView addSubview:self.bottomBtn];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.baseTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44);
    
    self.backView.frame = CGRectMake(0, self.baseTableView.frame.origin.y + self.baseTableView.frame.size.height, SCREEN_WIDTH, 44);
    
    self.bottomBtn.frame = CGRectMake(SCREEN_WIDTH/2-300/2, self.backView.frame.size.height/2-40/2, 300, 40);

}

@end
