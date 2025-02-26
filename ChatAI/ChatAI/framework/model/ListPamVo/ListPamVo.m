

#import "ListPamVo.h"
#import "CommonUtil.h"

@interface ListPamVo ()


@end

@implementation ListPamVo

- (instancetype)init
{
    self = [super init];
    return self;
}

- (instancetype)init:(NSString *)pageable firstId:(NSString *)firstId pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize{
    self = [super init];
    self.pageable=pageable;
    self.firstId=firstId;
    self.pageNo=pageNo;
    self.pageSize=pageSize;
    return self;
}
 
-(void)increasePageNo{
    if (self.pageNo == nil) {
        self.pageNo=@"1";
    }else{
        int currentPageNo = [CommonUtil nsstringToInt:self.pageNo];
        self.pageNo = [CommonUtil intToNSString:currentPageNo+1];
    }
}

-(void) resetToFirstPage{
    self.pageable=@"1";
    self.firstId=@"";
    self.pageNo=@"1";
}

-(void) setToNextPage{
    if (!self.lastPage) {
        [self increasePageNo];
    } 
}

-(NSMutableDictionary *) setPamVoValueToDic:(NSMutableDictionary *) pamDic{
    if (pamDic == nil) {
        pamDic = [[NSMutableDictionary alloc] init];
    }
    //NSLog(@"setPamVoValueToDic start****");
    [pamDic setObject:[CommonUtil nullToNSString:self.pageable] forKey:@"pageable"];
    [pamDic setObject:[CommonUtil nullToNSString:self.firstId]  forKey:@"firstId"];
    [pamDic setObject:[CommonUtil nullToNSString:self.pageNo]  forKey:@"pageNo"];
    [pamDic setObject:[CommonUtil nullToNSString:self.pageSize]  forKey:@"pageSize"];
    //NSLog(@"setPamVoValueToDic end****");
    return pamDic;
}

-(void) setPamVoValueByDic:(NSDictionary *)urlDic jsonListName:(NSString *)jsonListName{
    //IWLog(@"**********************");

    //NSData *jsonData = [NSJSONSerialization dataWithJSONObject:urlDic options:0 // Pass 0 if you don't care about the readability of the generated string error:nil];
    //NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //IWLog(jsonString);
    //IWLog(@"**********************");
//    NSLog(@"urlDic:%@",urlDic);
    if (urlDic == nil) {
        NSLog(@"setPamVoValueByDic Error, urlDic == nil");
        return ;
    }
    NSDictionary *rstDic= [urlDic objectForKey:@"result"];
    if (rstDic == nil) {
        NSLog(@"setPamVoValueByDic Error, result Dic == nil");
        return ;
    }
    if (jsonListName== nil  ) {
        NSLog(@"setPamVoValueByDic error,jsonListName== nil");
        return ;
    }
    NSDictionary *jsonDic = [rstDic objectForKey:jsonListName];
    NSLog(@"jsonDic:%@",jsonDic);
    if (jsonDic == nil) {
        NSLog(@"setPamVoValueByDic Error, jsonDic for List Dic == nil, jsonListName==%@",jsonListName);
        return;
    }
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    self.number =  [numberFormatter stringFromNumber:[jsonDic objectForKey:@"number"]];
    self.size = [numberFormatter stringFromNumber:[jsonDic objectForKey:@"size"]];
    self.numberOfElements = [numberFormatter stringFromNumber:[jsonDic objectForKey:@"numberOfElements"]];
    self.lastPage = [[jsonDic objectForKey:@"lastPage"] boolValue];
    self.firstPage = [[jsonDic objectForKey:@"firstPage"] boolValue];
    self.totalElements = [numberFormatter stringFromNumber:[jsonDic objectForKey:@"totalElements"]];
    self.totalPages = [numberFormatter stringFromNumber:[jsonDic objectForKey:@"totalPages"]];
    self.pageNo=self.number;
    self.pageSize=self.size;
    numberFormatter=nil;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
