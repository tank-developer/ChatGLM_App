//
//  YYCreator.m
//  test
//
//  Created by admin on 2018/6/29.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "YYCreator.h"

@implementation YYCreator
+  (BaseTableCellVo *) createIconCellVo:(NSString*) cellName cellIcon:(NSString *) cellIcon cellLabel:(NSString *) cellLabel cellValue:(NSString *)cellValue dbDic:(NSMutableDictionary *) dbDic
{
    NSMutableDictionary *cellVoDic = [YYCreator createIconCellViewMap:cellIcon cellLabel:cellLabel cellValue:cellValue];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    return cellVo;
}
+(BaseTableCellVo *)createIconCellVo:(NSString *)cellName cellIcon:(NSString *)cellIcon cellLabel:(NSString *)cellLabel cellValue:(NSString *)cellValue cellBtnValue:(NSString *)cellBtnValue dbDic:(NSMutableDictionary *)dbDic{
    NSMutableDictionary *cellVoDic = [YYCreator createIconCellViewMap:cellIcon cellLabel:cellLabel cellValue:cellValue cellBtnValue:cellBtnValue];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    return cellVo;
}

+  (NSMutableDictionary *) createIconCellViewMap:(NSString *) cellIcon cellLabel:(NSString *) cellLabel cellValue:(NSString *)cellValue cellBtnValue:(NSString *)cellBtnValue{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:cellIcon forKey:@"cellIcon"  ];
    [hallMap setValue:cellLabel  forKey:@"cellLabel" ];
    [hallMap setValue:cellValue  forKey:@"cellValue" ];
    [hallMap setValue:cellBtnValue  forKey:@"cellBtnValue" ];
    return hallMap;
}
+  (NSMutableDictionary *) createIconCellViewMap:(NSString *) cellIcon cellLabel:(NSString *) cellLabel cellValue:(NSString *)cellValue
{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:cellIcon forKey:@"cellIcon"  ];
    [hallMap setValue:cellLabel  forKey:@"cellLabel" ];
    [hallMap setValue:cellValue  forKey:@"cellValue" ];
    return hallMap;
}
+  (NSMutableDictionary *) createCommon3LblCellViewMap:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3
{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:lbl1  forKey:@"btn1" ];
    [hallMap setValue:lbl2  forKey:@"btn2" ];
    [hallMap setValue:lbl3  forKey:@"btn3" ];
    return hallMap;
}

+ (NSMutableDictionary *)setTableCollectTopMsgLblWith:(TableCollectViewCell *)cell cellDataDic:(NSMutableDictionary *) cellDataDic{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    cell.topMsglbl.text = [cellDataDic objectForKey:@"cellValue"];
    return hallMap;
}
+  (BaseTableCellVo *) createCommon3LblCellVo:(NSString*) cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3 dbDic:(NSMutableDictionary *) dbDic
{
    NSMutableDictionary *cellVoDic = [YYCreator createCommon3LblCellViewMap:lbl1 lbl2:lbl2 lbl3:lbl3];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    return cellVo;
}
+  (BaseTableCellVo *) createCommon2LblCellVo:(NSString*) cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 dbDic:(NSMutableDictionary *) dbDic{
    NSMutableDictionary *cellVoDic = [YYCreator createCommon2LblCellViewMap:lbl1 lbl2:lbl2];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    return cellVo;
}
+  (BaseTableCellVo *) createCollectViewCellCellVo:(NSString*) cellName collectViewCellArray:(NSMutableArray *)collectViewCellArray dbDic:(NSMutableDictionary *) dbDic{
    NSMutableDictionary *cellVoDic = [YYCreator createCollectViewCellCellViewMap:cellName collectViewCellArray:collectViewCellArray];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    return cellVo;
}
+  (NSMutableDictionary *) createCollectViewCellCellViewMap:(NSString *) lbl1 collectViewCellArray:(NSMutableArray *)collectViewCellArray
{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:lbl1  forKey:@"btn1" ];
    [hallMap setObject:collectViewCellArray forKey:@"collectViewCellArray"];
    return hallMap;
}

+  (BaseTableCellVo *) createCommon5LblCellVo:(NSString*) cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 dbDic:(NSMutableDictionary *) dbDic{
    NSMutableDictionary *cellVoDic = [YYCreator createCommon5LblCellViewMap:lbl1 lbl2:lbl2 lbl3:lbl3 lbl4:lbl4 lbl5:lbl5];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    cellVo.isEditable = @"YES";
    return cellVo;
}

+  (NSMutableDictionary *) createCommon5LblCellViewMap:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:lbl1  forKey:@"btn1" ];
    [hallMap setValue:lbl2  forKey:@"btn2" ];
    [hallMap setValue:lbl3  forKey:@"btn3" ];
    [hallMap setValue:lbl4  forKey:@"btn4" ];
    [hallMap setValue:lbl5  forKey:@"btn5" ];
    return hallMap;
}
+(BaseTableCellVo *)createCommon11LblCellVo:(NSString *)cellName lbl1:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(NSString *)lbl11 dbDic:(NSMutableDictionary *) dbDic{
    NSMutableDictionary *cellVoDic = [YYCreator createCommon11LblCellViewMap:lbl1 lbl2:lbl2 lbl3:lbl3 lbl4:lbl4 lbl5:lbl5 lbl6:lbl6 lbl7:lbl7 lbl8:lbl8 lbl9:lbl9 lbl10:lbl10 lbl11:lbl11];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
//    cellVo.isEditable = @"YES";
    return cellVo;
}
+(BaseTableCellVo *)createCommon11LblAndModelCellVo:(NSString *)cellName lbl1:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(MessageFrameModel *)model dbDic:(NSMutableDictionary *) dbDic{
    NSMutableDictionary *cellVoDic = [YYCreator createCommon11LblAndModelCellViewMap:lbl1 lbl2:lbl2 lbl3:lbl3 lbl4:lbl4 lbl5:lbl5 lbl6:lbl6 lbl7:lbl7 lbl8:lbl8 lbl9:lbl9 lbl10:lbl10 lbl11:model];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
//    cellVo.isEditable = @"YES";
    return cellVo;
}
+(BaseTableCellVo *)createCommon12LblCellVo:(NSString *)cellName lbl1:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(NSString *)lbl11 lbl12:(NSString *)lbl12 dbDic:(NSMutableDictionary *) dbDic{
    NSMutableDictionary *cellVoDic = [YYCreator createCommon12LblCellViewMap:lbl1 lbl2:lbl2 lbl3:lbl3 lbl4:lbl4 lbl5:lbl5 lbl6:lbl6 lbl7:lbl7 lbl8:lbl8 lbl9:lbl9 lbl10:lbl10 lbl11:lbl11 lbl12:lbl12];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    cellVo.isEditable = @"YES";
    return cellVo;
}


+  (BaseTableCellVo *) createCommon3ObjCellVo:(NSString*) cellName obj1:(id) obj1 obj2:(id) obj2 obj3:(id)obj3 dbDic:(NSMutableDictionary *) dbDic
{
    NSMutableDictionary *cellVoDic = [YYCreator createCommon3ObjCellViewMap:obj1 obj2:obj2 obj3:obj3];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    return cellVo;
}

+  (NSMutableDictionary *) createCommon3ObjCellViewMap:(id)obj1 obj2:(id)obj2 obj3:(id)obj3
{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setObject:obj1  forKey:@"obj1" ];
    [hallMap setObject:obj2  forKey:@"obj2" ];
    [hallMap setObject:obj3  forKey:@"obj3" ];
    return hallMap;
}


+(NSMutableDictionary *)createCommon11LblCellViewMap:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(NSString *)lbl11{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:lbl1  forKey:@"lbl1"];
    [hallMap setValue:lbl2  forKey:@"lbl2"];
    [hallMap setValue:lbl3  forKey:@"lbl3"];
    [hallMap setValue:lbl4  forKey:@"lbl4"];
    [hallMap setValue:lbl5  forKey:@"lbl5"];
    [hallMap setValue:lbl6  forKey:@"lbl6"];
    [hallMap setValue:lbl7  forKey:@"lbl7"];
    [hallMap setValue:lbl8  forKey:@"lbl8"];
    [hallMap setValue:lbl9  forKey:@"lbl9"];
    [hallMap setValue:lbl10  forKey:@"lbl10"];
    [hallMap setValue:lbl11  forKey:@"lbl11"];
    return hallMap;
}
+(NSMutableDictionary *)createCommon11LblAndModelCellViewMap:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(MessageFrameModel *)model{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:lbl1  forKey:@"lbl1"];
    [hallMap setValue:lbl2  forKey:@"lbl2"];
    [hallMap setValue:lbl3  forKey:@"lbl3"];
    [hallMap setValue:lbl4  forKey:@"lbl4"];
    [hallMap setValue:lbl5  forKey:@"lbl5"];
    [hallMap setValue:lbl6  forKey:@"lbl6"];
    [hallMap setValue:lbl7  forKey:@"lbl7"];
    [hallMap setValue:lbl8  forKey:@"lbl8"];
    [hallMap setValue:lbl9  forKey:@"lbl9"];
    [hallMap setValue:lbl10  forKey:@"lbl10"];
    [hallMap setObject:model  forKey:@"lbl11"];
    return hallMap;
}

+(NSMutableDictionary *)createCommon12LblCellViewMap:(NSString *)lbl1 lbl2:(NSString *)lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 lbl6:(NSString *)lbl6 lbl7:(NSString *)lbl7 lbl8:(NSString *)lbl8 lbl9:(NSString *)lbl9 lbl10:(NSString *)lbl10 lbl11:(NSString *)lbl11 lbl12:(NSString *)lbl12{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:lbl1  forKey:@"lbl1"];
    [hallMap setValue:lbl2  forKey:@"lbl2"];
    [hallMap setValue:lbl3  forKey:@"lbl3"];
    [hallMap setValue:lbl4  forKey:@"lbl4"];
    [hallMap setValue:lbl5  forKey:@"lbl5"];
    [hallMap setValue:lbl6  forKey:@"lbl6"];
    [hallMap setValue:lbl7  forKey:@"lbl7"];
    [hallMap setValue:lbl8  forKey:@"lbl8"];
    [hallMap setValue:lbl9  forKey:@"lbl9"];
    [hallMap setValue:lbl10  forKey:@"lbl10"];
    [hallMap setValue:lbl11  forKey:@"lbl11"];
    [hallMap setValue:lbl12  forKey:@"lbl12"];
    return hallMap;
}


//+(NSMutableDictionary *)setCommon11LblViewMap:(MyOrderListCell *)cell cellDataDic:(NSMutableDictionary *)cellDataDic{
//    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
//    cell.lbl1.text = [cellDataDic objectForKey:@"lbl1"];
//    cell.lbl2.text = [cellDataDic objectForKey:@"lbl2"];
//    cell.lbl3.text = [cellDataDic objectForKey:@"lbl3"];
//    cell.lbl4.text = [cellDataDic objectForKey:@"lbl4"];
//    cell.lbl5.text = [cellDataDic objectForKey:@"lbl5"];
//    cell.lbl6.text = [cellDataDic objectForKey:@"lbl6"];
//    cell.lbl7.text = [cellDataDic objectForKey:@"lbl7"];
//    cell.lbl8.text = [cellDataDic objectForKey:@"lbl8"];
//    cell.lbl9.text = [cellDataDic objectForKey:@"lbl9"];
//    cell.lbl10.text = [cellDataDic objectForKey:@"lbl10"];
//    cell.lbl11.text = [cellDataDic objectForKey:@"lbl11"];
//    return hallMap;
//}

//+(NSMutableDictionary *)setCommon5BtnViewMap:(ComonBtnCell *)cell cellDataDic:(NSMutableDictionary *)cellDataDic{
//    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
//    [cell.btn1 setTitle:[cellDataDic objectForKey:@"btn1"] forState:UIControlStateNormal];
//    [cell.btn2 setTitle:[cellDataDic objectForKey:@"btn2"] forState:UIControlStateNormal];
//    [cell.btn3 setTitle:[cellDataDic objectForKey:@"btn3"] forState:UIControlStateNormal];
//    [cell.btn4 setTitle:[cellDataDic objectForKey:@"btn4"] forState:UIControlStateNormal];
//    [cell.btn5 setTitle:[cellDataDic objectForKey:@"btn5"] forState:UIControlStateNormal];
//    return hallMap;
//}

+  (NSMutableDictionary *) createCommon2LblCellViewMap:(NSString *) lbl1 lbl2:(NSString *) lbl2
{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:lbl1  forKey:@"btn1" ];
    [hallMap setValue:lbl2  forKey:@"btn2" ];
    return hallMap;
}

//+(NSMutableDictionary *)setCommon3BtnViewMap:(LoginBtnCell *)cell cellDataDic:(NSMutableDictionary *)cellDataDic{
//    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
//    [cell.btn1 setTitle:[cellDataDic objectForKey:@"btn1"] forState:UIControlStateNormal];
//    [cell.btn2 setTitle:[cellDataDic objectForKey:@"btn2"] forState:UIControlStateNormal];
//    [cell.btn3 setTitle:[cellDataDic objectForKey:@"btn3"] forState:UIControlStateNormal];
//    return hallMap;
//}
//+(NSMutableDictionary *)setCommon2BtnViewMap:(ComonBtnCell *)cell cellDataDic:(NSMutableDictionary *)cellDataDic{
//    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
//    [cell.btn1 setTitle:[cellDataDic objectForKey:@"btn1"] forState:UIControlStateNormal];
//    [cell.btn2 setTitle:[cellDataDic objectForKey:@"btn2"] forState:UIControlStateNormal];
//    return hallMap;
//}

+  (BaseTableCellVo *) createCommon5BtnAndIconCellVo:(NSString*) cellName lbl1:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 icon:(NSString *)icon bannerImageArray:(NSMutableArray *)bannerImageArray dbDic:(NSMutableDictionary *) dbDic
{
    NSMutableDictionary *cellVoDic = [YYCreator createCommon5BtnAndIconLblCellViewMap:lbl1 lbl2:lbl2 lbl3:lbl3 lbl4:lbl4 lbl5:lbl5 icon:icon bannerImageArray:bannerImageArray];
    BaseTableCellVo *cellVo = [[BaseTableCellVo alloc] init:cellName cellDataDic:cellVoDic dbDic:dbDic];
    return cellVo;
}

+  (NSMutableDictionary *) createCommon5BtnAndIconLblCellViewMap:(NSString *) lbl1 lbl2:(NSString *) lbl2 lbl3:(NSString *)lbl3 lbl4:(NSString *)lbl4 lbl5:(NSString *)lbl5 icon:(NSString *)icon bannerImageArray:(NSMutableArray *)bannerImageArray{
    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
    [hallMap setValue:lbl1  forKey:@"btn1" ];
    [hallMap setValue:lbl2  forKey:@"btn2" ];
    [hallMap setValue:lbl3  forKey:@"btn3" ];
    [hallMap setValue:lbl4  forKey:@"btn4" ];
    [hallMap setValue:lbl5  forKey:@"btn5" ];
    [hallMap setValue:icon  forKey:@"headerImage" ];
    [hallMap setValue:bannerImageArray  forKey:@"bannerImageArray"];
    return hallMap;
}
//+(NSMutableDictionary *)setCommon5BtnAndIconViewMap:(IconBtn5Cell *)cell cellDataDic:(NSMutableDictionary *)cellDataDic{
//    NSMutableDictionary *hallMap = [[NSMutableDictionary alloc] init];
//    [cell.btn1 setTitle:[cellDataDic objectForKey:@"btn1"] forState:UIControlStateNormal];
//    [cell.btn2 setTitle:[cellDataDic objectForKey:@"btn2"] forState:UIControlStateNormal];
//    [cell.btn3 setTitle:[cellDataDic objectForKey:@"btn3"] forState:UIControlStateNormal];
//    [cell.btn4 setTitle:[cellDataDic objectForKey:@"btn4"]  forState:UIControlStateNormal ];
//    [cell.btn5 setTitle:[cellDataDic objectForKey:@"btn5"]  forState:UIControlStateNormal ];
//    NSMutableArray *imageArray = [cellDataDic objectForKey:@"bannerImageArray"];
//    NSMutableDictionary *imageDic0 = imageArray[0];
//    NSMutableDictionary *imageDic1 = imageArray[1];
//    NSMutableDictionary *imageDic2 = imageArray[2];
//
//    [cell.image1 sd_setImageWithURL:[NSURL URLWithString:[imageDic0 objectForKey:@"img"]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"error:%@,image:%@",error.debugDescription,image);
//    }];
//    [cell.image2 sd_setImageWithURL:[NSURL URLWithString:[imageDic1 objectForKey:@"img"]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"error:%@,image:%@",error.debugDescription,image);
//    }];
//    [cell.image3 sd_setImageWithURL:[NSURL URLWithString:[imageDic2 objectForKey:@"img"]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"error:%@,image:%@",error.debugDescription,image);
//    }];
//    return hallMap;
//}




@end
