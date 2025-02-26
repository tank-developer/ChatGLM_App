//
//  TableCollectViewCell.m
//  test
//
//  Created by admin on 2018/7/7.
//  Copyright © 2018年 melon. All rights reserved.
//

#import "TableCollectViewCell.h"
#import "CollectionViewCell.h"
#import "YYCreator.h"

#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

static NSInteger kGridItemNumberOfColumns = 4;
static CGFloat kGridSpace = 4;
static CGFloat kCollectionItemHeight;
static CGSize kCollectionItemSize;

@implementation TableCollectViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createTopLabel];
        self.reuseIdentifier = reuseIdentifier;
        [self settingCollectionViewCellFrame];
        [self createCollectionView];
    }
    return self;
}
-(void)createTopLabel{
    self.topMsglbl = [[UILabel alloc]init];
    [self addSubview:self.topMsglbl];
    self.topMsglbl.textAlignment = NSTextAlignmentCenter;
}
-(void)settingCollectionViewCellFrame{
    kCollectionItemHeight = (WIDTH - (kGridItemNumberOfColumns + 1) * kGridSpace) / kGridItemNumberOfColumns;
    kCollectionItemSize = CGSizeMake(kCollectionItemHeight, kCollectionItemHeight);
}
- (void)createCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    flowLayout.headerReferenceSize = CGSizeMake(30, 45);.
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = kCollectionItemSize;
    flowLayout.minimumLineSpacing = kGridSpace;
    flowLayout.minimumInteritemSpacing = kGridSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(kGridSpace, kGridSpace, kGridSpace, kGridSpace);
    self.myCollectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 250) collectionViewLayout:flowLayout];
    self.myCollectView.backgroundColor = [UIColor yellowColor];
    self.myCollectView.showsVerticalScrollIndicator = NO;
    self.myCollectView.showsHorizontalScrollIndicator = NO;
    self.myCollectView.dataSource = self;
    self.myCollectView.delegate = self;
    //注册cell
    [self.myCollectView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    //注册reusableview（相当于section头部view）
    [self.myCollectView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    self.myCollectView.allowsSelection = YES;
    self.myCollectView.allowsMultipleSelection = NO;
    [self addSubview:self.myCollectView];
    [self.myCollectView setContentInset:UIEdgeInsetsMake(0, 0, 150, 0)];
}

-(void) setCellDataByCellVo:(BaseTableCellVo *) baseTableCellVo{
    [YYCreator setTableCollectTopMsgLblWith:self cellDataDic:baseTableCellVo.cellDataDic];
    self.collectDataDic = baseTableCellVo.dbDic;
}

#pragma mark - tableViewdatasource delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.reuseIdentifier containsString:@"0"]) {
        NSMutableArray *array = [self.collectDataDic objectForKey:@"row1Key"];
        return array.count;
    }else if ([self.reuseIdentifier containsString:@"1"]){
        NSMutableArray *array = [self.collectDataDic objectForKey:@"row2Key"];
        return array.count;
    }else{
        NSMutableArray *array = [self.collectDataDic objectForKey:@"row3Key"];
        return array.count;
    }
    return 0;
}
-( NSInteger )numberOfSectionsInCollectionView:( UICollectionView *)collectionView{
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [NSString stringWithFormat:@"CollectionViewCell"];
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:identifier];
    CollectionViewCell * cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier : identifier forIndexPath :indexPath];
    if ([self.reuseIdentifier containsString:@"0"]) {
        NSMutableArray *array = [self.collectDataDic objectForKey:@"row1Key"];
        NSMutableDictionary *dic = array[indexPath.row];
        cell.iconImageView.image = [UIImage imageNamed:[dic objectForKey:@"iconKey"]];
        cell.bottomLbl.text = [dic objectForKey:@"bottomTitleKey"];
    }else if ([self.reuseIdentifier containsString:@"1"]){
        NSMutableArray *array = [self.collectDataDic objectForKey:@"row2Key"];
        NSMutableDictionary *dic = array[indexPath.row];
        cell.iconImageView.image = [UIImage imageNamed:[dic objectForKey:@"iconKey"]];
        cell.bottomLbl.text = [dic objectForKey:@"bottomTitleKey"];
    }else{
        NSMutableArray *array = [self.collectDataDic objectForKey:@"row3Key"];
        NSMutableDictionary *dic = array[indexPath.row];
        cell.iconImageView.image = [UIImage imageNamed:[dic objectForKey:@"iconKey"]];
        cell.bottomLbl.text = [dic objectForKey:@"bottomTitleKey"];
    }
    return cell;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.topMsglbl.frame = CGRectMake(0, 0, SCREEN_WIDTH, 30);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
