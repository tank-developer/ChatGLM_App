

#import <UIKit/UIKit.h>
#import "BaseVo.h"

@interface ListPamVo : NSObject

@property (nonatomic, strong) NSString *pageable;
@property (nonatomic, strong) NSString *firstId;
@property (nonatomic, strong) NSString *pageNo;
@property (nonatomic, strong) NSString *pageSize;


@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *numberOfElements;
@property (nonatomic) Boolean lastPage;
@property (nonatomic) Boolean firstPage;
@property (nonatomic, strong) NSString *totalElements;
@property (nonatomic, strong) NSString *totalPages;


-(void) resetToFirstPage;
-(void) setToNextPage;
- (instancetype)init:(NSString *)pageable firstId:(NSString *)firstId pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;
-(NSMutableDictionary *) setPamVoValueToDic:(NSMutableDictionary *) pamDic;
-(void) setPamVoValueByDic:(NSDictionary *)urlDic jsonListName:(NSString *)jsonListName;
@end
