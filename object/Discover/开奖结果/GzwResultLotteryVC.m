//
//  GzwAddressVC.m
//  pjh365
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwResultLotteryVC.h"
#import "GzwResutCell.h"
#import "AFNetworking.h"
#import "GzwThemeTool.h"
#import "GzwWebAdvertVC.h"
#import "Masonry.h"
#import "NYSegmentedControl.h"
#import "GzwResutTwoCell.h"
#import "AppDelegate.h"


static NSString *ID = @"GzwResutCell";


@interface GzwResultLotteryVC ()


@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation GzwResultLotteryVC
-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requst) name:@"OK" object:nil];

    

    
    [self requst];
    
    
}


-(void)requst{
    
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    NSString *str = [self convertToJsonData:@{@"pageindex":@"1",@"params":@{@"lotteryType":@10052}}];
    [mar.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"Cookie"] forHTTPHeaderField:@"Cookie"];
    [mar POST:@"http://client.310win.com/Default.aspx?transcode=503&deviceid=1265177&client=2&version=3.9" parameters:@{@"baseinfoversion":@"2_3.9|G1H1I1J1K1L1M1N1O1P1Q1R1S1T1U1V1W1",@"key":@"8f577b3e7aa6d1e20b26902b4140941d",@"msg":str} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        if (![responseObject[@"code"] isEqualToString:@"100"]) {
            [AppDelegate getCookie];
            return ;
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}
-(NSString *)convertToJsonData:(NSDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}


//// cell分割线的左边到尽头
//-(void)viewDidLayoutSubviews {
//    // 判断有没有实现这个方法
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        // 然后清零。
//        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//
//    }
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
//        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
//}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//}

#pragma mark Action

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.data.count;

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        GzwResutCell *cell = [tableView dequeueReusableCellWithIdentifier:GzwResutCell.description];
        cell.model = self.data[indexPath.row];
        return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
    //    VC.progressColor = [GzwThemeTool progressColor];
    //    VC.webUrl = self.data[indexPath.row][@"w_info_absolute_url"];
    //    VC.LoadadvDesc = NO;
    //    [self.navigationController pushViewController:VC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


@end
