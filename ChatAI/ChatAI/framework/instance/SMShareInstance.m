//
//  SMShareInstance.m
//  SimpleDiary
//
//  Created by Apple on 2022/4/7.
//

#import "SMShareInstance.h"

@implementation SMShareInstance
+ (instancetype)shareInstance{
    static SMShareInstance* single;
    static dispatch_once_t onceToken;   //①onceToken = 0;
    dispatch_once(&onceToken, ^{
        NSLog(@"%ld",onceToken);        //②onceToken = 140734731430192
        single = [[SMShareInstance alloc] init];
    });
    NSLog(@"%ld",onceToken);            //③onceToken = -1;
    return single;
}
-(void)increase{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *count = [NSString stringWithFormat:@"%@",[userDefault objectForKey:@"count"]];
    NSInteger countInt = [count integerValue];
    countInt++;
    
    [userDefault setObject:[NSString stringWithFormat:@"%ld",(long)countInt] forKey:@"count"];
    [userDefault synchronize];
    
    NSLog(@"countInt:%ld",(long)countInt);            //③onceToken = -1;
}

-(NSInteger)getCount{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *count = [NSString stringWithFormat:@"%@",[userDefault objectForKey:@"count"]];
    NSInteger countInt = [count integerValue];
    return countInt;
}
@end
