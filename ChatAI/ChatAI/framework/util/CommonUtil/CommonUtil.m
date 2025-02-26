//
//  CommonUtil.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "CommonUtil.h"
#import <objc/runtime.h>

#define CON_DATE_FORMAT @"yyyy-MM-dd"
#define CON_DATE_TIME_FORMAT @"yyyy-MM-dd HH:mm:ss"
#define CON_DATE_TIME_WITHOUTSECOND @"yyyy-MM-dd HH:mm"
#define IMG_DATA_FILE @"IMG"
#define IMAGE_PATH @"Documents"

@implementation CommonUtil
+(int) getArrayCount:(NSMutableArray *) inArray{
    if (inArray == nil) {
        return 0;
    }
    NSNumber *selRow = [[NSNumber alloc] initWithInteger:[inArray count]];
    return [selRow intValue];
}
+(void) addDataToNSMutableArray:(NSMutableArray *) trgArray inArray:(NSMutableArray *) inArray{
    if (trgArray == nil || inArray == nil) {
        return;
    }
    for (int idx=0; idx<[inArray count]; idx++) {
        [trgArray addObject:[inArray objectAtIndex:idx]];
    }
}
+(NSMutableArray *)removeBaseTableCellVoFromArrayByCellKey:(NSString *)cellKey dataArray:(NSMutableArray *) dataArray{
    if (dataArray == nil) {
        return dataArray;
    }
    for (int idx=0; idx<[dataArray count]; idx++) {
        BaseTableCellVo *cellVo = [dataArray objectAtIndex:idx];
        if ([cellVo.cellKey isEqualToString:cellKey]) {
            [dataArray removeObjectAtIndex:idx];
        }
    }
    return dataArray;
}

+ (BOOL) isEmptyString :(NSString *) instr{
    if (instr == nil || [instr isEqualToString:@""]) {
        return TRUE;
    }
    
    return FALSE;
}

+ (NSString *) trimNSString:(NSString *)inStr{
    if (inStr == nil) {
        return @"";
    }
    return [inStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+(NSString *) getDateFromDateTime:(NSString *) dateTimeStr{
    if (dateTimeStr == nil || dateTimeStr.length<10) {
        return @"";
    }
    return [dateTimeStr substringToIndex:10];
}
+(NSString *) getTimeFromDateTime:(NSString *) dateTimeStr{
    if (dateTimeStr == nil || dateTimeStr.length<11) {
        return @"";
    }
    return [dateTimeStr substringFromIndex:11];
}

+ (NSString *)dateToString:(NSDate *)date{
    return [self dateToString:date dateFormat:CON_DATE_FORMAT];
}

+ (NSString *)dateTimeToString:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:CON_DATE_TIME_FORMAT];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

+ (NSString *)dateTimeToString:(NSDate *)date dateFormat:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

+ (NSString *)dateToString:(NSDate *)date dateFormat:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

+ (NSDate *)stringToDate:(NSString *)stringDate{
    if ([CommonUtil isEmptyString:stringDate]) {
        return nil;
    }
    if (CON_DATE_FORMAT.length == stringDate.length) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: CON_DATE_FORMAT];
        NSDate *destDate= [dateFormatter dateFromString:stringDate];
        return destDate;
    }
    if (CON_DATE_TIME_FORMAT.length == stringDate.length) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: CON_DATE_TIME_FORMAT];
        NSDate *destDate= [dateFormatter dateFromString:stringDate];
        return destDate;
    }
    if (CON_DATE_TIME_WITHOUTSECOND.length == stringDate.length) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: CON_DATE_TIME_WITHOUTSECOND];
        NSDate *destDate= [dateFormatter dateFromString:stringDate];
        return destDate;
    }
    return nil;
}


+ (NSDate *)stringToTime:(NSString *)stringTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: CON_DATE_TIME_FORMAT];
    NSDate *destDate= [dateFormatter dateFromString:stringTime];
    return destDate;
}

+(NSString *)getCurrentDate{
    return [CommonUtil dateToString:[NSDate date]];
}

+(NSString *)getYesterdayDate{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    return [CommonUtil dateToString:yesterday];
}

+(NSString *)getThisWeekDay1{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 2))];
    NSDate *thisWeek  = [cal dateFromComponents:components];
    return [CommonUtil dateToString:thisWeek];
}

+(NSString *)getThisWeekDay7{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 2) +6)];
    NSDate *thisWeek7  = [cal dateFromComponents:components];
    return [CommonUtil dateToString:thisWeek7];
}

+(NSString *)getThisWeekDay6{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 2) +5)];
    NSDate *thisWeek7  = [cal dateFromComponents:components];
    return [CommonUtil dateToString:thisWeek7];
}
+(NSString *)getThisWeekDay5{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 2) +4)];
    NSDate *thisWeek7  = [cal dateFromComponents:components];
    return [CommonUtil dateToString:thisWeek7];
}
+(NSString *)getThisWeekDay4{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 2) +3)];
    NSDate *thisWeek7  = [cal dateFromComponents:components];
    return [CommonUtil dateToString:thisWeek7];
}
+(NSString *)getThisWeekDay3{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 2) +2)];
    NSDate *thisWeek7  = [cal dateFromComponents:components];
    return [CommonUtil dateToString:thisWeek7];
}
+(NSString *)getThisWeekDay2{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 2) +1)];
    NSDate *thisWeek7  = [cal dateFromComponents:components];
    return [CommonUtil dateToString:thisWeek7];
}


+(NSString *)getCurrentTime{
    NSDateFormatter *nsdf2=[[NSDateFormatter alloc] init];
    [nsdf2 setDateStyle:NSDateFormatterShortStyle];
    [nsdf2 setDateFormat:CON_DATE_TIME_FORMAT];
    NSString *date=[nsdf2 stringFromDate:[NSDate date]];
    return date;
}

+(NSString *)getCurrentTime:(NSString *)dateFormat{
    NSDateFormatter *nsdf2=[[NSDateFormatter alloc] init];
    [nsdf2 setDateStyle:NSDateFormatterShortStyle];
    [nsdf2 setDateFormat:dateFormat];
    NSString *date=[nsdf2 stringFromDate:[NSDate date]];
    return date;
}

+(NSString *)getCurrentYear{
    return [CommonUtil dateToString:[NSDate date] dateFormat:@"YYYY"];
}
+(NSString *)getCurrentMonth{
    return [CommonUtil dateToString:[NSDate date] dateFormat:@"MM"];
}
+(NSString *)getCurrentDay{
    return [CommonUtil dateToString:[NSDate date] dateFormat:@"DD"];
}
+(NSString *)getCurrentDate:(NSString *) dateFormat{
    return [CommonUtil dateToString:[NSDate date] dateFormat:dateFormat];
}


+(NSString *)nullToNSString:(NSString *) inString{
    if (inString == nil) {
        return @"";
    }
    if (inString == NULL) {
        return @"";
    }
    if ([inString isKindOfClass:[NSString class]]) {
        if ([inString length] == 0  ) {
            return @"";
        }
    }
    return inString;
}

+(NSString *) mapValueToString:(NSDictionary *) map key:(NSString *)key{
    if ([map objectForKey:key] == nil) {
        return @"";
    }
    if ([map objectForKey:key] == NULL) {
        return @"";
    }
    if ([[map objectForKey:key] isKindOfClass:[NSString class]]) {
        return [CommonUtil nullToNSString:[map objectForKey:key]];
    }else if([[map objectForKey:key] isEqual:[NSNull null]]){
        return @"";
    } else{
        return [[map objectForKey:key] stringValue];
    }
}

+ (int) nsstringToInt:(NSString *)nsstring{
    if (nsstring == nil || [CommonUtil isEmptyString:nsstring]) {
        return 0;
    }
    return [nsstring intValue];
}

+ (NSString *) intToNSString:(int) intValue{
    return [NSString stringWithFormat:@"%d",intValue];
}

+ (NSString *) nsIntegerToNSString:(NSInteger) nsIntegerValue{
    return [[NSNumber numberWithInteger:nsIntegerValue ] stringValue];
}



+(BOOL) isFileExists:(NSString *) fileName{
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:IMAGE_PATH] stringByAppendingPathComponent:fileName];
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:fullPath];
    if (!blHave) {
        return FALSE;
    }else{
        return TRUE;
    }
}


+ (void) alertYesOrNoWithTitle: (NSString *)theTitle msg: (NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:theTitle
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确定",nil];
    [alert show];
}


+ (void) alertWithTitle: (NSString *)theTitle msg: (NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:theTitle
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

+ (BOOL) isValidDate:(NSString *) strDate{
    if ([strDate isEqualToString:[CommonUtil dateToString:[CommonUtil stringToDate:strDate]]]) {
        return TRUE;
    }else{
        return FALSE;
    }
}

+ (BOOL) isValidDateTime:(NSString *) strDateTime{
    if ([strDateTime isEqualToString:[CommonUtil dateTimeToString:[CommonUtil stringToTime:strDateTime]]]) {
        return TRUE;
    }else{
        return FALSE;
    }
}

+ (NSDate *)getCurrentNSDate
{
    NSDate *currDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:currDate];
    currDate = [currDate dateByAddingTimeInterval:interval];
    return currDate;
}

+ (NSString *) lpadNumber:(int) number padCount:(int) count{
    int countNumber = 10;
    for (int i=0; i<count; i++) {
        countNumber = countNumber * 10;
    }
    int preNumber = number + countNumber;
    return [[CommonUtil intToNSString:preNumber] substringFromIndex:2];
}

+ (BOOL) isEmptyMap :(NSMutableDictionary *) inMap{
    if (inMap == nil) {
        return TRUE;
    }else{
        return FALSE;
    }
}

+(NSString *)nullToString:(char *) cString{
    if (cString == NULL || cString == nil) {
        return @"";
    }
    return [[NSString alloc] initWithUTF8String: cString];
}

+(NSString *) dicToJsonString:(NSMutableDictionary *) pamDic{
    NSMutableString *jsonStr = [[NSMutableString alloc] init];
    if (pamDic!=nil) {
        int cidx = 0;
        for (id pamKey in [pamDic allKeys]) {
            
            //NSLog(@"pamKey==%@",pamKey);
            if ([[pamDic objectForKey:pamKey] isKindOfClass:[NSString class]] ) {
                if (cidx != 0) {
                    //element之间分隔符
                    [jsonStr appendString:@","];
                }
                [jsonStr appendString:@"\""];
                [jsonStr appendString:pamKey];
                [jsonStr appendString:@"\":"];
                [jsonStr appendString:@"\""];
                [jsonStr appendString:[pamDic objectForKey:pamKey]];
                [jsonStr appendString:@"\""];
            }else if ([[pamDic objectForKey:pamKey] isKindOfClass:[NSMutableArray class]] ) {
                NSMutableArray *listArray =[pamDic objectForKey:pamKey];
                if (listArray != nil && [listArray count] > 0) {
                    if (cidx != 0) {
                        //element之间分隔符
                        [jsonStr appendString:@","];
                    }
                    
                    [jsonStr appendString:@"\""];
                    [jsonStr appendString:pamKey];
                    [jsonStr appendString:@"\": ["];
                    for (int idx=0; idx<[listArray count]; idx++) {
                        if (idx != 0) {
                            [jsonStr appendString:@","];
                        }
                        [jsonStr appendString:@"{"];
                        NSMutableDictionary *listMap = [listArray objectAtIndex:idx];
                        [jsonStr appendString:[self dicToJsonString:listMap]];
                        [jsonStr appendString:@"}"];
                    }
                    [jsonStr appendString:@"]"];
                }
            }else{
                if (cidx != 0) {
                    //element之间分隔符
                    [jsonStr appendString:@","];
                }
                [jsonStr appendString:@"\""];
                [jsonStr appendString:pamKey];
                [jsonStr appendString:@"\":"];
                [jsonStr appendString:@"\""];
                [jsonStr appendString:[pamDic objectForKey:pamKey]];
                [jsonStr appendString:@"\""];
            }
            
            cidx++;
        }
    }
    return jsonStr;
}


//+(NSString *)encryByParameterMap:(NSMutableDictionary *)pamDic{
//    NSString *str = @"{\"typ\":\"JWT\",\"alg\":\"SHA256\"}";
//    NSString *head = [ZZBase64 encodeBase64String:str];
//    //拼接字符串
//    NSMutableString *jsonStr = [[NSMutableString alloc] init];
//    [jsonStr appendString:@"{\"iss\":"];
//    [jsonStr appendString:@"\""];
//    [jsonStr appendString:CLIENT_UUID];
//    [jsonStr appendString:@"\""];
//    if (pamDic!=nil) {
//        [jsonStr appendString:@","];
//        [jsonStr appendString:[self dicToJsonString:pamDic]];
//    }
//    [jsonStr appendString:@"}"];
//    //NSLog(@"jsonStr = %@",jsonStr);
//    //NSString *f = [NSString stringWithFormat:@"{\"iss\":\"%@\",\"firstId\":\"%@\",\"pageable\":\"%zd\"}",CLIENT_UUID,firstid,pageable];
//    NSString *playLoadString = [ZZBase64 encodeBase64String:jsonStr];
//    NSString *connect = [NSString stringWithFormat:@"%@.%@",head,playLoadString];
//    NSString *se = [connect SHA256];
//    NSString *jwt = [NSString stringWithFormat:@"%@.%@",connect,se];
//    return jwt;
//}

+(int) getIntFromMapByKey:(NSDictionary *) map key:(NSString *)key{
    NSString *intStr = [map objectForKey:key];
    return [CommonUtil nsstringToInt:intStr];
}

//+(NSString *) getCurrentUserName{
//    userModel *model = kuserModel;
//    return [CommonUtil nullToNSString:model.userName];
//}

+ (BOOL)isValidInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
//判断是否为浮点形：
+ (BOOL)isValidFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
+(NSObject *) getObjectFromURLDicResult:(NSDictionary *) urlDic objKey:(NSString *)objKey{
    if (urlDic == nil) {
        return @"";
    }
    if ([urlDic objectForKey:@"result"] == nil) {
        return @"";
    }
    NSDictionary *rstDic =[urlDic objectForKey:@"result"];
    if ([rstDic objectForKey:objKey] == nil) {
        return @"";
    }else{
        return [rstDic objectForKey:objKey];
    }
    return @"";
}

+(NSDictionary *) getEntityFromURLDic:(NSDictionary *) urlDic entityName:(NSString *)entityName {
    if (urlDic==nil) {
        return nil;
    }
    if ([urlDic objectForKey:@"result"] == nil) {
        return nil;
    }
    NSDictionary *rstDic = [urlDic objectForKey:@"result"];
    if ([rstDic objectForKey:entityName]==nil ) {
        return nil;
    }
    NSDictionary *entityDic =[rstDic objectForKey:entityName];
    return entityDic;
}

+(NSString *)getNSStringFromURLDic:(NSDictionary *) urlDic entityName:(NSString *)entityName objKey:(NSString *)objKey {
    if (urlDic==nil) {
        return nil;
    }
    if ([urlDic objectForKey:@"result"] == nil) {
        return nil;
    }
    NSDictionary *rstDic = [urlDic objectForKey:@"result"];
    if ([rstDic objectForKey:entityName]==nil ) {
        return nil;
    }
    NSDictionary *entityDic =[rstDic objectForKey:entityName];
    return [entityDic objectForKey:objKey];
}

+(NSArray *)getNSArrayFromURLDic:(NSDictionary *) urlDic entityName:(NSString *)entityName objKey:(NSString *)objKey{
    if (urlDic==nil) {
        return nil;
    }
    if ([urlDic objectForKey:@"result"] == nil) {
        return nil;
    }
    NSDictionary *rstDic = [urlDic objectForKey:@"result"];
    if ([rstDic objectForKey:entityName ]==nil ) {
        return nil;
    }
    NSDictionary *entityDic =[rstDic objectForKey:entityName];
    return [entityDic objectForKey:objKey];
}

+(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSLog(@"jsonString==%@",jsonString);
    return jsonString;
}

+(BOOL) isContainString:(NSString *) wholeStr subStr:(NSString *)subStr{
    if ([wholeStr rangeOfString:subStr].location != NSNotFound) {
        return TRUE;
    }
    return FALSE;
}
+(BOOL) isEmptyArray:(NSArray *) inArray{
    if (inArray == nil || [inArray count] == 0) {
        return TRUE;
    }
    return FALSE;
}

+(BOOL) isEmptyObject:(NSObject *) obj{
    if ([obj isKindOfClass:[NSString class]]) {
        return [CommonUtil isEmptyString:(NSString *)obj];
    }
    return obj==nil;
}
+ (BOOL)isEmpty:(id)object{
    if (object == nil || [object isEqual:[NSNull null]]) {
        return YES;
    } else if ([object isKindOfClass:[NSString class]]) {
        return [object isEqualToString:@""];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [object isEqualToNumber:@(0)];
    }
    return NO;
}


+(NSString *)getMonthFromNSStringDate:(NSString *) strDate{
    if ([CommonUtil isEmptyString:strDate]) {
        return @"";
    }
    NSDate *theDate = [CommonUtil stringToDate:strDate];
    //    NSLog(@"theDate:%@",theDate);
    return [CommonUtil dateToString:theDate dateFormat:@"MM"];
}

+(NSString *)getDayFromNSStringDate:(NSString *) strDate{
    if ([CommonUtil isEmptyString:strDate]) {
        return @"";
    }
    NSDate *theDate = [CommonUtil stringToDate:strDate];
    //    NSLog(@"theDate:%@",theDate);
    return [CommonUtil dateToString:theDate dateFormat:@"dd"];
}

+ (void) saveImage:(UIImage *)currentImage withName:(NSString *)fileName
{
    NSLog(@"calling  saveImage= %@", fileName);
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.1);
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:IMAGE_PATH] stringByAppendingPathComponent:fileName];
    [imageData writeToFile:fullPath atomically:NO];
}
+ (UIImage *) getImage:(NSString *)fileName{
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:IMAGE_PATH] stringByAppendingPathComponent:fileName];
    
    return [[UIImage alloc] initWithContentsOfFile:fullPath];
}
+ (UIImage *) getImageByImageSid:(NSString *)imgSid{
    NSString *fileName = [NSString stringWithFormat:@"%@.png",imgSid];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:IMAGE_PATH] stringByAppendingPathComponent:fileName];
    
    return [[UIImage alloc] initWithContentsOfFile:fullPath];
}
+(BOOL)deleteImage:(NSString * )fileName
{
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:IMAGE_PATH] stringByAppendingPathComponent:fileName];
    if([[NSFileManager defaultManager] fileExistsAtPath:fullPath])//如果存在临时文件的配置文件
    {
        NSLog(@"calling  deleteImage= %@", fileName);
        return  [[NSFileManager defaultManager]  removeItemAtPath:fullPath error:nil];
    }
    return NO;
}
+ (BOOL)isBlankDictionary:(NSMutableDictionary *)dic {
    if (!dic) {
        return YES;
    }
    if ([dic isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!dic.count) {
        return YES;
    }
    if (dic == nil) {
        return YES;
    }
    if (dic == NULL) {
        return YES;
    }
    if (![dic isKindOfClass:[NSMutableDictionary class]]) {
        return YES;
    }
    return NO;
    
}

//+ (BOOL)ja_justNumber{
//    return [self ja_predicate:@"^[0-9]+$"];
//}
//
//+ (BOOL)ja_predicate:(NSString *)predicateStr{
//    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",predicateStr];
//    return [numberPre evaluateWithObject:self];
//}

+(NSString *)getZHCurrentDate{
    NSDate *date = [NSDate date];
    //如果没有规定formatter的时区，那么formatter默认的就是当前时区，比如现在在北京就是东八区，在东京就是东九区
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //最结尾的Z表示的是时区，零时区表示+0000，东八区表示+0800
    [formatter setDateFormat:@"yyyy年MM月dd日"];
   // 使用formatter转换后的date字符串变成了当前时区的时间
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+(UIActivityViewController *)shareAPP{
    //分享的标题
    NSString *textToShare = @"标题";
    //分享的图片
    UIImage *imageToShare = [UIImage imageNamed:@"more.png"];
    //分享的url
    NSURL *urlToShare = [NSURL URLWithString:@"http://www.baidu.com"];

    NSArray *activityItems = @[textToShare,imageToShare, urlToShare];
        
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];

    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
        
//    [self presentViewController:activityVC animated:YES completion:nil];
    //分享之后的回调
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (completed) {
            NSLog(@"completed");
            //分享 成功
        } else  {
            NSLog(@"cancled");
            //分享 取消
        }
    };
    return activityVC;
}

// 删除沙盒里的文件
+(void)deleteFile:(int )count{
    NSFileManager* fileManager=[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *path = [NSString stringWithFormat:@"%ld_pic.png",(long)count];
    //文件名
    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:path];
    
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
        if (!blHave) {
            NSLog(@"no  have");
            return ;
        }else {
            NSLog(@" have");
            BOOL blDele= [fileManager removeItemAtPath:uniquePath error:nil];
            if (blDele) {
                NSLog(@"dele success");
            }else {
                NSLog(@"dele fail");
            }
    }
}
//得到沙盒文件夹 下的所有文件
+(void)getAllfile:(NSString *)path{

    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSString *document=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

    NSArray *fileList ;

    fileList =[fileManager contentsOfDirectoryAtPath:document error:NULL];

    for (NSString *file in fileList) {

        NSLog(@"file=%@",file);
        NSString *path =[document stringByAppendingPathComponent:file];
        NSLog(@"得到的路径=%@",path);
    }
        
}


+ (NSDictionary*)getObjectData:(id)obj
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);//获得属性列表
    for(int i = 0;i < propsCount; i++)
    {
        objc_property_t prop = props[i];
        
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];//获得属性的名称
        id value = [obj valueForKey:propName];//kvc读值
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];//自定义处理数组，字典，其他类
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}

+ (id)getObjectInternal:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
}
//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+(NSString *)FirstCharactor:(NSString *)pString{
    //转成了可变字符串
    NSMutableString *pStr = [NSMutableString stringWithString:pString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)pStr,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)pStr,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pPinYin = [pStr capitalizedString];
    //获取并返回首字母
    return [pPinYin substringToIndex:1];
}

+(UIColor *) randomColor{
//    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
//    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
//    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
//    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.4f];
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:0.4f];
}

+(NSString *)getCurrentDatee{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}
#pragma mark - containsObject方法 去掉重复的元素
+(NSMutableArray *)removeRepeatWithContainObjFunc:(NSArray *)array {
    NSMutableArray *listArray = [NSMutableArray array];
    for (NSString  *str in array) {
        if (![listArray containsObject:str]) {
            [listArray addObject:str];
        }
    }
    return listArray;
//    NSLog(@"containFunc ====  %@", listArray);
}
//根据时间获取星期几
+(NSString *)getWeekDayFordate:(NSString *)currentDate{
    NSString *tem = currentDate;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];

    [dateFormat setDateFormat:@"EEE"];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];

    formatter2.dateFormat = @"yyyy-MM-dd";

    NSDate *endDate = [formatter2 dateFromString:tem];

    NSString *theWeek = [dateFormat stringFromDate:endDate];
    NSString *zhWeak = @"";
    if([theWeek isEqualToString:@"Sat"]){
        zhWeak = @"星期六";
    }else if ([theWeek isEqualToString:@"Fri"]){
        zhWeak = @"星期五";
    }else if ([theWeek isEqualToString:@"Thu"]){
        zhWeak = @"星期四";
    }else if ([theWeek isEqualToString:@"Mon"]){
        zhWeak = @"星期一";
    }else if ([theWeek isEqualToString:@"Sun"]){
        zhWeak = @"星期日";
    }else if ([theWeek isEqualToString:@"Tues"]){
        zhWeak = @"星期二";
    }else if ([theWeek isEqualToString:@"Wed"]){
        zhWeak = @"星期三";
    }
    return zhWeak;
}
//时间转时间戳
+(NSString*)getTimeStrWithString:(NSString*)str{
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc]init];
    // 创建一个时间格式化对象[
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //设定时间的格式
    NSDate*tempDate=[dateFormatter dateFromString:str];
    //将字符串转换为时间对象
    NSString*timeStr=[NSString stringWithFormat:@"%ld",(long)[tempDate timeIntervalSince1970]*1000];
    //字符串转成时间戳,精确到毫秒*1000
    return timeStr;
    
}

+(NSString *)getMonthByDate:(NSString *)date{
    NSArray *dateArr = [date componentsSeparatedByString:@"-"];
    return [NSString stringWithFormat:@"%ld",(long)[[dateArr objectAtIndex:1] integerValue]];
}
    
+(NSInteger )increase{
    NSUserDefaults *userDefau = [NSUserDefaults standardUserDefaults];
    NSInteger count12 = [userDefau integerForKey:@"count"];
    NSInteger count2 = count12 + 1;
    [userDefau setInteger:count2 forKey:@"count"];
    [userDefau synchronize];
    return count2;
}

+(NSInteger )questionIdIncrease{
    NSUserDefaults *userDefau = [NSUserDefaults standardUserDefaults];
    NSInteger count12 = [userDefau integerForKey:@"questionId"];
    NSInteger count2 = count12 + 1;
    [userDefau setInteger:count2 forKey:@"questionId"];
    [userDefau synchronize];
    return count2;
}
+(void)deleteQuestionId{
    NSUserDefaults *userDefau = [NSUserDefaults standardUserDefaults];
    [userDefau removeObjectForKey:@"questionId"];
    [userDefau synchronize];
}

+(NSInteger )categoryIdIncrease{
    NSUserDefaults *userDefau = [NSUserDefaults standardUserDefaults];
    NSInteger count12 = [userDefau integerForKey:@"categoryId"];
    NSInteger count2 = count12 + 1;
    [userDefau setInteger:count2 forKey:@"categoryId"];
    [userDefau synchronize];
    return count2;
}
+(void)deleteCategoryId{
    NSUserDefaults *userDefau = [NSUserDefaults standardUserDefaults];
    [userDefau removeObjectForKey:@"categoryId"];
    [userDefau synchronize];
}
@end
