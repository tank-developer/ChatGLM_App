//
//  AICategoryVC.m
//  ChatAI
//
//  Created by Apple on 2023/7/29.
//

#import "AICategoryVC.h"
#import "AICategoryCell.h"
#import "AIHistoryVC.h"
#import "AICategoryChatVC.h"
#import "AICategoryWorkVC.h"
#import "AITranslateVC.h"

@interface AICategoryVC ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic,strong)NSMutableArray *datasource;
@property (nonatomic,strong)NSMutableArray *section0Datasource;
@property (nonatomic,strong)NSMutableArray *section1Datasource;
@property (nonatomic,strong)NSMutableArray *section2Datasource;
@end

@implementation AICategoryVC

-(NSMutableArray *)section1Datasource{
    if(!_section1Datasource){
        _section1Datasource = [NSMutableArray new];
        NSMutableDictionary *dic0 = [NSMutableDictionary new];
        [dic0 setObject:@"演讲稿" forKey:@"text"];
        [dic0 setObject:@"people-speak" forKey:@"img"];
        
        NSMutableDictionary *dic1 = [NSMutableDictionary new];
        [dic1 setObject:@"文案" forKey:@"text"];
        [dic1 setObject:@"text" forKey:@"img"];
        
        NSMutableDictionary *dic2 = [NSMutableDictionary new];
        [dic2 setObject:@"广告" forKey:@"text"];
        [dic2 setObject:@"ad" forKey:@"img"];
        
        NSMutableDictionary *dic3 = [NSMutableDictionary new];
        [dic3 setObject:@"检讨书" forKey:@"text"];
        [dic3 setObject:@"enquire" forKey:@"img"];
        
        NSMutableDictionary *dic4 = [NSMutableDictionary new];
        [dic4 setObject:@"总结" forKey:@"text"];
        [dic4 setObject:@"merge" forKey:@"img"];
        
        NSMutableDictionary *dic5 = [NSMutableDictionary new];
        [dic5 setObject:@"报告" forKey:@"text"];
        [dic5 setObject:@"report" forKey:@"img"];
        
        NSMutableDictionary *dic6 = [NSMutableDictionary new];
        [dic6 setObject:@"日报" forKey:@"text"];
        [dic6 setObject:@"log" forKey:@"img"];
        
        NSMutableDictionary *dic7 = [NSMutableDictionary new];
        [dic7 setObject:@"月报" forKey:@"text"];
        [dic7 setObject:@"moon" forKey:@"img"];
        
        NSMutableDictionary *dic8 = [NSMutableDictionary new];
        [dic8 setObject:@"节日祝福语" forKey:@"text"];
        [dic8 setObject:@"xingfuli" forKey:@"img"];
        
        NSMutableDictionary *dic9 = [NSMutableDictionary new];
        [dic9 setObject:@"取名" forKey:@"text"];
        [dic9 setObject:@"" forKey:@"img"];
        
        NSMutableDictionary *dic10 = [NSMutableDictionary new];
        [dic10 setObject:@"法律文书" forKey:@"text"];
        [dic10 setObject:@"" forKey:@"img"];
        [_section1Datasource addObject:dic0];
        [_section1Datasource addObject:dic1];
        [_section1Datasource addObject:dic2];
        [_section1Datasource addObject:dic3];
        [_section1Datasource addObject:dic4];
        [_section1Datasource addObject:dic5];
        [_section1Datasource addObject:dic6];
        [_section1Datasource addObject:dic7];
        [_section1Datasource addObject:dic8];
    }
    return _section1Datasource;
}

-(NSMutableArray *)section0Datasource{
    if(!_section0Datasource){
        _section0Datasource = [NSMutableArray new];
        NSMutableDictionary *dic11 = [NSMutableDictionary new];
        [dic11 setObject:@"历史聊天记录" forKey:@"text"];
        [dic11 setObject:@"history" forKey:@"img"];
        [_section0Datasource addObject:dic11];
    }
    return _section0Datasource;
}
-(NSMutableArray *)section2Datasource{
    if(!_section2Datasource){
        _section2Datasource = [NSMutableArray new];
        NSMutableDictionary *dic12 = [NSMutableDictionary new];
        [dic12 setObject:@"英文翻译" forKey:@"text"];
        [dic12 setObject:@"english" forKey:@"img"];
        
        NSMutableDictionary *dic13 = [NSMutableDictionary new];
        [dic13 setObject:@"日文翻译" forKey:@"text"];
        [dic13 setObject:@"round" forKey:@"img"];
        
        NSMutableDictionary *dic14 = [NSMutableDictionary new];
        [dic14 setObject:@"法语翻译" forKey:@"text"];
        [dic14 setObject:@"eiffel-tower" forKey:@"img"];
        
        NSMutableDictionary *dic15 = [NSMutableDictionary new];
        [dic15 setObject:@"韩语翻译" forKey:@"text"];
        [dic15 setObject:@"baseball-cap" forKey:@"img"];
        
        NSMutableDictionary *dic16 = [NSMutableDictionary new];
        [dic16 setObject:@"俄语翻译" forKey:@"text"];
        [dic16 setObject:@"bear" forKey:@"img"];
        
        NSMutableDictionary *dic17 = [NSMutableDictionary new];
        [dic17 setObject:@"越南语翻译" forKey:@"text"];
        [dic17 setObject:@"straw-hat" forKey:@"img"];
        
        NSMutableDictionary *dic18 = [NSMutableDictionary new];
        [dic18 setObject:@"泰语翻译" forKey:@"text"];
        [dic18 setObject:@"taj-mahal" forKey:@"img"];
        
        [_section2Datasource addObject:dic12];
        [_section2Datasource addObject:dic13];
        [_section2Datasource addObject:dic14];
        [_section2Datasource addObject:dic15];
        [_section2Datasource addObject:dic16];
        [_section2Datasource addObject:dic17];
        [_section2Datasource addObject:dic18];
    }
    return _section2Datasource;
}


- (void)initBaseVo{
    self.categoryVo = [[AICategoryVo alloc] init];
}
-(void)initBaseView{
    self.categoryView = [[AICategoryView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [super initBaseView:self.categoryView];
    self.categoryVo = [[AICategoryVo alloc] initByDic:[NSMutableDictionary new]];
    self.categoryView.collectionView.dataSource = self;
    self.categoryView.collectionView.delegate = self;
    self.categoryView.collectionView.backgroundColor = [UIColor blackColor];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0){
        return self.section0Datasource.count;
    }else if (section == 1){
        return self.section1Datasource.count;
    }else if (section == 2){
        return self.section2Datasource.count;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AICategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AICategoryCell" forIndexPath:indexPath];
    // 设置每个单元格的内容
    if(indexPath.section == 0){
        NSMutableDictionary *did = [self.section0Datasource objectAtIndex:indexPath.row];
        cell.titleLb.text = [did objectForKey:@"text"];
        cell.icon.image = [UIImage imageNamed:[did objectForKey:@"img"]];
        return cell;
    }else if (indexPath.section == 1){
        NSMutableDictionary *did = [self.section1Datasource objectAtIndex:indexPath.row];
        cell.titleLb.text = [did objectForKey:@"text"];
        cell.icon.image = [UIImage imageNamed:[did objectForKey:@"img"]];
        return cell;
    }else{
        NSMutableDictionary *did = [self.section2Datasource objectAtIndex:indexPath.row];
        cell.titleLb.text = [did objectForKey:@"text"];
        cell.icon.image = [UIImage imageNamed:[did objectForKey:@"img"]];
        return cell;
    }
    return cell;
}
//配置每个item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}

//配置item的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 0, 20);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;

    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        UILabel *lbl = [UILabel new];
        lbl.backgroundColor = [UIColor blackColor];
        lbl.font = [UIFont systemFontOfSize:18];
        lbl.frame = CGRectMake(20, headerView.frame.size.height/2-44/2, 200, 44);
        [headerView addSubview:lbl];
        if(indexPath.section == 0){
            lbl.text = @"常用";
        }else if (indexPath.section == 1){
            lbl.text = @"工具箱";
        }else{
            lbl.text = @"翻译";
        }
        reusableview = headerView;
    }
    return reusableview;
}

//点击item时触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        NSDictionary *dic0 = [self.section0Datasource objectAtIndex:indexPath.row];
        NSString *text = [dic0 objectForKey:@"text"];
        if([text isEqualToString:@"历史聊天记录"]){
            AIHistoryVC *vc = [AIHistoryVC new];
            [self pushToNextVCWith:vc ishidesBottomBar:YES animated:YES];
        }
    }
    if(indexPath.section == 1){
        NSDictionary *dic1 = [self.section1Datasource objectAtIndex:indexPath.row];
        NSString *text = [dic1 objectForKey:@"text"];
        NSMutableDictionary *dic = [NSMutableDictionary new];
        AICategoryWorkVC *vc = [AICategoryWorkVC new];
        [dic setObject:text forKey:@"content"];
        vc.contentDic = dic;
        [self pushToNextVCWith:vc ishidesBottomBar:YES animated:YES];
    }
    if(indexPath.section == 2){
        NSDictionary *dic2 = [self.section2Datasource objectAtIndex:indexPath.row];
        NSString *text = [dic2 objectForKey:@"text"];
        NSMutableDictionary *dic = [NSMutableDictionary new];
        AITranslateVC *vc = [AITranslateVC new];
        [dic setObject:text forKey:@"content"];
        vc.contentDic = dic;
        [self pushToNextVCWith:vc ishidesBottomBar:YES animated:YES];
    }
}
@end
