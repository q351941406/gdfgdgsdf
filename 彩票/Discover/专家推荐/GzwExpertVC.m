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
-(NSArray *)data
{
    if (!_data) {
        _data =  @[
          @{
              @"name":@"足彩苍狼",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170504102612492.png",
              @"lastTenStatusText":@"近30天：65中50",
              @"bio":@"30年彩龄，对足彩颇有研究，坚持不懈用指数记录球队的走势，为球迷指点迷津，为彩民们大胆铺路。"
          },
          @{
              @"name":@"比特币911",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170604165634662.png",
              @"lastTenStatusText":@"近30天：99中67",
              @"bio":@"911足球竞彩团队，秉承网络大数据，坚持科学分析，结合独创数理模型，综合各方面资源，提供最专业的足球赛事推荐服务！同样的盘口，普通投资者10场综合命中率仅可以达到3成，我们团队通过例如对30场赛事进行筛选，只会选择10场有把握的赛事进行推荐投注，熟能生巧，擅长的盘口赛事通常综合命中率可以达到70%-90%！没有谁可以说一场比赛绝对的稳，通过科学的分析筛选，可以大幅提高命中率还是可行的！另外，对一些特别的盘口，凡是有可能剧情的赛事，只要能找出爆冷的合理理由，下手一定要狠，一定要看准基本面，致命一击！……稳中博弈，是911一贯坚持的推单原则，做生意回头才起熟客，合作共赢，利益共享！"
          },
          @{
              @"name":@"足彩稻草人",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20160823141941140.png",
              @"lastTenStatusText":@"近30天：73中49",
              @"bio":@"网罗全球足球资讯，结合数据进行赛事分析，专业的临场数据变化解析，二十年经验总结，帮助你提升理论知识和实战技能，足彩稻草人从事足球赛事推荐分析多年，熟练掌握足球赛事的开盘技巧和盘口分析，具备赛事实战经验，【足彩王】推荐战绩辉煌，深受玩家追捧。"
          },
          @{
              @"name":@"北欧赛事天天有",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170514042253050.png",
              @"lastTenStatusText":@"近30天：96中64",
              @"bio":@"彩客网传奇，北欧赛事天天有，熟透各级联赛，运用亚赔、欧赔来分析，胜率高，稳盈利，常跟我是你不二选择！"
          },
          @{
              @"name":@"3072147",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170227193739465.png",
              @"lastTenStatusText":@"近30天：78中52",
              @"bio":@"每天都有推荐，连红之后更加稳推了。十年哥在各大上都有自己的独到见解，精心推荐分享，每一场赛事给大家。中过足彩一等奖，大家跟上我平均注。一定会赚大钱的。"
          },
          @{
              @"name":@"赌神125归来",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170530090117858.png",
              @"lastTenStatusText":@"近30天：93中62",
              @"bio":@"大家多一份关注，多一份信任，你的举手之劳，就是对我们最大的肯定。我们团队的价值观：责任，诚信，服务，奉献。希望大家都能关注我们，查看我们单子的朋友关注越多我的信心就会越足。我的团队长期研究足球彩票，对主要的联赛有着深刻的理解。我会以稳为主，本着对大家负责的态度。认真研究每场比赛。我不研究赔率，不想被庄家左右，跟着庄走。从对战，战意，近期状态，临场发挥，外界因素为出发点，给大家一个最接近比赛结果的推荐。彩客网站真的非常讲究信誉和原则，我以前的号被冻结了，原因是我没有按原则和规定分析，感谢彩客网的陪伴，这次我增加了团队，一定为大家，也为自己增加一份信心。"
          },
          @{
              @"name":@"今晚二串一稳的",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170406144250740.png",
              @"lastTenStatusText":@"近30天：121中80",
              @"bio":@"5大联赛连续18轮不黑单！杯赛、亚联80%保本率，赢多输少！实力见证一切！ 我对庄家对于每场比赛的手法、盘口的研究分析已经熟透了！希望同大家一起保持长久的盈利！本月发单35中30失5，前17场连中，17连红佳绩，本月命中率85.7%，今晚二串一稳的，殿堂级理财专家，你的收米机器。2017.4.12   本月状态奇佳，疯狂收米，2017.5.11，近27失4，48失8，平均sp＞1.7，比推荐名家更癫狂，2017.6.18"
          },
          @{
              @"name":@"789竞彩推荐",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170521210104408.png",
              @"lastTenStatusText":@"近30天：84中55",
              @"bio":@"789竞彩专业网络团队，团队成员遍布全国各大城市，这里没有媒体编辑，没有平台主播，没有操盘手，也没有数学系，经济学博士，只有草根。团队目前15人，均有10年左右的博彩经验，有曾经网络超级带单大神，有足彩大奖获得者，也有曾经输的裤衩都没的超级赌徒，更有彩票店Boss，每天大家都会精选赛事相互探讨，确定最佳的串关倍投方案，风险平摊，盈利共享，今年前5月已累计投入本金约500万元，盈利180万，人均盈利12万，足球是博弈，更是理财，团队的理念是，不求一朝一夕暴富，综合稳定的回报才是关键，从目前发展情况来看，年回报率在36%，相信随着后期的深入，综合年回报率可以提升到50%，欢迎长期跟单！"
          },
          @{
              @"name":@"opfuck",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170512031712763.png",
              @"lastTenStatusText":@"近30天：100中65",
              @"bio":@"感谢大家支持，op每天坚持用最好的状态推荐稳健的赛事，和大家一起分享胜利的喜悦。……"
          },
          @{
              @"name":@"jackyi",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20161224182649794.png",
              @"lastTenStatusText":@"近30天：71中46",
              @"bio":@"如果是一场友谊赛、杯赛、一周双赛、欧冠赛前后日，你还要仅仅停留在基本面强弱，或赔率高低表现去选择赛果，可以说，会挂得很惨！基本面分析综合亚赔分析，还要看比赛的意义和现金流向受热情度。足球是圆的还要加点运气哦。投资策略保持每次下注资金均注。认同的朋友就关注一下。\n"
          },
          @{
              @"name":@"cym2110myc",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170517084137750.png",
              @"lastTenStatusText":@"近30天：82中52",
              @"bio":@"研究足彩多年，积累了丰富经验。主要通过亚盘分析，总结出了一套独特分析方法。并且多次抓住大冷门，比较擅长英超，西甲，德甲！"
              },
          @{
              @"name":@"等雪的叶子",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170527174537230.png",
              @"lastTenStatusText":@"近30天：90中57",
              @"bio":@"来这里的都是久经沙场、学“”球“”五车、“”财“”高八斗的江湖人士！我们的初衷都一样！不要讲太多的大道理！赢者王、输者寇！能实现每月赢利、每年赢利的就是智者，就是魔法无边！\n有些大红没赢到钱！有些小红却能赢遍！\n面对庄稼！\n面对设置的赔率！\n面对盘口！\n面对胜平负！\n面对基本面！\n面对媒体的假信息！\n面对战意！\n面对那么多、那么多的推荐！\n去掉“”心魔”！才能红遍彩市！"
              },
          @{
              @"name":@"3020715",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170512092835044.png",
              @"lastTenStatusText":@"近30天：61中34",
              @"bio":@"从事彩票行业6年有余。"
              },
          @{
              @"name":@"hunterdn",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170308211223033.png",
              @"lastTenStatusText":@"近30天：63中35",
              @"bio":@"欧洲联赛基本结束，以后空了白天也会开始推荐抗日单，其他比赛如果是娱乐单我会申明！每天推荐的比赛都是个人实单，如有同路的朋友看好跟，其余的谨慎跟单，还是那句老话，投资有风险，跟单需谨慎，后果自负，跟单自愿！😄😄😄"
          },
          @{
              @"name":@"2949541",
              @"avatar":@"http://www.310win.com/files/2016/8/20160822172500433.png",
              @"lastTenStatusText":@"近30天：71中37",
              @"bio":@"对欧洲主流联赛赔率有深入研究，有多年竞彩经验，经济型打票能手，命中率极高"
              },
          @{
              @"name":@"summerf123",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170608135354837.png",
              @"lastTenStatusText":@"近30天：64中33",
              @"bio":@"这次状态开始回升，请大家收好裤腰带，一起赚钱。"
              },
          @{
              @"name":@"RuxVanli",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170501194346648.png",
              @"lastTenStatusText":@"近30天：67中34",
              @"bio":@"It's all just beginning,Back!!"
          },
          @{
              @"name":@"3106589",
              @"avatar":@"http://dx1.310win.cn/files/recommend/20170429062003529.png",
              @"lastTenStatusText":@"近30天：89中36",
              @"bio":@"让我带你飞！"
          },
          ];
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
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


@end
