//
//  CommonUtil.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseTableCellVo.h"

//#import "MMKVUtil.h"

@interface CommonUtil : NSObject
+(int) getArrayCount:(NSMutableArray *) inArray;
+(void) addDataToNSMutableArray:(NSMutableArray *) trgArray inArray:(NSMutableArray *) inArray;
+(NSMutableArray *)removeBaseTableCellVoFromArrayByCellKey:(NSString *)cellKey dataArray:(NSMutableArray *) dataArray;
+ (BOOL) isEmptyString :(NSString *) instr;
+ (BOOL) isEmptyMap :(NSMutableDictionary *) inMap;
+ (NSString *) trimNSString:(NSString *)inStr;
+ (NSString *)dateToString:(NSDate *)date;
+ (NSString *)dateTimeToString:(NSDate *)date;
+ (NSString *)dateToString:(NSDate *)date dateFormat:(NSString *)dateFormat;
+ (NSString *)dateTimeToString:(NSDate *)date dateFormat:(NSString *)dateFormat;
+ (NSDate *)stringToDate:(NSString *)stringDate;
+ (NSDate *)stringToTime:(NSString *)stringTime;
+(NSString *)getCurrentDate;
+(NSString *)getCurrentYear;
+(NSString *)getCurrentMonth;
+(NSString *)getCurrentDay;
+(NSString *)getCurrentDate:(NSString *) dateFormat;
+(NSString *)nullToNSString:(NSString *) inString;
+ (int) nsstringToInt:(NSString *)nsstring;
+ (NSString *) intToNSString:(int) intValue;
+(BOOL) isFileExists:(NSString *) fileName;
+ (void) alertWithTitle: (NSString *)theTitle msg: (NSString *)msg;
+ (BOOL) isValidDate:(NSString *) strDate;
+ (BOOL) isValidDateTime:(NSString *) strDateTime;
+ (NSDate *)getCurrentNSDate;
+ (NSString *) lpadNumber:(int) number padCount:(int) count;
+(NSString *)nullToString:(char *) cString;
//+(NSString *)encryByISS:(NSString *)iss withFirstid:(NSString *)firstid withPageable:(BOOL)pageable;
+(NSString *)encryByParameterMap:(NSMutableDictionary *)pamDic;
+(int) getIntFromMapByKey:(NSDictionary *) map key:(NSString *)key;
+(NSString *) mapValueToString:(NSDictionary *) map key:(NSString *)key;
+(NSString *) getCurrentUserName;
+(NSString *) dicToJsonString:(NSMutableDictionary *) pamDic;
+ (BOOL)isValidInt:(NSString*)string;
+ (BOOL)isValidFloat:(NSString*)string;
+(NSString *) getDateFromDateTime:(NSString *) dateTimeStr;
+(NSString *) getTimeFromDateTime:(NSString *) dateTimeStr;
+(NSString *)getCurrentTime;
+(NSString *)getCurrentTime:(NSString *)dateFormat;
+(NSString *)getYesterdayDate;
+(NSString *)getThisWeekDay1;
+(NSString *)getThisWeekDay7;
+(NSString *)getThisWeekDay6;
+(NSString *)getThisWeekDay5;
+(NSString *)getThisWeekDay4;
+(NSString *)getThisWeekDay3;
+(NSString *)getThisWeekDay2;

+ (void) alertYesOrNoWithTitle: (NSString *)theTitle msg: (NSString *)msg;
+(NSObject *) getObjectFromURLDicResult:(NSDictionary *) urlDic objKey:(NSString *)objKey;
+(NSString *)getNSStringFromURLDic:(NSDictionary *) urlDic entityName:(NSString *)entityName objKey:(NSString *)objKey;
+(NSArray *)getNSArrayFromURLDic:(NSDictionary *) urlDic entityName:(NSString *)entityName objKey:(NSString *)objKey;
+(NSDictionary *) getEntityFromURLDic:(NSDictionary *) urlDic entityName:(NSString *)entityName ;
+(NSString*)DataTOjsonString:(id)object;
+(BOOL) isContainString:(NSString *) wholeStr subStr:(NSString *)subStr;
+(BOOL) isEmptyArray:(NSArray *) inArray;
+(BOOL) isEmptyObject:(NSObject *) obj;
+(NSString *)getMonthFromNSStringDate:(NSString *) strDate;
+ (void) saveImage:(UIImage *)currentImage withName:(NSString *)fileName;
+ (UIImage *) getImage:(NSString *)fileName;
+(BOOL)deleteImage:(NSString * )fileName;
+ (UIImage *) getImageByImageSid:(NSString *)imgSid;
+ (NSString *) nsIntegerToNSString:(NSInteger) nsIntegerValue;
+(NSString *)getDayFromNSStringDate:(NSString *) strDate;
+ (BOOL)isBlankDictionary:(NSMutableDictionary *)dic;
+ (BOOL)isEmpty:(id)object;
+ (NSString *)getZHCurrentDate;
+(UIActivityViewController *)shareAPP;


// 删除沙盒里的文件
+(void)deleteFile:(int )count;
//得到沙盒文件夹 下的所有文件
+(void)getAllfile:(NSString *)path;

//NSObject转字典
+ (NSDictionary*)getObjectData:(id)obj;
+ (id)getObjectInternal:(id)obj;

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+(NSString *)FirstCharactor:(NSString *)pString;
//生成随机色
+(UIColor *) randomColor;
//获取当前的日期
+(NSString *)getCurrentDatee;
// containsObject方法 去掉重复的元素
+(NSMutableArray *)removeRepeatWithContainObjFunc:(NSArray *)array;
///根据时间获取星期几
+(NSString *)getWeekDayFordate:(NSString *)currentDate;


//时间转时间戳
+(NSString*)getTimeStrWithString:(NSString*)str;
//根据传入的日期获取月份
+(NSString *)getMonthByDate:(NSString *)date;

//+(BBUserModel *)getCurrentUser;
+(NSInteger )increase;

//问题id的递增
+(NSInteger )questionIdIncrease;

//问题id的删除
+(void)deleteQuestionId;

+(NSInteger )categoryIdIncrease;
+(void)deleteCategoryId;

@end
