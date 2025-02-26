//
//  HTMLUtil.m
//  TP
//
//  Created by Ted Wu on 13年8月14日.
//  Copyright (c) 2013年 Saint Peng. All rights reserved.
//

#import "SQLCreator.h"
//#import "IconLblValueCell.h"
//#import "GoodsEditableCell.h"
//#import "Comon3LblCell.h"
#import "BaseTableCellVo.h"
#import "CommonUtil.h"

@implementation SQLCreator


+(NSString *) getCreateTableScript:(NSMutableArray *) colArray tableName:(NSString *)tableName{
    if (colArray == nil || tableName == nil) {
        return nil;
    }
    NSMutableString *reStr = [[NSMutableString alloc] init];
    [reStr appendString:@"CREATE TABLE IF NOT EXISTS  "];
    [reStr appendString:tableName];
    [reStr appendString:@"(SID INTEGER PRIMARY KEY, IS_DELETED INTEGER"];
    for (int idx=0; idx<[colArray count]; idx++) {
        NSMutableDictionary *map = [colArray objectAtIndex:idx];
        [reStr appendString:@", "];
        [reStr appendString:[map objectForKey:@"name"]];
        [reStr appendString:@"  "]; 
        [reStr appendString:[map objectForKey:@"properties"]];
    }
    [reStr appendString:@")"];
    return reStr;
}

+(void)addCreateTableColumnToArray:(NSMutableArray *) tableArray name:(NSString *)name properties:(NSString *) properties{
    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
    [map setObject:name forKey:@"name"];
    [map setObject:properties forKey:@"properties"];
    [tableArray addObject:map];
}

+(void)addInsertTextColumnToArray:(NSMutableArray *) insertArray columnName:(NSString *)columnName columnValue:(NSString *) columnValue{
    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
    [map setObject:columnName forKey:@"columnName"];
    [map setObject:columnValue forKey:@"columnValue"];
    [map setObject:@"TEXT" forKey:@"columnType"];
    [insertArray addObject:map];
}

+(void)addInsertIntegerColumnToArray:(NSMutableArray *) insertArray columnName:(NSString *)columnName columnValue:(NSString *) columnValue{
    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
    [map setObject:columnName forKey:@"columnName"];
    [map setObject:columnValue forKey:@"columnValue"];
    [map setObject:@"INTEGER" forKey:@"columnType"];
    [insertArray addObject:map];
}

+(NSString *) getInsertSQLByArray:(NSMutableArray *) insertArray tableName:(NSString *)tableName sid:(NSString *) sid{ 
    NSMutableString *columnStr = [[NSMutableString alloc] init];
    NSMutableString *valueStr = [[NSMutableString alloc] init];
    for (int idx=0; idx<[insertArray count]; idx++) {
        NSMutableDictionary *dic = [insertArray objectAtIndex:idx];
        [columnStr appendString:@","];
        [columnStr appendString:[dic objectForKey:@"columnName"]];
        // NSLog(@"columnName == %@", [dic objectForKey:@"columnName"]);
        [valueStr appendString:@","];
        if ([@"TEXT" isEqualToString:[dic objectForKey:@"columnType"]]) {
            [valueStr appendString:@"'"];
            if ([[dic objectForKey:@"columnValue"] isKindOfClass:[NSString class]]) {
                [valueStr appendString:[dic objectForKey:@"columnValue"] ];
            }else{
                [valueStr appendString:[[dic objectForKey:@"columnValue"] stringValue]];
            }
            [valueStr appendString:@"'"];
        }else if ([@"INTEGER" isEqualToString:[dic objectForKey:@"columnType"]]) {
            if ([[dic objectForKey:@"columnValue"] isKindOfClass:[NSString class]]) {
                [valueStr appendString:[dic objectForKey:@"columnValue"] ];
            }else{
                [valueStr appendString:[[dic objectForKey:@"columnValue"] stringValue]];
            }
        }
    }
    NSMutableString *sql =[[NSMutableString alloc] init]; 
    [sql appendString:@"INSERT OR REPLACE INTO "];
    [sql appendString:tableName];
    [sql appendString:@"(SID, IS_DELETED"];
    [sql appendString:columnStr];
    [sql appendString:@") VALUES ("];
    [sql appendString:sid];
    [sql appendString:@", 0"];
    [sql appendString:valueStr];
    [sql appendString:@")"];
    return sql;
}

@end
