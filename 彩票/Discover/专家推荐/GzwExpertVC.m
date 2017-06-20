//
//  GzwExpertVCTableViewController.m
//  彩票
//
//  Created by Wang Jiang on 2017/6/19.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "GzwExpertVC.h"
#import "GzwThemeTool.h"
#import "GzwExpertCell.h"
#import "GzwExpertDetallVC.h"
@interface GzwExpertVC ()
@property (nonatomic, strong) NSArray *data;
@end
//NSMutableArray *items = [[NSMutableArray alloc] init];
//[items addObject:@"分享的title"];
//[items addObject:[UIImage imageNamed:@"ic_refund_busine"]];
//[items addObject:@"https://www.baidu.com"];
//
//UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
////NSMutableArray *excludedActivityTypes =  [NSMutableArray arrayWithArray:@[UIActivityTypeAirDrop, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeMail, UIActivityTypePostToTencentWeibo, UIActivityTypeSaveToCameraRoll, UIActivityTypeMessage, UIActivityTypePostToTwitter]];
////activityViewController.excludedActivityTypes = excludedActivityTypes;
//[self presentViewController:activityViewController animated:YES completion:nil];
//activityViewController.completionWithItemsHandler = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
//    NSLog(@"%@  ----   %@", activityType, returnedItems);
//};
@implementation GzwExpertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"专家推荐";
    self.tableView.backgroundColor = [GzwThemeTool backgroudTheme];
    self.tableView.rowHeight = 80;
//    self.tableView.estimatedRowHeight = 44; // 设置估算高度
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:GzwExpertCell.description bundle:nil] forCellReuseIdentifier:GzwExpertCell.description];
     self.clearsSelectionOnViewWillAppear = YES;
    
    [self.tableView reloadData];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}











#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    GzwExpertCell *cell = [tableView dequeueReusableCellWithIdentifier:GzwExpertCell.description];
    cell.model = self.data[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GzwExpertDetallVC *vc = [[GzwExpertDetallVC alloc]initWithStyle:1];
    vc.dict = self.data[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
// cell分割线的左边到尽头
-(void)viewDidLayoutSubviews {
    // 判断有没有实现这个方法
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        // 然后清零。
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];

    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}




-(NSArray *)data
{
    if (!_data) {
        
        _data =  @[
                   @{
                       @"name":@"足彩苍狼",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170504102612492.png",
                       @"lastTenStatusText":@"近30天：65中50",
                       @"bio":@"30年彩龄，对足彩颇有研究，坚持不懈用指数记录球队的走势，为球迷指点迷津，为彩民们大胆铺路。",
                       @"detaill":@{
                               @"figure":@{
                                       @"name":@"足彩苍狼",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170504102612492.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"30年彩龄，对足彩颇有研究，坚持不懈用指数记录球队的走势，为球迷指点迷津，为彩民们大胆铺路。",
                                       @"fansCount":@881,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=3008755",
                                       },
                               @"rate":@[
                                       @{@"nameText":@"近10场命中",@"data":@90.0},
                                       @{@"nameText":@"近7天命中",@"data":@83.3},
                                       @{@"nameText":@"近30天命中",@"data":@76.9},
                                       @{@"nameText":@"近10场盈利",@"data":@150.3},
                                       @{@"nameText":@"近7天盈利",@"data":@127.5},
                                       @{@"nameText":@"近30天盈利",@"data":@118.2}
                                       ],
                               @"list":@[@{
                                        @"matchId":@2150002,
                                        @"groupTitle":@"2017-06-21 星期三",
                                        @"lastTenStatusText":@"近10中9",
                                        @"profitText":@"盈利率 150.30%",
                                        @"satificationText":@"满意度 99.00%",
                                        @"recommendText":@"￥10查看",
                                        @"viewText":@"（15人查看）",
                                        @"recommendInfo":@{
                                                @"id":@356731,
                                                @"matchName":@"欧青U21",
                                                @"matchDateText":@"06-21\n02:45",
                                                @"versusText":@"葡萄牙21 VS 西班牙21",
                                                @"analysisText":@"今战两强相遇，胜出的一方基本上可以锁定出..."
                                                },
                                        @"publishDateText":@"06-19 17:34发布",
                                        @"favourableCount":@1,
                                        @"negativeCount":@0,
                                        @"payMoney":@10,
                                        @"isPaid":@false,
                                        @"isFreeLimit":@false,
                                        @"voiceSecond":@0,
                                        @"viewCount":@0
                                        },
                                    @{
                                        @"matchId":@2149002,
                                        @"groupTitle":@"2017-06-20 星期二",
                                        @"lastTenStatusText":@"近10中9",
                                        @"profitText":@"盈利率 150.30%",
                                        @"satificationText":@"满意度 99.00%",
                                        @"recommendText":@"负",
                                        @"viewText":@"（19人查看）",
                                        @"recommendInfo":@{
                                                @"id":@356700,
                                                @"matchName":@"欧青U21",
                                                @"matchDateText":@"06-20\n00:00",
                                                @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                @"analysisText":@"（内有瑞典）虽然英格兰U21首场小组赛未能..."
                                                },
                                        @"publishDateText":@"06-19 17:09发布",
                                        @"favourableCount":@0,
                                        @"negativeCount":@0,
                                        @"payMoney":@10,
                                        @"isWon":@true,
                                        @"isPaid":@true,
                                        @"isFreeLimit":@false,
                                        @"voiceSecond":@0,
                                        @"viewCount":@0
                                        },
                                    @{
                                        @"matchId":@2150001,
                                        @"groupTitle":@"2017-06-21 星期三",
                                        @"lastTenStatusText":@"近10中9",
                                        @"profitText":@"盈利率 150.30%",
                                        @"satificationText":@"满意度 99.00%",
                                        @"recommendText":@"免费查看",
                                        @"viewText":@"（838人查看）",
                                        @"recommendInfo":@{
                                                @"id":@356688,
                                                @"matchName":@"欧青U21",
                                                @"matchDateText":@"06-21\n00:00",
                                                @"versusText":@"塞尔维21 VS 马其顿21",
                                                @"analysisText":@"塞尔维亚U21不少主力均效力于五大联赛，包..."
                                                },
                                        @"publishDateText":@"06-19 16:59发布",
                                        @"favourableCount":@7,
                                        @"negativeCount":@1,
                                        @"payMoney":@0,
                                        @"isPaid":@false,
                                        @"isFreeLimit":@false,
                                        @"voiceSecond":@0,
                                        @"viewCount":@0
                                        },
                                    @{
                                        @"matchId":@2149005,
                                        @"groupTitle":@"2017-06-20 星期二",
                                        @"lastTenStatusText":@"近10中9",
                                        @"profitText":@"盈利率 150.30%",
                                        @"satificationText":@"满意度 99.00%",
                                        @"recommendText":@"让负[-1]",
                                        @"viewText":@"（44人查看）",
                                        @"recommendInfo":@{
                                                @"id":@355151,
                                                @"matchName":@"巴西甲",
                                                @"matchDateText":@"06-20\n07:00",
                                                @"versusText":@"克鲁塞罗  3:3  格雷米奥",
                                                @"analysisText":@"这场水位很好，宜早入手。本赛季克鲁塞罗不..."
                                                },
                                        @"publishDateText":@"06-18 17:20发布",
                                        @"favourableCount":@0,
                                        @"negativeCount":@0,
                                        @"payMoney":@10,
                                        @"isWon":@true,
                                        @"isPaid":@true,
                                        @"isFreeLimit":@false,
                                        @"voiceSecond":@0,
                                        @"viewCount":@0
                                        },
                                    @{
                                        @"matchId":@2148009,
                                        @"groupTitle":@"2017-06-19 星期一",
                                        @"lastTenStatusText":@"近10中9",
                                        @"profitText":@"盈利率 150.30%",
                                        @"satificationText":@"满意度 99.00%",
                                        @"recommendText":@"胜",
                                        @"viewText":@"（11人查看）",
                                        @"recommendInfo":@{
                                                @"id":@355119,
                                                @"matchName":@"欧青U21",
                                                @"matchDateText":@"06-19\n00:00",
                                                @"versusText":@"德国21  2:0  捷克21",
                                                @"analysisText":@"德国青训闻名遐迩，这届U21大赛表现十分出..."
                                                },
                                        @"publishDateText":@"06-18 17:03发布",
                                        @"favourableCount":@0,
                                        @"negativeCount":@0,
                                        @"payMoney":@10,
                                        @"isWon":@true,
                                        @"isPaid":@true,
                                        @"isFreeLimit":@false,
                                        @"voiceSecond":@0,
                                        @"viewCount":@0
                                        },
                                    @{
                                        @"matchId":@2148012,
                                        @"groupTitle":@"2017-06-19 星期一",
                                        @"lastTenStatusText":@"近10中9",
                                        @"profitText":@"盈利率 150.30%",
                                        @"satificationText":@"满意度 99.00%",
                                        @"recommendText":@"胜",
                                        @"viewText":@"（769人查看）",
                                        @"recommendInfo":@{
                                                @"id":@354794,
                                                @"matchName":@"挪超",
                                                @"matchDateText":@"06-19\n00:00",
                                                @"versusText":@"莫尔德  3:0  特罗姆瑟",
                                                @"analysisText":@"我玩球玩了30年跟庄打了30年的交道，庄的心..."
                                                },
                                        @"publishDateText":@"06-18 14:20发布",
                                        @"favourableCount":@13,
                                        @"negativeCount":@0,
                                        @"payMoney":@0,
                                        @"isWon":@true,
                                        @"isPaid":@true,
                                        @"isFreeLimit":@false,
                                        @"voiceSecond":@0,
                                        @"viewCount":@0
                                        },
                                    @{
                                        @"matchId":@2148017,
                                        @"groupTitle":@"2017-06-19 星期一",
                                        @"lastTenStatusText":@"近10中9",
                                        @"profitText":@"盈利率 150.30%",
                                        @"satificationText":@"满意度 99.00%",
                                        @"recommendText":@"负",
                                        @"viewText":@"（27人查看）",
                                        @"recommendInfo":@{
                                                @"id":@353160,
                                                @"matchName":@"洲际杯",
                                                @"matchDateText":@"06-19\n02:00",
                                                @"versusText":@"喀麦隆  0:2  智利",
                                                @"analysisText":@"智利队近年来势头强劲，已经超越巴阿，成为..."
                                                },
                                        @"publishDateText":@"06-17 17:35发布",
                                        @"favourableCount":@0,
                                        @"negativeCount":@0,
                                        @"payMoney":@10,
                                        @"isWon":@true,
                                        @"isPaid":@true,
                                        @"isFreeLimit":@false,
                                        @"voiceSecond":@0,
                                        @"viewCount":@0
                                        },
                                    @{
                                        @"matchId":@2147018,
                                        @"groupTitle":@"2017-06-17 星期六",
                                        @"lastTenStatusText":@"近10中9",
                                        @"profitText":@"盈利率 150.30%",
                                        @"satificationText":@"满意度 99.00%",
                                        @"recommendText":@"让胜[+1]",
                                        @"viewText":@"（11人查看）",
                                        @"recommendInfo":@{
                                                @"id":@352803,
                                                @"matchName":@"日职乙",
                                                @"matchDateText":@"06-17\n18:00",
                                                @"versusText":@"金泽塞维  3:2  山口雷诺",
                                                @"analysisText":@"这场经典，忍不住点了。两队本赛季表现都不..."
                                                },
                                        @"publishDateText":@"06-17 15:02发布",
                                        @"favourableCount":@0,
                                        @"negativeCount":@0,
                                        @"payMoney":@10,
                                        @"isWon":@true,
                                        @"isPaid":@true,
                                        @"isFreeLimit":@false,
                                        @"voiceSecond":@0,
                                        @"viewCount":@0
                                        },
                                    ]
                                }
                       },
                   @{
                       @"name":@"比特币911",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170604165634662.png",
                       @"lastTenStatusText":@"近30天：99中67",
                       @"bio":@"911足球竞彩团队，秉承网络大数据，坚持科学分析，结合独创数理模型，综合各方面资源，提供最专业的足球赛事推荐服务！同样的盘口，普通投资者10场综合命中率仅可以达到3成，我们团队通过例如对30场赛事进行筛选，只会选择10场有把握的赛事进行推荐投注，熟能生巧，擅长的盘口赛事通常综合命中率可以达到70%-90%！没有谁可以说一场比赛绝对的稳，通过科学的分析筛选，可以大幅提高命中率还是可行的！另外，对一些特别的盘口，凡是有可能剧情的赛事，只要能找出爆冷的合理理由，下手一定要狠，一定要看准基本面，致命一击！……稳中博弈，是911一贯坚持的推单原则，做生意回头才起熟客，合作共赢，利益共享！",
                       @"detaill":@{
                               @"figure":@{
                                       @"name":@"比特币911",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170604165634662.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"911足球竞彩团队，秉承网络大数据，坚持科学分析，结合独创数理模型，综合各方面资源，提供最专业的足球赛事推荐服务！同样的盘口，普通投资者10场综合命中率仅可以达到3成，我们团队通过例如对30场赛事进行筛选，只会选择10场有把握的赛事进行推荐投注，熟能生巧，擅长的盘口赛事通常综合命中率可以达到70%-90%！没有谁可以说一场比赛绝对的稳，通过科学的分析筛选，可以大幅提高命中率还是可行的！另外，对一些特别的盘口，凡是有可能剧情的赛事，只要能找出爆冷的合理理由，下手一定要狠，一定要看准基本面，致命一击！……稳中博弈，是911一贯坚持的推单原则，做生意回头才起熟客，合作共赢，利益共享！",
                                       @"fansCount":@1004,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=2988200"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@80.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@67.7
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@69.1
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@138.9
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@108.0
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@109.5
                                             }],
                               @"list":@[@{
                                             
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（5人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"日皇杯",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"町田泽维 VS 大分三神",
                                                     @"analysisText":@"回到熟悉的抗日赛场，抗日成绩有目共睹！～..."
                                                     },
                                             @"publishDateText":@"06-19 22:26发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"日皇杯",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"爱嫒FC VS 赞岐釜玉",
                                                     @"analysisText":@"回到熟悉的抗日赛场，抗日成绩有目共睹！～..."
                                                     },
                                             @"publishDateText":@"06-19 22:24发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-21\n02:45",
                                                     @"versusText":@"葡萄牙21 VS 西班牙21",
                                                     @"analysisText":@"911足球竞彩团队，秉承网络大数据，坚持科..."
                                                     },
                                             @"publishDateText":@"06-19 16:34发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（4人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-21\n00:00",
                                                     @"versusText":@"塞尔维21 VS 马其顿21",
                                                     @"analysisText":@"911足球竞彩团队，秉承网络大数据，坚持科..."
                                                     },
                                             @"publishDateText":@"06-19 16:32发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负[-1]",
                                             @"viewText":@"（78人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-19\n05:00",
                                                     @"versusText":@"费城  0:2  纽约红牛",
                                                     @"analysisText":@"火爆至极，火爆至极！感谢各位一直关注支持..."
                                                     },
                                             @"publishDateText":@"06-19 04:41发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"<font color='#000'>负",
                                             @"viewText":@"（18人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-18\n18:00",
                                                     @"versusText":@"江原FC  2:1  济州联队",
                                                     @"analysisText":@"～抗日！911足球竞彩团队，秉承网络大数据..."
                                                     },
                                             @"publishDateText":@"06-18 02:06发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（21人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-18\n18:00",
                                                     @"versusText":@"草津溫泉  0:2  松本山雅",
                                                     @"analysisText":@"～抗日！911足球竞彩团队，秉承网络大数据..."
                                                     },
                                             @"publishDateText":@"06-18 02:06发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负[-1]",
                                             @"viewText":@"（19人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-18\n17:00",
                                                     @"versusText":@"水原三星  1:2  FC首尔",
                                                     @"analysisText":@"～抗日！911足球竞彩团队，秉承网络大数据..."
                                                     },
                                             @"publishDateText":@"06-18 02:05发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（542人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n10:00",
                                                     @"versusText":@"盐湖城  1:0  明尼苏达",
                                                     @"analysisText":@"抗日6连红，911每次都给你惊喜！谁有实力各..."
                                                     },
                                             @"publishDateText":@"06-18 02:01发布",
                                             @"favourableCount":@5,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负[-1]",
                                             @"viewText":@"（707人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n10:20",
                                                     @"versusText":@"温哥华  1:1  达拉斯",
                                                     @"analysisText":@"抗日6连红，911每次都给你惊喜！谁有实力各..."
                                                     },
                                             @"publishDateText":@"06-18 02:00发布",
                                             @"favourableCount":@5,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"全南天龙  0:3  全北现代",
                                                     @"analysisText":@"～抗日！911足球竞彩团队，秉承网络大数据..."
                                                     },
                                             @"publishDateText":@"06-17 03:14发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负[-1]",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"大邱FC  2:2  光州FC",
                                                     @"analysisText":@"～抗日！911足球竞彩团队，秉承网络大数据..."
                                                     },
                                             @"publishDateText":@"06-17 03:14发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负[-1]",
                                             @"viewText":@"（4人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"长崎成功丸  0:0  町田泽维",
                                                     @"analysisText":@"～抗日！911足球竞彩团队，秉承网络大数据..."
                                                     },
                                             @"publishDateText":@"06-17 03:12发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },@{
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（4人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"德岛漩涡  3:0  熊本深红",
                                                     @"analysisText":@"～抗日！911足球竞彩团队，秉承网络大数据..."
                                                     },
                                             @"publishDateText":@"06-17 03:11发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 138.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（6人查看）",
                                             @"recommendInfo":@{
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-15\n08:45",
                                                     @"versusText":@"沙佩科恩斯  2:1  瓦斯科达伽马",
                                                     @"analysisText":@"911足球竞彩团队，秉承网络大数据，坚持科..."
                                                     },
                                             @"publishDateText":@"06-14 13:38发布",
                                             @"favourableCount":@4,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                            }
                       },
                   @{
                       @"name":@"足彩稻草人",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20160823141941140.png",
                       @"lastTenStatusText":@"近30天：73中49",
                       @"bio":@"网罗全球足球资讯，结合数据进行赛事分析，专业的临场数据变化解析，二十年经验总结，帮助你提升理论知识和实战技能，足彩稻草人从事足球赛事推荐分析多年，熟练掌握足球赛事的开盘技巧和盘口分析，具备赛事实战经验，【足彩王】推荐战绩辉煌，深受玩家追捧。",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@2944557,
                                       @"name":@"足彩稻草人",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20160823141941140.png",
                                       @"masterLevel":@"高级专家",
                                       @"bio":@"网罗全球足球资讯，结合数据进行赛事分析，专业的临场数据变化解析，二十年经验总结，帮助你提升理论知识和实战技能，足彩稻草人从事足球赛事推荐分析多年，熟练掌握足球赛事的开盘技巧和盘口分析，具备赛事实战经验，【足彩王】推荐战绩辉煌，深受玩家追捧。",
                                       @"fansCount":@813,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=2944557"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@90.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@68.2
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@66.2
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@137.6
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@104.1
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@100.4
                                             }],
                               @"list":@[@{
                                             @"matchId":@2149002,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（7人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356526,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n00:00",
                                                     @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：英格兰..."
                                                     },
                                             @"publishDateText":@"06-19 14:13发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148027,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（5人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354267,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-19\n05:00",
                                                     @"versusText":@"费城  0:2  纽约红牛",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：费城联..."
                                                     },
                                             @"publishDateText":@"06-18 09:20发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148025,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（6人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354265,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-19\n04:00",
                                                     @"versusText":@"防卫者  3:0  图库曼",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：图库曼..."
                                                     },
                                             @"publishDateText":@"06-18 09:20发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148014,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（5人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354263,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"松达尔  0:0  奥德格伦兰",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：今场比..."
                                                     },
                                             @"publishDateText":@"06-18 09:19发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148002,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（5人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354258,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-18\n17:00",
                                                     @"versusText":@"水原三星  1:2  FC首尔",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：水原三..."
                                                     },
                                             @"publishDateText":@"06-18 09:19发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147042,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354255,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n11:00",
                                                     @"versusText":@"洛城银河  2:2  休斯敦",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：洛杉矶..."
                                                     },
                                             @"publishDateText":@"06-18 09:18发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147024,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352125,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-18\n01:00",
                                                     @"versusText":@"萨兰迪兵工厂  1:2  戈多伊",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：戈多伊..."
                                                     },
                                             @"publishDateText":@"06-17 09:58发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147030,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352124,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-18\n04:45",
                                                     @"versusText":@"阿多西维  0:4  博卡",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：领头羊..."
                                                     },
                                             @"publishDateText":@"06-17 09:58发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147027,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352122,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-18\n03:00",
                                                     @"versusText":@"戈竞技  0:1  巴竞技",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：戈亚尼..."
                                                     },
                                             @"publishDateText":@"06-17 09:57发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147012,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（2人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352121,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"神户胜利  0:1  大阪钢巴",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：大阪钢..."
                                                     },
                                             @"publishDateText":@"06-17 09:56发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147006,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（4人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352118,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:30",
                                                     @"versusText":@"东京绿茵  3:3  爱嫒FC",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：爱媛FC..."
                                                     },
                                             @"publishDateText":@"06-17 09:55发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147002,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@350944,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:00",
                                                     @"versusText":@"水户蜀葵  3:1  千叶市原",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：千叶市..."
                                                     },
                                             @"publishDateText":@"06-16 17:32发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147003,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@350941,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:00",
                                                     @"versusText":@"横滨FC  0:1  山形山神",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：山形山..."
                                                     },
                                             @"publishDateText":@"06-16 17:32发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147001,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（2人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@350937,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n13:00",
                                                     @"versusText":@"福冈黄蜂  3:1  名古屋鲸",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：名古屋..."
                                                     },
                                             @"publishDateText":@"06-16 17:31发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146001,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（5人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@350935,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-17\n00:00",
                                                     @"versusText":@"瑞典21  0:0  英格兰21",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：英格兰..."
                                                     },
                                             @"publishDateText":@"06-16 17:30发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146006,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（9人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349407,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n08:15",
                                                     @"versusText":@"班菲尔德  3:1  罗萨里奥",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：队目前..."
                                                     },
                                             @"publishDateText":@"06-15 16:32发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@1,
                                             @"payMoney":@18,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2140013,
                                             @"groupTitle":@"2017-06-11 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 137.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"9连红",
                                             @"viewText":@"（4人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@340849,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-11\n03:00",
                                                     @"versusText":@"帕尔梅拉斯  3:1  弗鲁米嫩塞",
                                                     @"analysisText":@"足彩稻草人独家消息【足彩王】推荐：弗鲁米..."
                                                     },
                                             @"publishDateText":@"06-10 09:19发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@18,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                               
                               }
                       
                       },
                   @{
                       @"name":@"北欧赛事天天有",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170514042253050.png",
                       @"lastTenStatusText":@"近30天：96中64",
                       @"bio":@"彩客网传奇，北欧赛事天天有，熟透各级联赛，运用亚赔、欧赔来分析，胜率高，稳盈利，常跟我是你不二选择！",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@3026605,
                                       @"name":@"北欧赛事天天有",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170514042253050.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"彩客网传奇，北欧赛事天天有，熟透各级联赛，运用亚赔、欧赔来分析，胜率高，稳盈利，常跟我是你不二选择！",
                                       @"fansCount":@620,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=3026605"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@80.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@77.8
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@66.3
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@120.1
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@125.5
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@106.7
                                             }],
                               @"list":@[@{
                                             @"matchId":@2151002,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357128,
                                                     @"matchName":@"日皇杯",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"町田泽维 VS 大分三神",
                                                     @"analysisText":@"北欧本月55中45，再度携手抗击倭寇，！\n这..."
                                                     },
                                             @"publishDateText":@"06-19 22:41发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151001,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（5人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357126,
                                                     @"matchName":@"日皇杯",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"爱嫒FC VS 赞岐釜玉",
                                                     @"analysisText":@"北欧本月55中45，再度携手抗击倭寇，！\n这..."
                                                     },
                                             @"publishDateText":@"06-19 22:39发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149002,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357062,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n00:00",
                                                     @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                     @"analysisText":@"斯洛伐克U21今届与英格兰U21、瑞典U21以及..."
                                                     },
                                             @"publishDateText":@"06-19 22:09发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150001,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（5人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356611,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-21\n00:00",
                                                     @"versusText":@"塞尔维21 VS 马其顿21",
                                                     @"analysisText":@"本次是马其顿U21历史上首次闯进决赛区，球..."
                                                     },
                                             @"publishDateText":@"06-19 16:02发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148027,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（39人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356060,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-19\n05:00",
                                                     @"versusText":@"费城  0:2  纽约红牛",
                                                     @"analysisText":@"纽约红牛最近6次面对费城联合3胜1平2负占据..."
                                                     },
                                             @"publishDateText":@"06-19 04:34发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148007,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355355,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-18\n22:00",
                                                     @"versusText":@"科里蒂巴  0:0  科林蒂安",
                                                     @"analysisText":@"科林蒂安新赛季7轮联赛战罢，6胜1平打进14..."
                                                     },
                                             @"publishDateText":@"06-18 20:20发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148014,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355349,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"松达尔  0:0  奥德格伦兰",
                                                     @"analysisText":@"松达尔将可继续在主场作战，双方最近10次交..."
                                                     },
                                             @"publishDateText":@"06-18 20:19发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148006,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（19人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353807,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-18\n18:00",
                                                     @"versusText":@"仁川联队  1:1  尚州尚武",
                                                     @"analysisText":@"11连红，7连红，5连红，专注抗日……\n你知..."
                                                     },
                                             @"publishDateText":@"06-18 00:58发布",
                                             @"favourableCount":@3,
                                             @"negativeCount":@1,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148005,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（27人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353806,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-18\n18:00",
                                                     @"versusText":@"江原FC  2:1  济州联队",
                                                     @"analysisText":@"11连红，7连红，5连红，专注抗日……\n你知..."
                                                     },
                                             @"publishDateText":@"06-18 00:56发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148009,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（519人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353801,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"德国21  2:0  捷克21",
                                                     @"analysisText":@"北欧继续为大家带来剩下的两场白天场日韩联..."
                                                     },
                                             @"publishDateText":@"06-18 00:55发布",
                                             @"favourableCount":@4,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148004,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（29人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353412,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-18\n18:00",
                                                     @"versusText":@"草津溫泉  0:2  松本山雅",
                                                     @"analysisText":@"11连红，7连红，5连红，专注抗日……\n你知..."
                                                     },
                                             @"publishDateText":@"06-17 21:39发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148003,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（28人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353410,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-18\n17:30",
                                                     @"versusText":@"浦和红钻  2:4  磐田喜悦",
                                                     @"analysisText":@"11连红，7连红，5连红，专注抗日……\n你知..."
                                                     },
                                             @"publishDateText":@"06-17 21:38发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@1,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148002,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（26人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353408,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-18\n17:00",
                                                     @"versusText":@"水原三星  1:2  FC首尔",
                                                     @"analysisText":@"11连红，7连红，5连红，专注抗日……\n你知..."
                                                     },
                                             @"publishDateText":@"06-17 21:37发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148001,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（34人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353407,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-18\n17:00",
                                                     @"versusText":@"FC东京  0:1  横滨水手",
                                                     @"analysisText":@"11连红，7连红，5连红，专注抗日……\n你知..."
                                                     },
                                             @"publishDateText":@"06-17 21:35发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148017,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（553人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353313,
                                                     @"matchName":@"洲际杯",
                                                     @"matchDateText":@"06-19\n02:00",
                                                     @"versusText":@"喀麦隆  0:2  智利",
                                                     @"analysisText":@"卧槽，京都被绝杀，可惜??，北欧犹如战神附..."
                                                     },
                                             @"publishDateText":@"06-17 20:40发布",
                                             @"favourableCount":@5,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147014,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（15人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351124,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"大分三神  2:1  赞岐釜玉",
                                                     @"analysisText":@"你知道北欧有多疯狂！连续7连红，11连红，5..."
                                                     },
                                             @"publishDateText":@"06-16 20:02发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147013,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（16人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351122,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"冈山绿雉  1:1  FC岐阜",
                                                     @"analysisText":@"你知道北欧有多疯狂！连续7连红，11连红，5..."
                                                     },
                                             @"publishDateText":@"06-16 20:01发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147008,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（16人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351115,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"川崎前锋  1:0  广岛三箭",
                                                     @"analysisText":@"你知道北欧有多疯狂！连续7连红，11连红，5..."
                                                     },
                                             @"publishDateText":@"06-16 19:59发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147007,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（17人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351111,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"大阪樱花  1:1  清水鼓动",
                                                     @"analysisText":@"你知道北欧有多疯狂！连续7连红，11连红，5..."
                                                     },
                                             @"publishDateText":@"06-16 19:58发布",
                                             @"favourableCount":@3,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147006,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（679人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351109,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:30",
                                                     @"versusText":@"东京绿茵  3:3  爱嫒FC",
                                                     @"analysisText":@"你知道北欧有多疯狂！连续7连红，11连红，5..."
                                                     },
                                             @"publishDateText":@"06-16 19:56发布",
                                             @"favourableCount":@5,
                                             @"negativeCount":@3,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2144009,
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（2人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@347950,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-15\n08:45",
                                                     @"versusText":@"科林蒂安  1:0  克鲁塞罗",
                                                     @"analysisText":@"北欧每日经典推荐，天天有大肉，天天开心收..."
                                                     },
                                             @"publishDateText":@"06-14 14:40发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2143007,
                                             @"groupTitle":@"2017-06-14 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 120.10%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（19人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@345503,
                                                     @"matchName":@"国际友谊",
                                                     @"matchDateText":@"06-14\n01:45",
                                                     @"versusText":@"挪威  1:1  瑞典",
                                                     @"analysisText":@"草根大神，北欧每日经典推荐，天天有大肉。..."
                                                     },
                                             @"publishDateText":@"06-13 02:55发布",
                                             @"favourableCount":@6,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                               }
                                              },
                   @{
                       @"name":@"3072147",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170227193739465.png",
                       @"lastTenStatusText":@"近30天：78中52",
                       @"bio":@"每天都有推荐，连红之后更加稳推了。十年哥在各大上都有自己的独到见解，精心推荐分享，每一场赛事给大家。中过足彩一等奖，大家跟上我平均注。一定会赚大钱的。",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@3072147,
                                       @"name":@"3072147",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170227193739465.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"每天都有推荐，连红之后更加稳推了。十年哥在各大上都有自己的独到见解，精心推荐分享，每一场赛事给大家。中过足彩一等奖，大家跟上我平均注。一定会赚大钱的。",
                                       @"fansCount":@77,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=3072147"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@90.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@69.2
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@67.1
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@135.6
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@104.0
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@102.5
                                             }],
                               @"list":@[@{
                                             @"matchId":@2149005,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（2人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357191,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-20\n07:00",
                                                     @"versusText":@"克鲁塞罗  3:3  格雷米奥",
                                                     @"analysisText":@"实力赛事，十年哥鼎力分析推荐。右上角点订..."
                                                     },
                                             @"publishDateText":@"06-19 23:31发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149002,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（333人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357190,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n00:00",
                                                     @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-19 23:30发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@2,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148014,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355441,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"松达尔  0:0  奥德格伦兰",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-18 21:04发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148011,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355440,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"利勒斯特  1:0  维京",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-18 21:03发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148007,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354681,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-18\n22:00",
                                                     @"versusText":@"科里蒂巴  0:0  科林蒂安",
                                                     @"analysisText":@"实力赛事，十年哥鼎力分析推荐。右上角点订..."
                                                     },
                                             @"publishDateText":@"06-18 13:02发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148004,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354678,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-18\n18:00",
                                                     @"versusText":@"草津溫泉  0:2  松本山雅",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。最..."
                                                     },
                                             @"publishDateText":@"06-18 13:01发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148002,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（256人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354677,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-18\n17:00",
                                                     @"versusText":@"水原三星  1:2  FC首尔",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-18 13:01发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147007,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352791,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"大阪樱花  1:1  清水鼓动",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-17 14:56发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147006,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352789,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:30",
                                                     @"versusText":@"东京绿茵  3:3  爱嫒FC",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-17 14:56发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147004,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352783,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-17\n17:00",
                                                     @"versusText":@"浦项制铁  1:2  蔚山现代",
                                                     @"analysisText":@"实力赛事，十年哥鼎力分析推荐。右上角点订..."
                                                     },
                                             @"publishDateText":@"06-17 14:53发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147003,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352780,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:00",
                                                     @"versusText":@"横滨FC  0:1  山形山神",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。走..."
                                                     },
                                             @"publishDateText":@"06-17 14:53发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147002,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（52人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352779,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:00",
                                                     @"versusText":@"水户蜀葵  3:1  千叶市原",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-17 14:52发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146006,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351537,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n08:15",
                                                     @"versusText":@"班菲尔德  3:1  罗萨里奥",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-16 23:44发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146005,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351534,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n07:00",
                                                     @"versusText":@"塔勒瑞斯  0:1  拉普体操",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-16 23:44发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146001,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（38人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351532,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-17\n00:00",
                                                     @"versusText":@"瑞典21  0:0  英格兰21",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。 ..."
                                                     },
                                             @"publishDateText":@"06-16 23:43发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2145004,
                                             @"groupTitle":@"2017-06-16 星期五",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349757,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-16\n08:30",
                                                     @"versusText":@"科隆竞技  2:1  圣洛伦索",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-15 21:42发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2145002,
                                             @"groupTitle":@"2017-06-16 星期五",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349756,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-16\n08:00",
                                                     @"versusText":@"弗鲁米嫩塞  0:2  格雷米奥",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-15 21:42发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2145001,
                                             @"groupTitle":@"2017-06-16 星期五",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（95人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349755,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-16\n03:00",
                                                     @"versusText":@"科里蒂巴  0:0  巴伊亚",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-15 21:41发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2144010,
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@348636,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-15\n08:45",
                                                     @"versusText":@"桑托斯  1:0  帕尔梅拉斯",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。主..."
                                                     },
                                             @"publishDateText":@"06-14 23:31发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2141025,
                                             @"groupTitle":@"2017-06-11 星期日",
                                             @"lastTenStatusText":@"近10中9",
                                             @"profitText":@"盈利率 135.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"7连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@342993,
                                                     @"matchName":@"世青杯",
                                                     @"matchDateText":@"06-11\n14:30",
                                                     @"versusText":@"乌拉圭U20  0:0  意大利U20",
                                                     @"analysisText":@"经典赛事实力推介给大家，喜欢的关注我。乌..."
                                                     },
                                             @"publishDateText":@"06-11 11:08发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                               
                               }

                       },
                   @{
                       @"name":@"赌神125归来",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170530090117858.png",
                       @"lastTenStatusText":@"近30天：93中62",
                       @"bio":@"大家多一份关注，多一份信任，你的举手之劳，就是对我们最大的肯定。我们团队的价值观：责任，诚信，服务，奉献。希望大家都能关注我们，查看我们单子的朋友关注越多我的信心就会越足。我的团队长期研究足球彩票，对主要的联赛有着深刻的理解。我会以稳为主，本着对大家负责的态度。认真研究每场比赛。我不研究赔率，不想被庄家左右，跟着庄走。从对战，战意，近期状态，临场发挥，外界因素为出发点，给大家一个最接近比赛结果的推荐。彩客网站真的非常讲究信誉和原则，我以前的号被冻结了，原因是我没有按原则和规定分析，感谢彩客网的陪伴，这次我增加了团队，一定为大家，也为自己增加一份信心。",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@3143952,
                                       @"name":@"赌神125归来",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170530090117858.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"大家多一份关注，多一份信任，你的举手之劳，就是对我们最大的肯定。我们团队的价值观：责任，诚信，服务，奉献。希望大家都能关注我们，查看我们单子的朋友关注越多我的信心就会越足。我的团队长期研究足球彩票，对主要的联赛有着深刻的理解。我会以稳为主，本着对大家负责的态度。认真研究每场比赛。我不研究赔率，不想被庄家左右，跟着庄走。从对战，战意，近期状态，临场发挥，外界因素为出发点，给大家一个最接近比赛结果的推荐。彩客网站真的非常讲究信誉和原则，我以前的号被冻结了，原因是我没有按原则和规定分析，感谢彩客网的陪伴，这次我增加了团队，一定为大家，也为自己增加一份信心。",
                                       @"fansCount":@1157,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=3143952"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@70.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@68.6
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@66.3
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@109.2
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@114.3
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@111.4
                                             }],
                               @"list":@[@{
                                             @"matchId":@2151024,
                                             @"groupTitle":@"2017-06-22 星期四",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357456,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-22\n07:30",
                                                     @"versusText":@"华盛顿 VS 亚特联",
                                                     @"analysisText":@"最近状态来了，本场稳胆，必须红单，每天最..."
                                                     },
                                             @"publishDateText":@"06-20 07:57发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151021,
                                             @"groupTitle":@"2017-06-22 星期四",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357447,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-22\n06:10",
                                                     @"versusText":@"竞技 VS 科隆竞技",
                                                     @"analysisText":@"本场稳胆，必须见单，每天最少5中4，我推荐..."
                                                     },
                                             @"publishDateText":@"06-20 07:51发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151020,
                                             @"groupTitle":@"2017-06-22 星期四",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（4人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357436,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-22\n05:30",
                                                     @"versusText":@"CA坦波利 VS 防卫者",
                                                     @"analysisText":@"本场稳胆，最稳一胆，必须红单，每天最少5..."
                                                     },
                                             @"publishDateText":@"06-20 07:38发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150005,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（13人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357324,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-21\n08:15",
                                                     @"versusText":@"罗萨里奥 VS 塔勒瑞斯",
                                                     @"analysisText":@"近期状态非常好，主队，客队近期表现都不好..."
                                                     },
                                             @"publishDateText":@"06-20 01:27发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150004,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"免费查看",
                                             @"viewText":@"（482人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357317,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-21\n06:00",
                                                     @"versusText":@"拉普体操 VS 圣马丁",
                                                     @"analysisText":@"近期状态非常好，本场主队实力客队之上，客..."
                                                     },
                                             @"publishDateText":@"06-20 01:20发布",
                                             @"favourableCount":@4,
                                             @"negativeCount":@9,
                                             @"payMoney":@0,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149004,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（596人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356896,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n02:45",
                                                     @"versusText":@"波兰21  2:2  瑞典21",
                                                     @"analysisText":@" 今天最后一枚胆，送给大家，主队借助主场..."
                                                     },
                                             @"publishDateText":@"06-19 19:45发布",
                                             @"favourableCount":@9,
                                             @"negativeCount":@14,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149001,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"让负@[+1]",
                                             @"viewText":@"（37人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355941,
                                                     @"matchName":@"洲际杯",
                                                     @"matchDateText":@"06-19\n23:00",
                                                     @"versusText":@"澳大利亚  2:3  德国",
                                                     @"analysisText":@"内涵比分预测，赌神125团队强势回归，德国..."
                                                     },
                                             @"publishDateText":@"06-19 01:18发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@3,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149005,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（48人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355923,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-20\n07:00",
                                                     @"versusText":@"克鲁塞罗  3:3  格雷米奥",
                                                     @"analysisText":@"稳胆一枚，绝对稳胆，客队绝对今年巴甲冠军..."
                                                     },
                                             @"publishDateText":@"06-19 01:11发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@1,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149003,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（39人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355903,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-20\n01:00",
                                                     @"versusText":@"布兰  5:0  斯塔贝克",
                                                     @"analysisText":@"最稳的胆，本场必红，本场比赛主队实力雄厚..."
                                                     },
                                             @"publishDateText":@"06-19 01:05发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@2,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149002,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（951人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355887,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n00:00",
                                                     @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                     @"analysisText":@"赌神125团队强势回归，旅欧唐老师曾经17红1..."
                                                     },
                                             @"publishDateText":@"06-19 01:00发布",
                                             @"favourableCount":@8,
                                             @"negativeCount":@12,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148011,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（31人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353771,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"利勒斯特  1:0  维京",
                                                     @"analysisText":@"赌神125团队强势回归，旅欧唐老师曾经17红1..."
                                                     },
                                             @"publishDateText":@"06-18 00:42发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147033,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353766,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n07:20",
                                                     @"versusText":@"亚特联  3:1  哥伦布",
                                                     @"analysisText":@"赌神125团队强势回归，旅欧唐老师曾经17红1..."
                                                     },
                                             @"publishDateText":@"06-18 00:40发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148008,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（40人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353729,
                                                     @"matchName":@"洲际杯",
                                                     @"matchDateText":@"06-18\n23:00",
                                                     @"versusText":@"葡萄牙  2:2  墨西哥",
                                                     @"analysisText":@"赌神125团队强势回归，旅欧唐老师曾经17红1..."
                                                     },
                                             @"publishDateText":@"06-18 00:25发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@1,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148017,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（25人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353714,
                                                     @"matchName":@"洲际杯",
                                                     @"matchDateText":@"06-19\n02:00",
                                                     @"versusText":@"喀麦隆  0:2  智利",
                                                     @"analysisText":@"赌神125团队强势回归，旅欧唐老师曾经17红1..."
                                                     },
                                             @"publishDateText":@"06-18 00:19发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148009,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（889人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353684,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"德国21  2:0  捷克21",
                                                     @"analysisText":@"赌神125团队强势回归，旅欧唐老师曾经17红1..."
                                                     },
                                             @"publishDateText":@"06-18 00:11发布",
                                             @"favourableCount":@6,
                                             @"negativeCount":@9,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147041,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（22人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352232,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n10:00",
                                                     @"versusText":@"盐湖城  1:0  明尼苏达",
                                                     @"analysisText":@"稳胆，一定要看哟，全部稳稳命中，欧洲唐老..."
                                                     },
                                             @"publishDateText":@"06-17 11:05发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@2,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147027,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（23人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352222,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-18\n03:00",
                                                     @"versusText":@"戈竞技  0:1  巴竞技",
                                                     @"analysisText":@"稳胆，一定要看哟，全部稳稳命中，欧洲唐老..."
                                                     },
                                             @"publishDateText":@"06-17 11:01发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2146003,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（479人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349578,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n04:45",
                                                     @"versusText":@"圣马丁  0:1  CA坦波利",
                                                     @"analysisText":@" 赌神125强势回归，17中16的唐老师从欧洲火..."
                                                     },
                                             @"publishDateText":@"06-15 18:59发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@10,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146005,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.20%",
                                             @"satificationText":@"满意度 98.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（373人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349573,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n07:00",
                                                     @"versusText":@"塔勒瑞斯  0:1  拉普体操",
                                                     @"analysisText":@" 赌神125强势回归，17中16的唐老师从欧洲火..."
                                                     },
                                             @"publishDateText":@"06-15 18:55发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@13,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                                   }
                       },
                   @{
                       @"name":@"今晚二串一稳的",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170406144250740.png",
                       @"lastTenStatusText":@"近30天：121中80",
                       @"bio":@"5大联赛连续18轮不黑单！杯赛、亚联80%保本率，赢多输少！实力见证一切！ 我对庄家对于每场比赛的手法、盘口的研究分析已经熟透了！希望同大家一起保持长久的盈利！本月发单35中30失5，前17场连中，17连红佳绩，本月命中率85.7%，今晚二串一稳的，殿堂级理财专家，你的收米机器。2017.4.12   本月状态奇佳，疯狂收米，2017.5.11，近27失4，48失8，平均sp＞1.7，比推荐名家更癫狂，2017.6.18",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@2991413,
                                       @"name":@"今晚二串一稳的",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170406144250740.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"5大联赛连续18轮不黑单！杯赛、亚联80%保本率，赢多输少！实力见证一切！ 我对庄家对于每场比赛的手法、盘口的研究分析已经熟透了！希望同大家一起保持长久的盈利！本月发单35中30失5，前17场连中，17连红佳绩，本月命中率85.7%，今晚二串一稳的，殿堂级理财专家，你的收米机器。2017.4.12   本月状态奇佳，疯狂收米，2017.5.11，近27失4，48失8，平均sp＞1.7，比推荐名家更癫狂，2017.6.18",
                                       @"fansCount":@953,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=2991413"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@70.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@69.4
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@65.5
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@94.7
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@112.4
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@104.4
                                             }],
                               @"list":@[@{
                                             @"matchId":@2151028,
                                             @"groupTitle":@"2017-06-22 星期四",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357776,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-22\n08:30",
                                                     @"versusText":@"河床 VS 阿多西维",
                                                     @"analysisText":@"今晚二串一稳的 (阿甲爆血版)\n河床持续低迷..."
                                                     },
                                             @"publishDateText":@"06-20 12:36发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151023,
                                             @"groupTitle":@"2017-06-22 星期四",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357774,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-22\n06:45",
                                                     @"versusText":@"奥林匹奥 VS 博卡",
                                                     @"analysisText":@"今晚二串一稳的 (阿甲爆血版)\n主队具备保级..."
                                                     },
                                             @"publishDateText":@"06-20 12:35发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151014,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（2人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357760,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-21\n18:30",
                                                     @"versusText":@"蔚山现代 VS 济州联队",
                                                     @"analysisText":@"今晚二串一稳的 (k联赛精华版)\n济州上轮输..."
                                                     },
                                             @"publishDateText":@"06-20 12:26发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151012,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357756,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-21\n18:30",
                                                     @"versusText":@"FC首尔 VS 大邱FC",
                                                     @"analysisText":@"今晚二串一稳的 (k联赛精华版)\n首尔近期状..."
                                                     },
                                             @"publishDateText":@"06-20 12:24发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151010,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"免费查看",
                                             @"viewText":@"（45人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357753,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"全北现代 VS 江原FC",
                                                     @"analysisText":@"在持续癫狂之后，这两天状态略有低迷，今天..."
                                                     },
                                             @"publishDateText":@"06-20 12:23发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151002,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357089,
                                                     @"matchName":@"日皇杯",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"町田泽维 VS 大分三神",
                                                     @"analysisText":@"今晚二串一稳的 (抗日A计划)\n町田主场表现..."
                                                     },
                                             @"publishDateText":@"06-19 22:20发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151001,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357082,
                                                     @"matchName":@"日皇杯",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"爱嫒FC VS 赞岐釜玉",
                                                     @"analysisText":@"今晚二串一稳的 (抗日A计划)\n爱媛各方面优..."
                                                     },
                                             @"publishDateText":@"06-19 22:17发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149005,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（6人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356630,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-20\n07:00",
                                                     @"versusText":@"克鲁塞罗  3:3  格雷米奥",
                                                     @"analysisText":@"今晚二串一稳的\n克鲁塞罗最近表现不佳，最..."
                                                     },
                                             @"publishDateText":@"06-19 16:18发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149002,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（6人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356627,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n00:00",
                                                     @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                     @"analysisText":@"今晚二串一稳的 \n斯洛伐克U21今届与英格兰U..."
                                                     },
                                             @"publishDateText":@"06-19 16:17发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150001,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"免费查看",
                                             @"viewText":@"（406人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356613,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-21\n00:00",
                                                     @"versusText":@"塞尔维21 VS 马其顿21",
                                                     @"analysisText":@"今晚二串一稳的\n由于同组中的西班牙U21以及..."
                                                     },
                                             @"publishDateText":@"06-19 16:07发布",
                                             @"favourableCount":@3,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148028,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（23人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354624,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-19\n06:00",
                                                     @"versusText":@"累体育  1:3  维多利亚",
                                                     @"analysisText":@"今晚二串一稳的 (综合版豪华套)\n天时地利人..."
                                                     },
                                             @"publishDateText":@"06-18 12:24发布",
                                             @"favourableCount":@3,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148027,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（23人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354623,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-19\n05:00",
                                                     @"versusText":@"费城  0:2  纽约红牛",
                                                     @"analysisText":@"今晚二串一稳的 (综合版豪华套)\n天时地利人..."
                                                     },
                                             @"publishDateText":@"06-18 12:23发布",
                                             @"favourableCount":@3,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148026,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（24人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354619,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-19\n04:15",
                                                     @"versusText":@"河床  2:3  竞技",
                                                     @"analysisText":@"今晚二串一稳的 (综合版豪华套)\n天时地利人..."
                                                     },
                                             @"publishDateText":@"06-18 12:23发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2146005,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349981,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n07:00",
                                                     @"versusText":@"塔勒瑞斯  0:1  拉普体操",
                                                     @"analysisText":@"今晚二串一稳的 (巴甲加强版)\n阿甲联赛收官..."
                                                     },
                                             @"publishDateText":@"06-15 23:58发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146004,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（7人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349966,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n06:00",
                                                     @"versusText":@"飓风队  1:0  圣塔菲联",
                                                     @"analysisText":@"今晚二串一稳的 (巴甲加强版)\n阿甲联赛收官..."
                                                     },
                                             @"publishDateText":@"06-15 23:54发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146002,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（9人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349490,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-17\n02:45",
                                                     @"versusText":@"波兰21  1:2  斯洛伐21",
                                                     @"analysisText":@"今晚二串一稳的   (欧青赛航母版)\n波兰主场..."
                                                     },
                                             @"publishDateText":@"06-15 17:42发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146001,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 94.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"viewText":@"（9人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349488,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-17\n00:00",
                                                     @"versusText":@"瑞典21  0:0  英格兰21",
                                                     @"analysisText":@"今晚二串一稳的   (欧青赛航母版)\n这场比赛..."
                                                     },
                                             @"publishDateText":@"06-15 17:41发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                               
                               }
                       },
                   @{
                       @"name":@"789竞彩推荐",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170521210104408.png",
                       @"lastTenStatusText":@"近30天：84中55",
                       @"bio":@"789竞彩专业网络团队，团队成员遍布全国各大城市，这里没有媒体编辑，没有平台主播，没有操盘手，也没有数学系，经济学博士，只有草根。团队目前15人，均有10年左右的博彩经验，有曾经网络超级带单大神，有足彩大奖获得者，也有曾经输的裤衩都没的超级赌徒，更有彩票店Boss，每天大家都会精选赛事相互探讨，确定最佳的串关倍投方案，风险平摊，盈利共享，今年前5月已累计投入本金约500万元，盈利180万，人均盈利12万，足球是博弈，更是理财，团队的理念是，不求一朝一夕暴富，综合稳定的回报才是关键，从目前发展情况来看，年回报率在36%，相信随着后期的深入，综合年回报率可以提升到50%，欢迎长期跟单！",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@2812012,
                                       @"name":@"2812012",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170410144057971.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"每天实单推荐，红黑与共！月命中榜前列。新年后手风颇顺，擅长对小组出线形势，杯赛战意，升降级形式的分析，国际比赛各国家队战力状态的捉摸，盘口变化\r\n等，希望帮助大家稳步红单！",
                                       @"fansCount":@533,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=2812012"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@70.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@80.0
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@64.7
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@109.7
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@127.0
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@101.4
                                             }],
                               @"list":@[@{
                                             @"matchId":@2150003,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357639,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-21\n05:00",
                                                     @"versusText":@"圣洛伦索 VS 班菲尔德",
                                                     @"analysisText":@"圣洛伦索上赛季阿甲第二，本赛季由于有解放..."
                                                     },
                                             @"publishDateText":@"06-20 10:25发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151010,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"免费查看",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（31人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357635,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"全北现代 VS 江原FC",
                                                     @"analysisText":@"全北现代由于被剥夺了本届亚冠参赛资格，所..."
                                                     },
                                             @"publishDateText":@"06-20 10:22发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150001,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356681,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-21\n00:00",
                                                     @"versusText":@"塞尔维21 VS 马其顿21",
                                                     @"analysisText":@"两只球队首轮都完败，本轮不胜就要打道回府..."
                                                     },
                                             @"publishDateText":@"06-19 16:53发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149002,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356091,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n00:00",
                                                     @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                     @"analysisText":@"斯洛伐克虽然赛前不被看好，但首轮大跌眼镜..."
                                                     },
                                             @"publishDateText":@"06-19 06:07发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149003,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（383人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356090,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-20\n01:00",
                                                     @"versusText":@"布兰  5:0  斯塔贝克",
                                                     @"analysisText":@"上赛季升班马赛季布兰发挥一般，总算站稳了..."
                                                     },
                                             @"publishDateText":@"06-19 06:01发布",
                                             @"favourableCount":@3,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149005,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354517,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-20\n07:00",
                                                     @"versusText":@"克鲁塞罗  3:3  格雷米奥",
                                                     @"analysisText":@"本赛季格雷米奥有点不想陪太子读书的意味，..."
                                                     },
                                             @"publishDateText":@"06-18 11:31发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148026,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354515,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-19\n04:15",
                                                     @"versusText":@"河床  2:3  竞技",
                                                     @"analysisText":@"争冠进入白热化，排名三甲的另外两只球队都..."
                                                     },
                                             @"publishDateText":@"06-18 11:29发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148008,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（8人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354512,
                                                     @"matchName":@"洲际杯",
                                                     @"matchDateText":@"06-18\n23:00",
                                                     @"versusText":@"葡萄牙  2:2  墨西哥",
                                                     @"analysisText":@"C罗和小豌豆埃尔南德斯领衔的两支劲旅相遇..."
                                                     },
                                             @"publishDateText":@"06-18 11:26发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148022,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（3人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354510,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-19\n03:00",
                                                     @"versusText":@"弗鲁米嫩塞  2:2  弗拉门戈",
                                                     @"analysisText":@"弗拉门戈上赛季惊艳落幕，本赛季球队引援力..."
                                                     },
                                             @"publishDateText":@"06-18 11:23发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148017,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（717人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354504,
                                                     @"matchName":@"洲际杯",
                                                     @"matchDateText":@"06-19\n02:00",
                                                     @"versusText":@"喀麦隆  0:2  智利",
                                                     @"analysisText":@"擅长的国际赛又来了，本届联合会杯以东道主..."
                                                     },
                                             @"publishDateText":@"06-18 11:19发布",
                                             @"favourableCount":@5,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148012,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（2人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353529,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"莫尔德  3:0  特罗姆瑟",
                                                     @"analysisText":@"莫尔德作为曾经的挪超班霸，近几个赛季有所..."
                                                     },
                                             @"publishDateText":@"06-17 22:45发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148010,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353520,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"海于格松  1:0  罗森博格",
                                                     @"analysisText":@"罗森博格近期走势有点回落，这和挪超巨无霸..."
                                                     },
                                             @"publishDateText":@"06-17 22:42发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147022,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（444人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353509,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-18\n00:00",
                                                     @"versusText":@"葡萄牙21  2:0  塞尔维21",
                                                     @"analysisText":@"葡萄牙近几年十分重视青训，青年队成绩提升..."
                                                     },
                                             @"publishDateText":@"06-17 22:39发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2140007,
                                             @"groupTitle":@"2017-06-11 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@340687,
                                                     @"matchName":@"欧洲预选",
                                                     @"matchDateText":@"06-11\n00:00",
                                                     @"versusText":@"苏格兰  2:2  英格兰",
                                                     @"analysisText":@"本人精通的国际赛到了，两兄弟内斗，三狮军..."
                                                     },
                                             @"publishDateText":@"06-10 07:26发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2140009,
                                             @"groupTitle":@"2017-06-11 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 109.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"3连红",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@340684,
                                                     @"matchName":@"欧洲预选",
                                                     @"matchDateText":@"06-11\n02:45",
                                                     @"versusText":@"挪威  1:1  捷克",
                                                     @"analysisText":@"挪威近几年大赛经验一般，人才匮乏，客队涌..."
                                                     },
                                             @"publishDateText":@"06-10 07:22发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                               }
                       },
//                   @{
//                       @"name":@"opfuck",
//                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170512031712763.png",
//                       @"lastTenStatusText":@"近30天：100中65",
//                       @"bio":@"感谢大家支持，op每天坚持用最好的状态推荐稳健的赛事，和大家一起分享胜利的喜悦。……",
//                       
//                    },
                   @{
                       @"name":@"jackyi",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20161224182649794.png",
                       @"lastTenStatusText":@"近30天：71中46",
                       @"bio":@"如果是一场友谊赛、杯赛、一周双赛、欧冠赛前后日，你还要仅仅停留在基本面强弱，或赔率高低表现去选择赛果，可以说，会挂得很惨！基本面分析综合亚赔分析，还要看比赛的意义和现金流向受热情度。足球是圆的还要加点运气哦。投资策略保持每次下注资金均注。认同的朋友就关注一下。\n",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@1275733,
                                       @"name":@"jackyi",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20161224182649794.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"如果是一场友谊赛、杯赛、一周双赛、欧冠赛前后日，你还要仅仅停留在基本面强弱，或赔率高低表现去选择赛果，可以说，会挂得很惨！基本面分析综合亚赔分析，还要看比赛的意义和现金流向受热情度。足球是圆的还要加点运气哦。投资策略保持每次下注资金均注。认同的朋友就关注一下。\n",
                                       @"fansCount":@172,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=1275733"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@80.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@80.0
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@64.6
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@123.7
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@122.9
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@99.6
                                             }],
                               @"list":@[@{
                                             @"matchId":@2151015,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（11人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357536,
                                                     @"matchName":@"洲际杯",
                                                     @"matchDateText":@"06-21\n23:00",
                                                     @"versusText":@"俄罗斯 VS 葡萄牙",
                                                     @"analysisText":@"本场各大主流亚赔亚盘初开半一、半球比较混..."
                                                     },
                                             @"publishDateText":@"06-20 09:14发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2151010,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"免费查看",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（78人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357506,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-21\n18:00",
                                                     @"versusText":@"全北现代 VS 江原FC",
                                                     @"analysisText":@"排名第一和排名第三对战，两队战意都是十足..."
                                                     },
                                             @"publishDateText":@"06-20 08:43发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148011,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（338人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355415,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"利勒斯特  1:0  维京",
                                                     @"analysisText":@"两队最近六次交战利勒斯特罗姆1胜2平3负不..."
                                                     },
                                             @"publishDateText":@"06-18 20:50发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148008,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（548人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355341,
                                                     @"matchName":@"洲际杯",
                                                     @"matchDateText":@"06-18\n23:00",
                                                     @"versusText":@"葡萄牙  2:2  墨西哥",
                                                     @"analysisText":@"葡萄牙会处在热卖一方，澳彩却中途降盘吸纳..."
                                                     },
                                             @"publishDateText":@"06-18 20:11发布",
                                             @"favourableCount":@3,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148009,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（213人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355310,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"德国21  2:0  捷克21",
                                                     @"analysisText":@"捷克近4场友谊赛全胜，状态出色。他们在预..."
                                                     },
                                             @"publishDateText":@"06-18 19:48发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147038,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（192人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353356,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n09:00",
                                                     @"versusText":@"圣何塞  0:0  堪萨斯城",
                                                     @"analysisText":@"圣何塞地震两大主力中场赛伦，乌雷尼亚本场..."
                                                     },
                                             @"publishDateText":@"06-17 21:11发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147033,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（11人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353319,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n07:20",
                                                     @"versusText":@"亚特联  3:1  哥伦布",
                                                     @"analysisText":@"亚特兰大联主场3胜2负，最近主场各项赛事是..."
                                                     },
                                             @"publishDateText":@"06-17 20:46发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147002,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（83人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352425,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:00",
                                                     @"versusText":@"水户蜀葵  3:1  千叶市原",
                                                     @"analysisText":@"千叶市原上轮联赛主场0-0闷平领头羊福冈黄..."
                                                     },
                                             @"publishDateText":@"06-17 12:08发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147018,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（115人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352161,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"金泽塞维  3:2  山口雷诺",
                                                     @"analysisText":@"亚洲盘口方面，各大菠菜普遍都为金泽开出平..."
                                                     },
                                             @"publishDateText":@"06-17 10:19发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147009,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（150人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352115,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"新泻天鹅  1:2  大宫松鼠",
                                                     @"analysisText":@"上一轮对阵鸟栖沙岩是大宫在换帅后的第一场..."
                                                     },
                                             @"publishDateText":@"06-17 09:53发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146005,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（30人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351361,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n07:00",
                                                     @"versusText":@"塔勒瑞斯  0:1  拉普体操",
                                                     @"analysisText":@"亚洲数据普遍开出主让半球的盘口，主队虽然..."
                                                     },
                                             @"publishDateText":@"06-16 22:19发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146006,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（54人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351101,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n08:15",
                                                     @"versusText":@"班菲尔德  3:1  罗萨里奥",
                                                     @"analysisText":@"    基本面来看，主队积分排名更高，主场成..."
                                                     },
                                             @"publishDateText":@"06-16 19:49发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2145002,
                                             @"groupTitle":@"2017-06-16 星期五",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（73人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@349736,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-16\n08:00",
                                                     @"versusText":@"弗鲁米嫩塞  0:2  格雷米奥",
                                                     @"analysisText":@"基本面来看，弗鲁米嫩塞积分排名、状态、往..."
                                                     },
                                             @"publishDateText":@"06-15 21:27发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2144003,
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（16人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@348627,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-15\n06:30",
                                                     @"versusText":@"维多利亚  2:2  博塔弗戈",
                                                     @"analysisText":@"维多利亚上场击败米内罗竞技取得联赛首胜，..."
                                                     },
                                             @"publishDateText":@"06-14 23:25发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2144006,
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（54人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@348108,
                                                     @"matchName":@"美公开赛",
                                                     @"matchDateText":@"06-15\n08:00",
                                                     @"versusText":@"纽约红牛  1:0  纽约城",
                                                     @"analysisText":@"纽约红牛将在美国公开赛杯第4轮主场迎战纽..."
                                                     },
                                             @"publishDateText":@"06-14 16:44发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2144004,
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（55人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@348080,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-15\n06:30",
                                                     @"versusText":@"累西腓体育  0:0  圣保罗",
                                                     @"analysisText":@"亚盘以平手起步，以累西腓体育本赛季强势的..."
                                                     },
                                             @"publishDateText":@"06-14 16:36发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2143010,
                                             @"groupTitle":@"2017-06-14 星期三",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（57人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@346138,
                                                     @"matchName":@"亚洲预选",
                                                     @"matchDateText":@"06-14\n03:00",
                                                     @"versusText":@"卡塔尔  3:2  韩国",
                                                     @"analysisText":@"卡塔尔输给乌兹别克之后，卡塔尔失去了直接..."
                                                     },
                                             @"publishDateText":@"06-13 13:49发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2142001,
                                             @"groupTitle":@"2017-06-13 星期二",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（165人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@345159,
                                                     @"matchName":@"国际友谊",
                                                     @"matchDateText":@"06-13\n00:00",
                                                     @"versusText":@"白俄罗斯  1:0  新西兰",
                                                     @"analysisText":@"白俄罗斯最近一次大名单集结以新人为主，第..."
                                                     },
                                             @"publishDateText":@"06-12 20:53发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@1,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2136001,
                                             @"groupTitle":@"2017-06-06 星期二",
                                             @"lastTenStatusText":@"近10中8",
                                             @"profitText":@"盈利率 123.70%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"serialRedText":@"8连红",
                                             @"viewText":@"（33人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@335032,
                                                     @"matchName":@"韩足总",
                                                     @"matchDateText":@"06-06\n18:00",
                                                     @"versusText":@"济州联队  0:2  水原三星",
                                                     @"analysisText":@"济州联上周亚冠在两球领先的情况下与红钻鏖..."
                                                     },
                                             @"publishDateText":@"06-06 16:57发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                               
                               }
                       },
                   @{
                       @"name":@"cym2110myc",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170517084137750.png",
                       @"lastTenStatusText":@"近30天：82中52",
                       @"bio":@"研究足彩多年，积累了丰富经验。主要通过亚盘分析，总结出了一套独特分析方法。并且多次抓住大冷门，比较擅长英超，西甲，德甲！",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@2675917,
                                       @"name":@"cym2110myc",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170517084137750.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"研究足彩多年，积累了丰富经验。主要通过亚盘分析，总结出了一套独特分析方法。并且多次抓住大冷门，比较擅长英超，西甲，德甲！",
                                       @"fansCount":@153,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=2675917"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@50.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@55.0
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@61.7
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@82.0
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@100.8
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@109.0
                                             }],
                               @"list":@[@{
                                             @"matchId":@2149005,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357166,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-20\n07:00",
                                                     @"versusText":@"克鲁塞罗  3:3  格雷米奥",
                                                     @"analysisText":@"克鲁塞罗主场迎战格雷米奥，主队本赛季主场..."
                                                     },
                                             @"publishDateText":@"06-19 23:14发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149002,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（40人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357165,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n00:00",
                                                     @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                     @"analysisText":@"英格兰做客斯洛伐克，客队本次欧青赛整体实..."
                                                     },
                                             @"publishDateText":@"06-19 23:13发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148023,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355681,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-19\n03:00",
                                                     @"versusText":@"圣保罗  1:2  米竞技",
                                                     @"analysisText":@"圣保罗主场迎战米内罗竞技，主队本赛季攻击..."
                                                     },
                                             @"publishDateText":@"06-18 23:39发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148021,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355680,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-19\n03:00",
                                                     @"versusText":@"沙佩科  0:2  博塔弗戈",
                                                     @"analysisText":@"沙佩科恩主场迎战博塔弗戈，主队作为本赛季..."
                                                     },
                                             @"publishDateText":@"06-18 23:38发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148020,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355679,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-19\n03:00",
                                                     @"versusText":@"巴伊亚  2:4  帕梅拉斯",
                                                     @"analysisText":@"巴伊亚主场迎战帕尔梅，主队本赛季主场豪取..."
                                                     },
                                             @"publishDateText":@"06-18 23:38发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148010,
                                             @"groupTitle":@"2017-06-19 星期一",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（52人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355678,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-19\n00:00",
                                                     @"versusText":@"海于格松  1:0  罗森博格",
                                                     @"analysisText":@"罗森伯格做客海于格松，客队本赛季近几轮受..."
                                                     },
                                             @"publishDateText":@"06-18 23:38发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147029,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353621,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-18\n04:15",
                                                     @"versusText":@"拉斐拉  1:1  基尔梅斯",
                                                     @"analysisText":@"拉菲拉竞技主场迎战基尔梅斯，主队目前排名..."
                                                     },
                                             @"publishDateText":@"06-17 23:49发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147035,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@353620,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n07:30",
                                                     @"versusText":@"新英格兰  1:2  芝加哥",
                                                     @"analysisText":@"芝加哥做客新英格兰，客队本赛季客场作战能..."
                                                     },
                                             @"publishDateText":@"06-17 23:49发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },   @{
                                             @"matchId":@2139004,
                                             @"groupTitle":@"2017-06-10 星期六",
                                             @"lastTenStatusText":@"近10中5",
                                             @"profitText":@"盈利率 82.00%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[-3]",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@340297,
                                                     @"matchName":@"欧洲预选",
                                                     @"matchDateText":@"06-10\n02:45",
                                                     @"versusText":@"荷兰  5:0  卢森堡",
                                                     @"analysisText":@"荷兰主场迎战卢森堡，主队最近两场友谊赛表..."
                                                     },
                                             @"publishDateText":@"06-09 23:24发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                               }
                       
                       },
                   @{
                       @"name":@"等雪的叶子",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170527174537230.png",
                       @"lastTenStatusText":@"近30天：90中57",
                       @"bio":@"来这里的都是久经沙场、学“”球“”五车、“”财“”高八斗的江湖人士！我们的初衷都一样！不要讲太多的大道理！赢者王、输者寇！能实现每月赢利、每年赢利的就是智者，就是魔法无边！\n有些大红没赢到钱！有些小红却能赢遍！\n面对庄稼！\n面对设置的赔率！\n面对盘口！\n面对胜平负！\n面对基本面！\n面对媒体的假信息！\n面对战意！\n面对那么多、那么多的推荐！\n去掉“”心魔”！才能红遍彩市！",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@2984010,
                                       @"name":@"等雪的叶子",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170527174537230.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"来这里的都是久经沙场、学“”球“”五车、“”财“”高八斗的江湖人士！我们的初衷都一样！不要讲太多的大道理！赢者王、输者寇！能实现每月赢利、每年赢利的就是智者，就是魔法无边！\n有些大红没赢到钱！有些小红却能赢遍！\n面对庄稼！\n面对设置的赔率！\n面对盘口！\n面对胜平负！\n面对基本面！\n面对媒体的假信息！\n面对战意！\n面对那么多、那么多的推荐！\n去掉“”心魔”！才能红遍彩市！",
                                       @"fansCount":@224,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=2984010"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@90.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@73.7
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@63.5
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@151.2
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@134.9
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@113.0
                                             }],
                                   @"list":@[@{
                                                 @"matchId":@2149002,
                                                 @"groupTitle":@"2017-06-20 星期二",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"负",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（508人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@356619,
                                                         @"matchName":@"欧青U21",
                                                         @"matchDateText":@"06-20\n00:00",
                                                         @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                         @"analysisText":@"从赔率盘口到必发各项数据变化情况，综合凯..."
                                                         },
                                                 @"publishDateText":@"06-19 16:11发布",
                                                 @"favourableCount":@1,
                                                 @"negativeCount":@1,
                                                 @"payMoney":@0,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2148027,
                                                 @"groupTitle":@"2017-06-19 星期一",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"让负@[-1]",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（2人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@355699,
                                                         @"matchName":@"美职业",
                                                         @"matchDateText":@"06-19\n05:00",
                                                         @"versusText":@"费城  0:2  纽约红牛",
                                                         @"analysisText":@"主队排名十八，客队排名十二，从历史交锋情..."
                                                         },
                                                 @"publishDateText":@"06-18 23:50发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2148025,
                                                 @"groupTitle":@"2017-06-19 星期一",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"胜",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（2人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@355698,
                                                         @"matchName":@"阿甲",
                                                         @"matchDateText":@"06-19\n04:00",
                                                         @"versusText":@"防卫者  3:0  图库曼",
                                                         @"analysisText":@"主队排名十三，客队排名四十九，从赔率盘口..."
                                                         },
                                                 @"publishDateText":@"06-18 23:49发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2148014,
                                                 @"groupTitle":@"2017-06-19 星期一",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"让胜@[+1]",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（49人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@355697,
                                                         @"matchName":@"挪超",
                                                         @"matchDateText":@"06-19\n00:00",
                                                         @"versusText":@"松达尔  0:0  奥德格伦兰",
                                                         @"analysisText":@"主队排名第九，客队排名第四，从两队历史交..."
                                                         },
                                                 @"publishDateText":@"06-18 23:48发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@0,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2147024,
                                                 @"groupTitle":@"2017-06-18 星期日",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"让负@[-1]",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（2人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@353537,
                                                         @"matchName":@"阿甲",
                                                         @"matchDateText":@"06-18\n01:00",
                                                         @"versusText":@"萨兰迪兵工厂  1:2  戈多伊",
                                                         @"analysisText":@"主队排名二十八，客队排名十五，从两队历史..."
                                                         },
                                                 @"publishDateText":@"06-17 22:51发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2147022,
                                                 @"groupTitle":@"2017-06-18 星期日",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"胜",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（2人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@353536,
                                                         @"matchName":@"欧青U21",
                                                         @"matchDateText":@"06-18\n00:00",
                                                         @"versusText":@"葡萄牙21  2:0  塞尔维21",
                                                         @"analysisText":@"主队葡萄牙青年队，客队塞尔维青年队，从两..."
                                                         },
                                                 @"publishDateText":@"06-17 22:49发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2147004,
                                                 @"groupTitle":@"2017-06-17 星期六",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"胜",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（2人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@352994,
                                                         @"matchName":@"韩K联",
                                                         @"matchDateText":@"06-17\n17:00",
                                                         @"versusText":@"浦项制铁  1:2  蔚山现代",
                                                         @"analysisText":@"主队排名第三，客队排名第四，从两队历史交..."
                                                         },
                                                 @"publishDateText":@"06-17 16:28发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@false,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2147003,
                                                 @"groupTitle":@"2017-06-17 星期六",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"让负@[-1]",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（2人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@352990,
                                                         @"matchName":@"日职乙",
                                                         @"matchDateText":@"06-17\n17:00",
                                                         @"versusText":@"横滨FC  0:1  山形山神",
                                                         @"analysisText":@"从历史交锋情况来看，综合两队排名相差五个..."
                                                         },
                                                 @"publishDateText":@"06-17 16:27发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2147001,
                                                 @"groupTitle":@"2017-06-17 星期六",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"胜",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（118人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@352426,
                                                         @"matchName":@"日职乙",
                                                         @"matchDateText":@"06-17\n13:00",
                                                         @"versusText":@"福冈黄蜂  3:1  名古屋鲸",
                                                         @"analysisText":@"主客两队从赔率盘口到排名相差以及临场前的..."
                                                         },
                                                 @"publishDateText":@"06-17 12:09发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@0,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2146006,
                                                 @"groupTitle":@"2017-06-17 星期六",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"胜",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（3人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@350575,
                                                         @"matchName":@"阿甲",
                                                         @"matchDateText":@"06-17\n08:15",
                                                         @"versusText":@"班菲尔德  3:1  罗萨里奥",
                                                         @"analysisText":@"主队班菲尔德排名第三，客队罗萨里奥排名十..."
                                                         },
                                                 @"publishDateText":@"06-16 13:13发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }, @{
                                                 @"matchId":@2146005,
                                                 @"groupTitle":@"2017-06-17 星期六",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"胜",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（3人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@350571,
                                                         @"matchName":@"阿甲",
                                                         @"matchDateText":@"06-17\n07:00",
                                                         @"versusText":@"塔勒瑞斯  0:1  拉普体操",
                                                         @"analysisText":@"主队排名十二，客队排名十四，两队相差二个..."
                                                         },
                                                 @"publishDateText":@"06-16 13:08发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@false,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 },   @{
                                                 @"matchId":@2138011,
                                                 @"groupTitle":@"2017-06-08 星期四",
                                                 @"lastTenStatusText":@"近10中9",
                                                 @"profitText":@"盈利率 151.20%",
                                                 @"satificationText":@"满意度 99.00%",
                                                 @"recommendText":@"负",
                                                 @"serialRedText":@"7连红",
                                                 @"viewText":@"（1人查看）",
                                                 @"recommendInfo":@{
                                                         @"id":@338165,
                                                         @"matchName":@"世青杯",
                                                         @"matchDateText":@"06-08\n19:00",
                                                         @"versusText":@"意大利U20  1:3  英格兰U20",
                                                         @"analysisText":@"从赔率盘口到临场前的赔率盘口调水变化情况..."
                                                         },
                                                 @"publishDateText":@"06-08 18:42发布",
                                                 @"favourableCount":@0,
                                                 @"negativeCount":@0,
                                                 @"payMoney":@10,
                                                 @"isWon":@true,
                                                 @"isPaid":@true,
                                                 @"isFreeLimit":@false,
                                                 @"voiceSecond":@0,
                                                 @"viewCount":@0
                                                 }],
                                   }
                       },
                   @{
                       @"name":@"3020715",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170512092835044.png",
                       @"lastTenStatusText":@"近30天：61中34",
                       @"bio":@"从事彩票行业6年有余。",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@2781706,
                                       @"name":@"2781706",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20161004224213810.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"继续大奶，晚点出单，足彩世界，以小博大，博大精深，！！本人在足彩世界，喜欢高赔，不求全红，只求以最小的投资，博到大的回报！！！\n    足球是圆的，什么结果都有可能，奉劝大家心态要好，量力而行\n    足坛的水没人知道有多深，但我们一定要知道自己能入多深，切勿越陷越深，喜欢的多关注，谢谢！！！！！",
                                       @"fansCount":@52,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=2781706"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@60.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@47.4
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@40.5
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@170.3
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@135.2
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@110.7
                                             }],
                               @"list":@[@{
                                             @"matchId":@2150003,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 170.30%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357703,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-21\n05:00",
                                                     @"versusText":@"圣洛伦索 VS 班菲尔德",
                                                     @"analysisText":@"！！！！！！！！！！！大奶，实单推荐，本..."
                                                     },
                                             @"publishDateText":@"06-20 11:28发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150002,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 170.30%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357698,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-21\n02:45",
                                                     @"versusText":@"葡萄牙21 VS 西班牙21",
                                                     @"analysisText":@"！！！！！！！！！！！！西班牙做客，亚盘..."
                                                     },
                                             @"publishDateText":@"06-20 11:22发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150004,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 170.30%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"￥10查看",
                                             @"viewText":@"（1人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357685,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-21\n06:00",
                                                     @"versusText":@"拉普体操 VS 圣马丁",
                                                     @"analysisText":@"！！！！！！！！！继续大奶，今天感觉稳点..."
                                                     },
                                             @"publishDateText":@"06-20 11:04发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149005,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 170.30%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"平",
                                             @"viewText":@"（52人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357338,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-20\n07:00",
                                                     @"versusText":@"克鲁塞罗  3:3  格雷米奥",
                                                     @"analysisText":@"！！！！！！！！！！！！本场客队近期状态..."
                                                     },
                                             @"publishDateText":@"06-20 02:27发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149004,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 170.30%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"平",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356514,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n02:45",
                                                     @"versusText":@"波兰21  2:2  瑞典21",
                                                     @"analysisText":@"！！！！！！！！！！！！！本场亚盘开出主..."
                                                     },
                                             @"publishDateText":@"06-19 13:54发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, ],
                               }
                       },
                   @{
                       @"name":@"hunterdn",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170308211223033.png",
                       @"lastTenStatusText":@"近30天：63中35",
                       @"bio":@"欧洲联赛基本结束，以后空了白天也会开始推荐抗日单，其他比赛如果是娱乐单我会申明！每天推荐的比赛都是个人实单，如有同路的朋友看好跟，其余的谨慎跟单，还是那句老话，投资有风险，跟单需谨慎，后果自负，跟单自愿！😄😄😄",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@1590010,
                                       @"name":@"summ******",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170608135354837.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"这次状态开始回升，请大家收好裤腰带，一起赚钱。",
                                       @"fansCount":@272,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=1590010"
                                       },
                                   @"rate":@[@{
                                                 @"nameText":@"近10场命中",
                                                 @"data":@60.0
                                                 }, @{
                                                 @"nameText":@"近7天命中",
                                                 @"data":@57.7
                                                 }, @{
                                                 @"nameText":@"近30天命中",
                                                 @"data":@52.2
                                                 }, @{
                                                 @"nameText":@"近10场盈利",
                                                 @"data":@119.9
                                                 }, @{
                                                 @"nameText":@"近7天盈利",
                                                 @"data":@116.4
                                                 }, @{
                                                 @"nameText":@"近30天盈利",
                                                 @"data":@110.8
                                                 }],
                               @"list":@[@{
                                             @"matchId":@2150002,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 119.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"免费查看",
                                             @"viewText":@"（40人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357839,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-21\n02:45",
                                                     @"versusText":@"葡萄牙21 VS 西班牙21",
                                                     @"analysisText":@"这场球看好客队，不多说，赶紧跟单把，客队..."
                                                     },
                                             @"publishDateText":@"06-20 13:42发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150003,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 119.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"免费查看",
                                             @"viewText":@"（39人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357835,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-21\n05:00",
                                                     @"versusText":@"圣洛伦索 VS 班菲尔德",
                                                     @"analysisText":@"主队主场实力不用多说了，客队最近状态神勇..."
                                                     },
                                             @"publishDateText":@"06-20 13:38发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2150001,
                                             @"groupTitle":@"2017-06-21 星期三",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 119.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"免费查看",
                                             @"viewText":@"（41人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357834,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-21\n00:00",
                                                     @"versusText":@"塞尔维21 VS 马其顿21",
                                                     @"analysisText":@"这场球主队应该是个实力盘，客队主场战绩不..."
                                                     },
                                             @"publishDateText":@"06-20 13:36发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isPaid":@false,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149004,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 119.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（68人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@357129,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n02:45",
                                                     @"versusText":@"波兰21  2:2  瑞典21",
                                                     @"analysisText":@"这盘口开的没毛病，客队实力强，但让负1.4..."
                                                     },
                                             @"publishDateText":@"06-19 22:42发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149002,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 119.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（81人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356817,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n00:00",
                                                     @"versusText":@"斯洛伐21  1:2  英格兰21",
                                                     @"analysisText":@"这场比赛客队实力稍高一筹，在第一轮没有拿..."
                                                     },
                                             @"publishDateText":@"06-19 18:23发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149003,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 119.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[-1]",
                                             @"viewText":@"（76人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356815,
                                                     @"matchName":@"挪超",
                                                     @"matchDateText":@"06-20\n01:00",
                                                     @"versusText":@"布兰  5:0  斯塔贝克",
                                                     @"analysisText":@"胜没有了不能推，那就胆大直接让胜，这赛季..."
                                                     },
                                             @"publishDateText":@"06-19 18:21发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },   @{
                                             @"matchId":@2143009,
                                             @"groupTitle":@"2017-06-14 星期三",
                                             @"lastTenStatusText":@"近10中6",
                                             @"profitText":@"盈利率 119.90%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（63人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@346909,
                                                     @"matchName":@"国际友谊",
                                                     @"matchDateText":@"06-14\n03:00",
                                                     @"versusText":@"法国  3:2  英格兰",
                                                     @"analysisText":@"两队实力，主队更厉害点，身价摆在那。而且..."
                                                     },
                                             @"publishDateText":@"06-13 22:03发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],
                                   }
                       },
                   @{
                       @"name":@"2949541",
                       @"avatar":@"http://www.310win.com/files/2016/8/20160822172500433.png",
                       @"lastTenStatusText":@"近30天：71中37",
                       @"bio":@"对欧洲主流联赛赔率有深入研究，有多年竞彩经验，经济型打票能手，命中率极高",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@2949541,
                                       @"name":@"2949541",
                                       @"avatar":@"http://www.310win.com/files/2016/8/20160822172500433.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"对欧洲主流联赛赔率有深入研究，有多年竞彩经验，经济型打票能手，命中率极高",
                                       @"fansCount":@64,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=2949541"
                                       },
                                   @"rate":@[@{
                                                 @"nameText":@"近10场命中",
                                                 @"data":@70.0
                                                 }, @{
                                                 @"nameText":@"近7天命中",
                                                 @"data":@65.7
                                                 }, @{
                                                 @"nameText":@"近30天命中",
                                                 @"data":@52.1
                                                 }, @{
                                                 @"nameText":@"近10场盈利",
                                                 @"data":@148.6
                                                 }, @{
                                                 @"nameText":@"近7天盈利",
                                                 @"data":@131.6
                                                 }, @{
                                                 @"nameText":@"近30天盈利",
                                                 @"data":@110.9
                                                 }],
                               @"list":@[@{
                                             @"matchId":@2149005,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（11人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356841,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-20\n07:00",
                                                     @"versusText":@"克鲁塞罗  3:3  格雷米奥",
                                                     @"analysisText":@"平手半球最后都是下盘，两队排名有些差距，..."
                                                     },
                                             @"publishDateText":@"06-19 18:36发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2149004,
                                             @"groupTitle":@"2017-06-20 星期二",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"平",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@356840,
                                                     @"matchName":@"欧青U21",
                                                     @"matchDateText":@"06-20\n02:45",
                                                     @"versusText":@"波兰21  2:2  瑞典21",
                                                     @"analysisText":@"平手盘，两队实力接近，风格类似，根据本周..."
                                                     },
                                             @"publishDateText":@"06-19 18:35发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2148001,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355011,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-18\n17:00",
                                                     @"versusText":@"FC东京  0:1  横滨水手",
                                                     @"analysisText":@"两队实力伯仲之间，现在赔率没有太多的变盘..."
                                                     },
                                             @"publishDateText":@"06-18 16:16发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2148002,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@355000,
                                                     @"matchName":@"韩K联",
                                                     @"matchDateText":@"06-18\n17:00",
                                                     @"versusText":@"水原三星  1:2  FC首尔",
                                                     @"analysisText":@"首尔FC本赛季没有双线作战的压力了，目前全..."
                                                     },
                                             @"publishDateText":@"06-18 16:12发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147042,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（144人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@354345,
                                                     @"matchName":@"美职业",
                                                     @"matchDateText":@"06-18\n11:00",
                                                     @"versusText":@"洛城银河  2:2  休斯敦",
                                                     @"analysisText":@"两队实力差距不是很大，本场洛杉矶赢球不是..."
                                                     },
                                             @"publishDateText":@"06-18 09:56发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@2,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147005,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352234,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-17\n17:30",
                                                     @"versusText":@"鹿岛鹿角  3:0  札幌冈萨",
                                                     @"analysisText":@"鹿岛没有那么强大，札幌已经到了不能输球的..."
                                                     },
                                             @"publishDateText":@"06-17 11:06发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147024,
                                             @"groupTitle":@"2017-06-18 星期日",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352217,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-18\n01:00",
                                                     @"versusText":@"萨兰迪兵工厂  1:2  戈多伊",
                                                     @"analysisText":@"阿根廷比赛主场优势明显，本场平手半球走下..."
                                                     },
                                             @"publishDateText":@"06-17 11:00发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147012,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352205,
                                                     @"matchName":@"日职联",
                                                     @"matchDateText":@"06-17\n18:00",
                                                     @"versusText":@"神户胜利  0:1  大阪钢巴",
                                                     @"analysisText":@"大阪实力可以，虽然客场赔率不支持穿盘，但..."
                                                     },
                                             @"publishDateText":@"06-17 10:54发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147001,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352202,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n13:00",
                                                     @"versusText":@"福冈黄蜂  3:1  名古屋鲸",
                                                     @"analysisText":@"两队实力伯仲之间，平手半球下盘居多，首选..."
                                                     },
                                             @"publishDateText":@"06-17 10:51发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2147002,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"viewText":@"（182人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@352194,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-17\n17:00",
                                                     @"versusText":@"水户蜀葵  3:1  千叶市原",
                                                     @"analysisText":@"平手盘看好主队，在主流联赛中本场比赛平局..."
                                                     },
                                             @"publishDateText":@"06-17 10:48发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146006,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351482,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n08:15",
                                                     @"versusText":@"班菲尔德  3:1  罗萨里奥",
                                                     @"analysisText":@"本场比赛应该是两边倒，客队赢球或主队穿盘..."
                                                     },
                                             @"publishDateText":@"06-16 23:17发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2146005,
                                             @"groupTitle":@"2017-06-17 星期六",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@351480,
                                                     @"matchName":@"阿甲",
                                                     @"matchDateText":@"06-17\n07:00",
                                                     @"versusText":@"塔勒瑞斯  0:1  拉普体操",
                                                     @"analysisText":@"排名接近看好主队，让平应该是首选，次选主..."
                                                     },
                                             @"publishDateText":@"06-16 23:16发布",
                                             @"favourableCount":@2,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2144005,
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中7",
                                             @"profitText":@"盈利率 148.60%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@348264,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-15\n08:00",
                                                     @"versusText":@"弗拉门戈  2:0  庞特普雷塔",
                                                     @"analysisText":@"两队差距较大，排名看就有问题，但是开除这..."
                                                     },
                                             @"publishDateText":@"06-14 18:18发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }],

                                   }
                       },
//                   @{
//                       @"name":@"summerf123",
//                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170608135354837.png",
//                       @"lastTenStatusText":@"近30天：64中33",
//                       @"bio":@"这次状态开始回升，请大家收好裤腰带，一起赚钱。",
//                       
//                    },
                   @{
                       @"name":@"RuxVanli",
                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170501194346648.png",
                       @"lastTenStatusText":@"近30天：67中34",
                       @"bio":@"It's all just beginning,Back!!",
                       @"detaill":@{
                               @"figure":@{
                                       @"userId":@1657675,
                                       @"name":@"RuxVanli",
                                       @"avatar":@"http://dx1.310win.cn/files/recommend/20170501194346648.png",
                                       @"masterLevel":@"初级专家",
                                       @"bio":@"It's all just beginning,Back!!",
                                       @"fansCount":@40,
                                       @"isConcern":@false,
                                       @"shareUrl":@"http://client.310win.com/aspx/RecommendExpert.aspx?id=1657675"
                                       },
                               @"rate":@[@{
                                             @"nameText":@"近10场命中",
                                             @"data":@40.0
                                             }, @{
                                             @"nameText":@"近7天命中",
                                             @"data":@33.3
                                             }, @{
                                             @"nameText":@"近30天命中",
                                             @"data":@49.2
                                             }, @{
                                             @"nameText":@"近10场盈利",
                                             @"data":@61.5
                                             }, @{
                                             @"nameText":@"近7天盈利",
                                             @"data":@50.3
                                             }, @{
                                             @"nameText":@"近30天盈利",
                                             @"data":@108.5
                                             }],
                               @"list":@[@{
                                             @"matchId":@2144006,
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中4",
                                             @"profitText":@"盈利率 61.50%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让负@[-1]",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@348747,
                                                     @"matchName":@"美公开赛",
                                                     @"matchDateText":@"06-15\n08:00",
                                                     @"versusText":@"纽约红牛  1:0  纽约城",
                                                     @"analysisText":@"I'm back!本场不中从此退出平台！\n纽约城德..."
                                                     },
                                             @"publishDateText":@"06-15 00:33发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2144008,
                                             @"groupTitle":@"2017-06-15 星期四",
                                             @"lastTenStatusText":@"近10中4",
                                             @"profitText":@"盈利率 61.50%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（8人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@348744,
                                                     @"matchName":@"巴西甲",
                                                     @"matchDateText":@"06-15\n08:45",
                                                     @"versusText":@"沙佩科恩斯  2:1  瓦斯科达伽马",
                                                     @"analysisText":@"I'm back!\n这场和009是交叉盘，看好本场比..."
                                                     },
                                             @"publishDateText":@"06-15 00:31发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2143002,
                                             @"groupTitle":@"2017-06-13 星期二",
                                             @"lastTenStatusText":@"近10中4",
                                             @"profitText":@"盈利率 61.50%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让平@[+3]",
                                             @"viewText":@"（11人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@346088,
                                                     @"matchName":@"国际友谊",
                                                     @"matchDateText":@"06-13\n20:00",
                                                     @"versusText":@"新加坡  0:6  阿根廷",
                                                     @"analysisText":@"I'm back！有猫腻\n盘口开出5球，国彩却让三..."
                                                     },
                                             @"publishDateText":@"06-13 13:03发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2143007,
                                             @"groupTitle":@"2017-06-14 星期三",
                                             @"lastTenStatusText":@"近10中4",
                                             @"profitText":@"盈利率 61.50%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让胜@[+1]",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@345486,
                                                     @"matchName":@"国际友谊",
                                                     @"matchDateText":@"06-14\n01:45",
                                                     @"versusText":@"挪威  1:1  瑞典",
                                                     @"analysisText":@"I'm back！\n开出如此盘口，主不败。开出如..."
                                                     },
                                             @"publishDateText":@"06-13 02:15发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2143006,
                                             @"groupTitle":@"2017-06-13 星期二",
                                             @"lastTenStatusText":@"近10中4",
                                             @"profitText":@"盈利率 61.50%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@345480,
                                                     @"matchName":@"亚洲预选",
                                                     @"matchDateText":@"06-13\n21:45",
                                                     @"versusText":@"叙利亚  2:2  中国",
                                                     @"analysisText":@"I'm back！\n人生中少有的几次买国足，为什..."
                                                     },
                                             @"publishDateText":@"06-13 01:56发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2143003,
                                             @"groupTitle":@"2017-06-13 星期二",
                                             @"lastTenStatusText":@"近10中4",
                                             @"profitText":@"盈利率 61.50%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"负",
                                             @"viewText":@"（0人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@345469,
                                                     @"matchName":@"亚洲预选",
                                                     @"matchDateText":@"06-13\n20:00",
                                                     @"versusText":@"泰国  1:1  阿联酋",
                                                     @"analysisText":@"I'm back！\n看好阿联酋，毕竟阿联酋不胜就..."
                                                     },
                                             @"publishDateText":@"06-13 01:28发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             }, @{
                                             @"matchId":@2142002,
                                             @"groupTitle":@"2017-06-13 星期二",
                                             @"lastTenStatusText":@"近10中4",
                                             @"profitText":@"盈利率 61.50%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"让平@[-1]",
                                             @"viewText":@"（71人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@345408,
                                                     @"matchName":@"亚洲预选",
                                                     @"matchDateText":@"06-13\n00:45",
                                                     @"versusText":@"伊朗  2:0  乌兹别克",
                                                     @"analysisText":@"I'm back！\n看了一下伊朗队的赛程，本场比..."
                                                     },
                                             @"publishDateText":@"06-13 00:18发布",
                                             @"favourableCount":@1,
                                             @"negativeCount":@0,
                                             @"payMoney":@0,
                                             @"isWon":@false,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  @{
                                             @"matchId":@2141007,
                                             @"groupTitle":@"2017-06-11 星期日",
                                             @"lastTenStatusText":@"近10中4",
                                             @"profitText":@"盈利率 61.50%",
                                             @"satificationText":@"满意度 99.00%",
                                             @"recommendText":@"胜",
                                             @"viewText":@"（10人查看）",
                                             @"recommendInfo":@{
                                                     @"id":@342402,
                                                     @"matchName":@"日职乙",
                                                     @"matchDateText":@"06-11\n18:00",
                                                     @"versusText":@"长崎成功丸  1:0  熊本深红",
                                                     @"analysisText":@"I'm back!\n往绩交锋长崎没有任何优势，本赛..."
                                                     },
                                             @"publishDateText":@"06-11 02:15发布",
                                             @"favourableCount":@0,
                                             @"negativeCount":@0,
                                             @"payMoney":@10,
                                             @"isWon":@true,
                                             @"isPaid":@true,
                                             @"isFreeLimit":@false,
                                             @"voiceSecond":@0,
                                             @"viewCount":@0
                                             },  ],
                               }
                       
                       },
                   
                   ];
    }
    return _data;
}
@end
