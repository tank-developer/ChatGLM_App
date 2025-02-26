//
//  NSString+StringFormat.m
//  
//
//  Created by  on 2018/7/18.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

#import "NSString+StringFormat.h"

@implementation NSString (StringFormat)
- (BOOL)ja_format_userPhoneNumber
{
    return [self ja_justNumber];
}

- (BOOL)ja_format_userEmail
{
    return [self ja_email];
}
- (BOOL)ja_email
{
    return [self ja_predicate:@"[\\w!#$%&\'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?"];
}

- (BOOL)ja_justNumber
{
    return [self ja_predicate:@"^[0-9]+$"];
}

- (BOOL)ja_predicate:(NSString *)predicateStr
{
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",predicateStr];
    return [numberPre evaluateWithObject:self];
}


@end
