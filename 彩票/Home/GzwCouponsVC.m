//
//  GzwCouponsVC.m
//  pjh365
//
//  Created by 嗨购 on 16/5/23.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwCouponsVC.h"
#import "GzwCouponsCell.h"
#import "HomeM.h"
#import "MJRefresh.h"
#import "GzwCouponsHeadView.h"
#import "GzwWebAdvertVC.h"
#import "ODRefreshControl.h"
#import "GZWTool.h"
#import "AFNetworking.h"
#import "GzwThemeTool.h"
#import "WMProductsListVC.H"
#import "GzwEventsVC.h"
#import "GzwDetaillVC.h"
#import "ReactiveCocoa.h"
#import <MeiQiaSDK/MeiQiaSDK.h>
#import "MQChatViewManager.h"
#import "SDVersion.h"
#import "UIViewController+Chameleon.h"
static NSString *ID = @"GzwCouponsCell";

static  NSString  * const headerID = @"GzwCouponsHeadView";
@interface GzwCouponsVC ()

@property (nonatomic,strong ) NSArray            *data;
@property (nonatomic, strong) NSMutableArray *dataTwo;
@property (nonatomic,strong ) GzwCouponsHeadView        *headView;
@property (nonatomic,assign ) int                       page;
@property (nonatomic,strong ) NSArray                   *adURL;// 广告URL
@property (nonatomic,strong ) ODRefreshControl          *downRefresh;
@property (nonatomic, strong) UIImage *defaultImage;
@end


@implementation GzwCouponsVC

-(GzwCouponsHeadView *)headView
{
    if (!_headView) {
        _headView = [[GzwCouponsHeadView alloc]initWithFrame:CGRectMake(0, 0, 250, 110)];
    }
    return _headView;
}


#pragma mark Life Cycle
-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat itemW  = 0;
    itemW = ViewW/2 - 1;
    int i = 0;
    if ([SDVersion deviceSize] == Screen3Dot5inch)
        NSLog(@"You got the iPhone 7. Sweet 🍭!");
    else if ([SDVersion deviceSize] == Screen4inch)
        NSLog(@"You got the iPhone 7. Sweet 🍭!");
    else if ([SDVersion deviceSize] == Screen4Dot7inch)
        i = 40;
    else if ([SDVersion deviceSize] == Screen5Dot5inch)
        i = 40;

    layout.sectionInset = UIEdgeInsetsMake(i , 0 ,0, 0);
    layout.itemSize = CGSizeMake(itemW, 80);
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    GzwCouponsVC *VC = [super initWithCollectionViewLayout:layout];

    return VC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 2;
    [self.collectionView registerNib:[UINib nibWithNibName:ID bundle:nil] forCellWithReuseIdentifier:ID];
    // 注册headerView
    [self.collectionView registerClass:[GzwCouponsHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    //    [VC.collectionView registerNib:[UINib nibWithNibName:headerID bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    self.collectionView.backgroundColor = [GzwThemeTool backgroudTheme];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icons8-Speech Bubble_50"] style:0 target:nil action:nil];
    self.navigationItem.rightBarButtonItem.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        //在开发者需要调出聊天界面的位置，增加如下代码
        MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
        [chatViewManager pushMQChatViewControllerInViewController:self];
        return [RACSignal empty];
    }];
    
    

    
     
    
    
    [self getPoster];
    
}
// 获取广告
-(void)getPoster
{
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [mar POST:@"http://mapi.yjcp.com/center/homePageInfo" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.adURL = [responseObject[@"lunboList"] valueForKeyPath:@"linkAddress"];
        NSArray *dd = [responseObject[@"lunboList"] valueForKeyPath:@"linkAddress"];
        self.headView.cycleScrollView.imageURLStringsGroup = [responseObject[@"lunboList"] valueForKeyPath:@"mapAddress"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}
#pragma mark Action




#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GzwCouponsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.model           = self.data[indexPath.row];
    
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeM *m = self.data[indexPath.row];
    if (m.block) {
        m.block(nil, indexPath);
    }
    
//    WMProductsListVC *VC = [[WMProductsListVC alloc]init];
//    VC.title = m.title;
//    switch (indexPath.row) {
//        case 0:
//            VC.fileName = @"DaLeTou";
//            break;
//        case 1:
//            VC.fileName = @"ShuangSeQiu";
//            break;
//        case 2:
//            VC.fileName = @"FuCai3D";
//            break;
//        case 3:
//            VC.fileName = @"QiLeCai";
//            break;
//        case 4:
//            VC.fileName = @"SevenStarData";
//            break;
//        case 5:
//            VC.fileName = @"PaiLieSan";
//            break;
//        case 6:
//            VC.fileName = @"PaiLieWu";
//            break;
//        default:
//            break;
//    }
//    VC.fileName = @"ShiYiYun";
//    [self.navigationController pushViewController:VC animated:true];

    
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind != UICollectionElementKindSectionHeader) {
        return nil;
    }
    GzwCouponsHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
    headerView.block = ^(int index){
        GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
        VC.progressColor = [GzwThemeTool progressColor];
        VC.webUrl = self.adURL[index];
        VC.LoadadvDesc = NO;
        [self.navigationController pushViewController:VC animated:YES];
    };

    self.headView = headerView;
    return headerView;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    //    CGFloat height = 112;
    CGSize size={ViewW,110};
    return size;
}







-(NSArray *)data
{
    if (!_data) {
        
        
    
        HomeM *m1 = [[HomeM alloc]init];
        m1.iconName = @"daletouicon";
        m1.subTitle = @"奖池36.12亿元";
        m1.title = @"大乐透";
        m1.block = ^(NSObject *view,NSObject *index){
            WMProductsListVC *VC = [[WMProductsListVC alloc]init];
            VC.title = @"大乐透";
            VC.fileName = @"DaLeTou";
            [self.navigationController pushViewController:VC animated:YES];
        };
        HomeM *m2 = [[HomeM alloc]init];
        m2.iconName = @"ssq_icon";
        m2.subTitle = @"奖池：6.10亿元";
        m2.title = @"双色球";
        m2.block = ^(NSObject *view,NSObject *index){
            WMProductsListVC *VC = [[WMProductsListVC alloc]init];
            VC.title = @"双色球";
            VC.fileName = @"ShuangSeQiu";
            [self.navigationController pushViewController:VC animated:YES];
        };
        HomeM *m3 = [[HomeM alloc]init];
        m3.iconName = @"sande";
        m3.subTitle = @"天天开奖，单注赢千元";
        m3.title = @"福彩3D";
        m3.block = ^(NSObject *view,NSObject *index){
            WMProductsListVC *VC = [[WMProductsListVC alloc]init];
            VC.title = @"福彩3D";
            VC.fileName = @"FuCai3D";
            [self.navigationController pushViewController:VC animated:YES];
        };
        HomeM *m4 = [[HomeM alloc]init];
        m4.iconName = @"qlc";
        m4.subTitle = @"奖池：0元";
        m4.title = @"七乐彩";
        m4.block = ^(NSObject *view,NSObject *index){
            WMProductsListVC *VC = [[WMProductsListVC alloc]init];
            VC.title = @"七乐彩";
            VC.fileName = @"QiLeCai";
            [self.navigationController pushViewController:VC animated:YES];
        };
        HomeM *m5 = [[HomeM alloc]init];
        m5.iconName = @"7星彩";
        m5.subTitle = @"奖池：520元";
        m5.title = @"七星彩";
        m5.block = ^(NSObject *view,NSObject *index){
            WMProductsListVC *VC = [[WMProductsListVC alloc]init];
            VC.title = @"七星彩";
            VC.fileName = @"QiLeCai";
            [self.navigationController pushViewController:VC animated:YES];
        };
        HomeM *m6 = [[HomeM alloc]init];
        m6.iconName = @"pai3";
        m6.subTitle = @"天天开奖，益智易中";
        m6.title = @"排列五";
        m6.block = ^(NSObject *view,NSObject *index){
            WMProductsListVC *VC = [[WMProductsListVC alloc]init];
            VC.title = @"排列五";
            VC.fileName = @"PaiLieWu";
            [self.navigationController pushViewController:VC animated:YES];
        };
        HomeM *m7 = [[HomeM alloc]init];
        m7.iconName = @"logo_竞彩足球";
        m7.subTitle = @"德国首秀点到即止";
        m7.title = @"竞彩足球";
        @weakify(self)
        m7.block = ^(NSObject *view,NSObject *index){
             @strongify(self)
            NSArray *ary = self.dataTwo[0][@"detail"];
            
            NSMutableArray *marray = [NSMutableArray array];
            [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                GzwEventsVC *vc = [[GzwEventsVC alloc]init];
                vc.url = obj[@"html"];
                vc.titleText = obj[@"title"];
                vc.bg = self.dataTwo[0][@"bg"];
                self.defaultImage= [UIImage imageNamed:vc.bg];
                [marray addObject:vc];
            }];
            
            GzwDetaillVC *pager = [[GzwDetaillVC alloc] init];
            [pager setViewControllers:marray];
            pager.segmentMiniTopInset = 64;
            pager.headerHeight = 150;
            pager.freezenHeaderWhenReachMaxHeaderHeight = YES;
            
            [RACObserve(pager, segmentToInset) subscribeNext:^(id x) {
               
                if (!pager.headerView.imageView.image) {
                    pager.headerView.imageView.image = self.defaultImage;
                }
            }];
            [self.navigationController pushViewController:pager animated:YES];
            
        };
        HomeM *m8 = [[HomeM alloc]init];
        m8.iconName = @"11选5";
        m8.subTitle = @"10分钟一期，返奖率高达59%";
        m8.title = @"江西11选5";
        m8.block = ^(NSObject *view,NSObject *index){
            
            WMProductsListVC *VC = [[WMProductsListVC alloc]init];
            VC.title = @"江西11选5";
            VC.fileName = @"ShiYiYun";
            [self.navigationController pushViewController:VC animated:YES];
        };
//        HomeM *m9 = [[HomeM alloc]init];
//        m9.iconName = @"list_cpiconx11x5";
//        m9.subTitle = @"10分钟一期，返奖率高达59%";
//        m9.title = @"新疆11选5";
//        m9.block = ^(NSObject *view,NSObject *index){
//            
//        };
        
        HomeM *m10 = [[HomeM alloc]init];
        m10.iconName = @"logo_竞彩篮球";
        m10.subTitle = @"神秘主场迎战";
        m10.title = @"竞彩篮球";
        m10.block = ^(NSObject *view,NSObject *index){
            @strongify(self)
            NSArray *ary = self.dataTwo[1][@"detail"];
            
            NSMutableArray *marray = [NSMutableArray array];
            [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                GzwEventsVC *vc = [[GzwEventsVC alloc]init];
                vc.url = obj[@"html"];
                vc.titleText = obj[@"title"];
                vc.bg = self.dataTwo[1][@"bg"];
                self.defaultImage= [UIImage imageNamed:vc.bg];
                [marray addObject:vc];
            }];
            
            GzwDetaillVC *pager = [[GzwDetaillVC alloc] init];
            [pager setViewControllers:marray];
            pager.segmentMiniTopInset = 64;
            pager.headerHeight = 150;
            pager.freezenHeaderWhenReachMaxHeaderHeight = YES;
            
            [RACObserve(pager, segmentToInset) subscribeNext:^(id x) {
                
                if (!pager.headerView.imageView.image) {
                    pager.headerView.imageView.image = self.defaultImage;
                }
            }];
            [self.navigationController pushViewController:pager animated:YES];
            
        };
        _data = @[m1,m2,m3,m4,m5,m6,m7,m8,m10];
        
        
    }
    return _data;
}

-(NSMutableArray *)dataTwo
{
    if (!_dataTwo) {
        _dataTwo = [NSMutableArray array];
        
        
        
        NSArray *array = @[
                           @{
                               @"type":@"jczq",
                               @"matchDay":@"2017-06-15",
                               @"teamA":@"桑托斯",
                               @"teamB":@"帕梅拉斯",
                               @"scoreA": @"1",
                               @"scoreB": @"0",
                               @"scores":@"1:0",
                               @"concedeBall":@"-1",
                               @"bg":@"match_analysis_header_football",
                               @"detail":@[@{@"html":@"http://client.310win.com/aspx/data/Analysis/1365169.html",@"title":@"分析"},
                                           @{@"html":@"http://client.310win.com/aspx/data/Standings/1365169.html",@"title":@"积分"},
                                           @{@"html":@"http://www.fox008.com/html5/analyse/index_notop.html?id=20170614010",@"title":@"情报"},],
                               },
                           
                           @{
                               @"type":@"jclq",
                               @"matchDay":@"2017-06-15",
                               @"teamA":@"太阳",
                               @"teamB":@"自由",
                               @"scoreA": @"96",
                               @"scoreB": @"76",
                               @"scores":@"96:76",
                               @"concedeBall":@"0",
                               @"bg":@"match_analysis_header_basketball",
                               @"detail":@[@{@"html":@"http://client.310win.com/aspx/data/BasketAnalysis/281306.html",@"title":@"分析"},],
                               
                               },
                           ];
        [_dataTwo addObjectsFromArray:array];
    }
    return _dataTwo;
}
@end
