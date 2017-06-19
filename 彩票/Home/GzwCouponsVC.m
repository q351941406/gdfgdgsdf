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

static NSString *ID = @"GzwCouponsCell";

static  NSString  * const headerID = @"GzwCouponsHeadView";
@interface GzwCouponsVC ()

@property (nonatomic,strong ) NSArray            *data;
@property (nonatomic,strong ) GzwCouponsHeadView        *headView;
@property (nonatomic,assign ) int                       page;
@property (nonatomic,strong ) NSArray                   *adURL;// 广告URL
@property (nonatomic,strong ) ODRefreshControl          *downRefresh;
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
    itemW = ViewW/2 - 2;
    layout.sectionInset = UIEdgeInsetsMake(35 , 0 ,0, 0);
    layout.itemSize = CGSizeMake(itemW, 80);
    layout.minimumInteritemSpacing = 2;
    layout.minimumLineSpacing = 5;
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
    CGSize size={ViewW,100};
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
            
            //        GzwWebVC *vc = [[GzwWebVC alloc]init];
            //        vc.url = @"http://www.a820.com/";
            //        [self.navigationController pushViewController:vc animated:YES];
        };
        HomeM *m2 = [[HomeM alloc]init];
        m2.iconName = @"ssq_icon";
        m2.subTitle = @"奖池：6.10亿元";
        m2.title = @"双色球";
        m2.block = ^(NSObject *view,NSObject *index){
            
            //        GzwWebVC *vc = [[GzwWebVC alloc]init];
            //        vc.url = @"http://www.a820.com/app/";
            //        [self.navigationController pushViewController:vc animated:YES];
        };
        HomeM *m3 = [[HomeM alloc]init];
        m3.iconName = @"sande";
        m3.subTitle = @"天天开奖，单注赢千元";
        m3.title = @"福彩3D";
        m3.block = ^(NSObject *view,NSObject *index){
            
            //        GzwWebVC *vc = [[GzwWebVC alloc]init];
            //        vc.url = @"http://www.a820.com/explain/";
            //        [self.navigationController pushViewController:vc animated:YES];
        };
        HomeM *m4 = [[HomeM alloc]init];
        m4.iconName = @"qlc";
        m4.subTitle = @"奖池：0元";
        m4.title = @"七乐彩";
        m4.block = ^(NSObject *view,NSObject *index){
            
            //        GzwWebVC *vc = [[GzwWebVC alloc]init];
            //        vc.url = @"http://shop.a820.com";
            //        [self.navigationController pushViewController:vc animated:YES];
        };
        HomeM *m5 = [[HomeM alloc]init];
        m5.iconName = @"7星彩";
        m5.subTitle = @"奖池：520元";
        m5.title = @"七星彩";
        m5.block = ^(NSObject *view,NSObject *index){
            
            //        GzwMapVC *vc = [[GzwMapVC alloc]init];
            //        [self.navigationController pushViewController:vc animated:YES];
        };
        HomeM *m6 = [[HomeM alloc]init];
        m6.iconName = @"pai3";
        m6.subTitle = @"天天开奖，益智易中";
        m6.title = @"排列五";
        m6.block = ^(NSObject *view,NSObject *index){
            
            //        //在开发者需要调出聊天界面的位置，增加如下代码
            //        MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
            //        [chatViewManager pushMQChatViewControllerInViewController:self];
        };
        HomeM *m7 = [[HomeM alloc]init];
        m7.iconName = @"logo_竞彩足球";
        m7.subTitle = @"德国首秀点到即止";
        m7.title = @"竞彩足球";
        m7.block = ^(NSObject *view,NSObject *index){
            
            //        GzwWebVC *vc = [[GzwWebVC alloc]init];
            //        vc.url = @"http://www.777.top:8080/";
            //        [self.navigationController pushViewController:vc animated:YES];
        };
        HomeM *m8 = [[HomeM alloc]init];
        m8.iconName = @"11选5";
        m8.subTitle = @"10分钟一期，返奖率高达59%";
        m8.title = @"江西11选5";
        m8.block = ^(NSObject *view,NSObject *index){
            
            //        GzwShakeVC *vc = [[GzwShakeVC alloc]init];
            //        [self.navigationController pushViewController:vc animated:YES];
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
        _data = @[m1,m2,m3,m4,m5,m6,m7,m8,m10];
        
        
    }
    return _data;
}
@end
