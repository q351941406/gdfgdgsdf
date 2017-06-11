//
//  WMROOTViewController.m
//  MuseumWork
//
//  Created by iosDevelop on 17/3/15.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import "WMROOTViewController.h"
#import "WMVenueCollectionViewCell.h"
#import "WMProductsListVC.h"
#import "WMBanerCollectionViewCell.h"
#import "WMVenueTitle1CollectionViewCell.h"
#import "WMVenueTitle2CollectionViewCell.h"
#import "WMVenueTitle3CollectionViewCell.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface WMROOTViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSArray *titleArr;
@property (nonatomic , strong) NSArray *desArr;
@property (nonatomic , strong) NSArray *imageArr;

@property (nonatomic ) BOOL isFirstComing;

@end
@implementation WMROOTViewController
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = 10;
        layout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.translatesAutoresizingMaskIntoConstraints = YES;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WMVenueCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([WMVenueCollectionViewCell class])];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WMBanerCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:[WMBanerCollectionViewCell cellReuseIdentifier]];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WMVenueTitle1CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:[WMVenueTitle1CollectionViewCell cellReuseIdentifier]];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WMVenueTitle2CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:[WMVenueTitle2CollectionViewCell cellReuseIdentifier]];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WMVenueTitle3CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:[WMVenueTitle3CollectionViewCell cellReuseIdentifier]];


    }
    return _collectionView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.isFirstComing = YES;
    [self.view addSubview:self.collectionView];
    [self getData];
    
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
   
    
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return  1;
    }else if (section == 1){
        return  1;
    }else if (section == 2){
        return  7;
    }else if (section == 3){
        return  1;
    }else if (section == 4){
        return  4;
    }
    return 0;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return  CGSizeMake(Width, 150);
    }else if (indexPath.section == 1){
        return  CGSizeMake(Width, 60);
    }else if (indexPath.section == 2){
        return  CGSizeMake((Width-10)/2, 100);
    }else if (indexPath.section == 3){
        return  CGSizeMake(Width, 60);
    }else if (indexPath.section == 4){
        return  CGSizeMake((Width-10)/2, 100);
    }
    return CGSizeZero;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WMCollectionViewCell *cell ;
    NSDictionary *dic;
    if (indexPath.section == 0) {
       cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WMBanerCollectionViewCell class]) forIndexPath:indexPath];
   
    }else if (indexPath.section == 1){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WMVenueTitle2CollectionViewCell class]) forIndexPath:indexPath];
        
    }else if (indexPath.section == 2){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WMVenueCollectionViewCell class]) forIndexPath:indexPath];
        dic = @{@"title":self.titleArr[0][indexPath.row],
                @"des":self.desArr[0][indexPath.row],
                @"image":self.imageArr[0][indexPath.row]
                };
        [cell updateWithCellData:dic atIndexPath:indexPath];

    }else if (indexPath.section == 3){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WMVenueTitle3CollectionViewCell class]) forIndexPath:indexPath];

    }else if (indexPath.section == 4){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WMVenueCollectionViewCell class]) forIndexPath:indexPath];
        dic = @{@"title":self.titleArr[1][indexPath.row],
                @"des":self.desArr[1][indexPath.row],
                @"image":self.imageArr[1][indexPath.row]
                };
        [cell updateWithCellData:dic atIndexPath:indexPath];
    }

    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section != 2 && indexPath.section != 4) {
        return;
    }
    WMProductsListVC *VC = [[WMProductsListVC alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    if (indexPath.section == 2) {
        VC.title = self.titleArr[0][indexPath.row];
        switch (indexPath.row) {
                case 0:
                VC.fileName = @"DaLeTou";
                break;
                case 1:
                VC.fileName = @"ShuangSeQiu";
                break;
                case 2:
                VC.fileName = @"FuCai3D";
                break;
                case 3:
                VC.fileName = @"QiLeCai";
                break;
                case 4:
                VC.fileName = @"SevenStarData";
                break;
                case 5:
                VC.fileName = @"PaiLieSan";
                break;
                case 6:
                VC.fileName = @"PaiLieWu";
                break;
            default:
                break;
        }
    } else if (indexPath.section == 4) {
        VC.title = self.titleArr[1][indexPath.row];
        VC.fileName = @"ShiYiYun";
    }
   [self.navigationController pushViewController:VC animated:true];
}
- (void)getData{
    
    self.titleArr = @[
  @[@"大乐透",@"双色球",@"福彩3D",@"七乐彩",@"七星彩",@"排列三",@"排列五"],
  @[@"十一运夺金",@"江西11选5",@"新疆11选5",@"广东11选5"]
  ];
    self.desArr = @[
  @[@"奖池36.12亿元",@"奖池：6.10亿元",@"天天开奖，单注赢千元",@"奖池：0元",@"奖池：520元",@"天天开奖，益智易中",@"小排列大奖金，2元赢取10万"],
  @[@"10分钟一期，返奖率高达59%",@"10分钟一期，返奖率高达59%",@"10分钟一期，返奖率高达59%",@"10分钟一期，返奖率高达59%"]];
    self.imageArr = @[
  @[@"daletouicon",@"ssq_icon",@"sande",@"qlc",@"7星彩",@"pai3",@"pai5"],
  @[@"11选5",@"list_cpiconx11x5",@"新疆11选5",@"广东11选5"]];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation  

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
