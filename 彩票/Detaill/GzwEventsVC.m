//
//  TableViewController.m
//  ARSegmentPager
//
//  Created by August on 15/3/28.
//  Copyright (c) 2015年 August. All rights reserved.
//

#import "GzwEventsVC.h"
#import "GzwHUDTool.h"
@interface GzwEventsVC ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation GzwEventsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UIWebView *view = [[UIWebView alloc]init];
    view.delegate = self;
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    view.frame = self.view.frame;
    self.webView = view;
    [view loadRequest:requst];
    [self.view addSubview:view];
    
    [GzwHUDTool showWithStatus:nil];
   
}

//"name": "积分",
//"url": "http://client.310win.com/aspx/data/Standings/1365169.html"
//"name": "情报",
//"url": "http://www.fox008.com/html5/analyse/index_notop.html?id=20170614010"

-(NSString *)segmentTitle
{
    return self.titleText;
}

-(UIScrollView *)streachScrollView
{
    return self.webView.scrollView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"table %ld",(long)indexPath.row];
    return cell;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [GzwHUDTool showWithStatus:nil];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [GzwHUDTool dismiss];
}

@end
