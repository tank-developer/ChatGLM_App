


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
