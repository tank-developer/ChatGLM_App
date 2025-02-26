//
//  AICategoryWorkView.m
//  ChatAI
//
//  Created by Apple on 2023/7/31.
//

#import "AICategoryWorkView.h"

@implementation AICategoryWorkView
-(UIView *)backContentView{
    if(!_backContentView){
        _backContentView = [[UIView alloc] init];
        [self addSubview:_backContentView];
    }
    return _backContentView;
}

-(UIButton *)comfirmBtn{
    if(!_comfirmBtn){
        _comfirmBtn = [UIButton new];
        [_comfirmBtn setBackgroundColor:[UIColor blueColor]];
    }
    return _comfirmBtn;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
//        self.baseTableView.backgroundColor = [UIColor clearColor];
//        
//        self.backContentView.backgroundColor = [UIColor whiteColor];
//        [self.backContentView addSubview:self.comfirmBtn];
//
//        [self.comfirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    self.baseTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 60);
//
//    self.backContentView.frame = CGRectMake(1, self.baseTableView.frame.size.height + self.baseTableView.frame.origin.y, SCREEN_WIDTH, 60);
//    self.comfirmBtn.frame = CGRectMake(self.backContentView.frame.size.width/2-200/2, self.backContentView.frame.size.height/2-44/2, 200, 44);
}

@end
