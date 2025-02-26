//
//  YYCreator.h
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableCellVo.h"
#import "TableCollectViewCell.h"
#import "MessageFrameModel.h"

@interface YYCreator : NSObject
+  (BaseTableCellVo *) createIconCellVo:(NSString*) cellName cellIcon:(NSString *) cellIcon cellLabel:(NSString *) cellLabel cellValue:(NSString *)cellValue dbDic:(NSMutableDictionary *) dbDic;
+  (NSMutableDictionary *) createCommon3LblCellViewMap:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3;
+  (BaseTableCellVo *) createCommon3LblCellVo:(NSString*) cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3 dbDic:(NSMutableDictionary *) dbDic;
+(BaseTableCellVo *)createIconCellVo:(NSString *)cellName cellIcon:(NSString *)cellIcon cellLabel:(NSString *)cellLabel cellValue:(NSString *)cellValue cellBtnValue:(NSString *)cellBtnValue dbDic:(NSMutableDictionary *)dbDic;
+  (BaseTableCellVo *) createCommon5BtnAndIconCellVo:(NSString*) cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 icon:(NSString *)icon bannerImageArray:(NSMutableArray *)bannerImageArray dbDic:(NSMutableDictionary *) dbDic;
+  (BaseTableCellVo *) createCommon2LblCellVo:(NSString*) cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 dbDic:(NSMutableDictionary *) dbDic;
+  (BaseTableCellVo *) createCommon5LblCellVo:(NSString*) cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 dbDic:(NSMutableDictionary *) dbDic;
+  (BaseTableCellVo *) createCollectViewCellCellVo:(NSString*) cellName collectViewCellArray:(NSMutableArray *)collectViewCellArray dbDic:(NSMutableDictionary *) dbDic;
+(BaseTableCellVo *)createCommon11LblCellVo:(NSString *)cellName lbl1:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(NSString *)lbl11 dbDic:(NSMutableDictionary *) dbDic;
+  (BaseTableCellVo *) createCommon3ObjCellVo:(NSString*) cellName obj1:(id) obj1 obj2:(id) obj2 obj3:(id)obj3 dbDic:(NSMutableDictionary *) dbDic;

+ (NSMutableDictionary *)setTableCollectTopMsgLblWith:(TableCollectViewCell *)cell cellDataDic:(NSMutableDictionary *) cellDataDic;
+(BaseTableCellVo *)createCommon12LblCellVo:(NSString *)cellName lbl1:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(NSString *)lbl11 lbl12:(NSString *)lbl12 dbDic:(NSMutableDictionary *) dbDic;

+(BaseTableCellVo *)createCommon11LblAndModelCellVo:(NSString *)cellName lbl1:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(MessageFrameModel *)model dbDic:(NSMutableDictionary *) dbDic;


@end
