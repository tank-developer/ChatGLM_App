//
//  AICategoryView.m
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "AICategoryView.h"
#import "AICategoryCell.h"

@implementation AICategoryView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
            flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//            flowLayout.itemSize = cgsiz;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.minimumLineSpacing = 10;
        flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 44);
        // 创建 UICollectionView 并设置其尺寸和位置
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
        
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerClass:[AICategoryCell class] forCellWithReuseIdentifier:@"AICategoryCell"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        
      [self addSubview:self.collectionView];
    
    }
    return self;
}



@end
