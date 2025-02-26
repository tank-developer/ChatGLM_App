//
//  HTMLUtil.h
//  TP
//
//  Created by Ted Wu on 13年8月14日.
//  Copyright (c) 2013年 Saint Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "IconLblValueCell.h"
//#import "GoodsEditableCell.h"
//#import "Comon3LblCell.h"

@interface SQLCreator : NSObject{
    
}
+(NSString *) getCreateTableScript:(NSMutableArray *) colArray tableName:(NSString *)tableName;
+(NSString *) getInsertSQLByArray:(NSMutableArray *) insertArray tableName:(NSString *)tableName sid:(NSString *) sid;
+(void)addCreateTableColumnToArray:(NSMutableArray *) tableArray name:(NSString *)name properties:(NSString *) properties;
+(void)addInsertTextColumnToArray:(NSMutableArray *) insertArray columnName:(NSString *)columnName columnValue:(NSString *) columnValue;
+(void)addInsertIntegerColumnToArray:(NSMutableArray *) insertArray columnName:(NSString *)columnName columnValue:(NSString *) columnValue;
@end
