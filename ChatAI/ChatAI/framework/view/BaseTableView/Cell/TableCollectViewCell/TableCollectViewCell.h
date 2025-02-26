//
//  TableCollectViewCell.h
//  test
//
//  Created by admin on 2018/7/7.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "BaseTableCell.h"

@interface TableCollectViewCell : BaseTableCell<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *myCollectView;
@property (nonatomic,strong)UILabel *topMsglbl;
@property (nonatomic,strong)NSMutableDictionary *collectDataDic;
@property (nonatomic,copy)NSString *reuseIdentifier;
@end
