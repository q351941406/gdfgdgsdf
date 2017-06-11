//
//  GzwWebAdvertVC.m
//  children
//
//  Created by sky33 on 15/12/8.
//  Copyright © 2015年 sky32. All rights reserved.
//

#import "GzwWebAdvertVC.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"


@interface GzwWebAdvertVC ()<UIWebViewDelegate,NJKWebViewProgressDelegate>

@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)NSMutableArray *mUrlArray;// webView中所有图片的路径

@property(nonatomic,strong)NJKWebViewProgressView *progressView;
@property(nonatomic,strong)NJKWebViewProgress *progressProxy;
@end

@implementation GzwWebAdvertVC
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.progressColor = [UIColor colorWithRed:22.f / 255.f green:126.f / 255.f blue:251.f / 255.f alpha:1.0];
        self.webView = [[UIWebView alloc]init];
    }
    return self;
}
#pragma mark life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.isLoadAdvDesc) {
        
        self.webView.delegate = self;
    }else {
        CGFloat progressBarHeight = 2.f;
        CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
        CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
        _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
        _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _progressProxy = [[NJKWebViewProgress alloc] init];
        self.webView.delegate = self;
        self.webView.delegate = _progressProxy;
        self.progressView.progressBarView.backgroundColor = self.progressColor;
        _progressProxy.progressDelegate = self;
        NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]];
        [self.webView loadRequest:requst];
        
    }
    
    self.webView.frame = self.view.frame;
    [self.view addSubview:self.webView];
    [self.view setNeedsUpdateConstraints];// 标记更新约束
}
-(void)updateViewConstraints
{
//    @weakify(self);
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self);
//        make.left.equalTo(self.view);
//        make.right.equalTo(self.view);
//        make.top.equalTo(self.view);
//        make.bottom.equalTo(self.view);
//    }];
    [super updateViewConstraints];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 添加进度条
    [self.navigationController.navigationBar addSubview:_progressView];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    // 移除进度条
    [_progressView removeFromSuperview];
}
-(void)dealloc
{
    NSLog(@"销毁了%@",self.class);
}
#pragma mark Set
-(void)setWebUrl:(NSString *)webUrl
{
    _webUrl = webUrl;
    //    [self viewDidLoad];
    [self.webView loadHTMLString:self.webUrl baseURL:nil];
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    // 根据进度更新进度条
    [_progressView setProgress:progress animated:YES];
    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

#pragma mark UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //    [IDProgressHUD IDPlaceViewHideDirect:self.view];
    
    //这里是js，主要目的实现对url的获取
    static  NSString * const jsGetImages =
    @"function getImages(){\
    var objs = document.getElementsByTagName(\"img\");\
    var imgScr = '';\
    for(var i=0;i<objs.length;i++){\
    imgScr = imgScr + objs[i].src + '+';\
    };\
    return imgScr;\
    };";
    
    [webView stringByEvaluatingJavaScriptFromString:jsGetImages];//注入js方法
    NSString *urlResurlt = [webView stringByEvaluatingJavaScriptFromString:@"getImages()"];
    self.mUrlArray = [NSMutableArray arrayWithArray:[urlResurlt componentsSeparatedByString:@"+"]];
    if (self.mUrlArray.count >= 2) {
        [self.mUrlArray removeLastObject];
    }
    //urlResurlt 就是获取到得所有图片的url的拼接；mUrlArray就是所有Url的数组
    
    //添加图片可点击js
    [webView stringByEvaluatingJavaScriptFromString:@"function registerImageClickAction(){\
     var imgs=document.getElementsByTagName('img');\
     var length=imgs.length;\
     for(var i=0;i<length;i++){\
     img=imgs[i];\
     img.onclick=function(){\
     window.location.href='image-preview:'+this.src}\
     }\
     }"];
    [webView stringByEvaluatingJavaScriptFromString:@"registerImageClickAction();"];
}
////在这个方法中捕获到图片的点击事件和被点击图片的url
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//
//    if ([request.URL.scheme isEqualToString:@"image-preview"]) {
//        NSString* path = [request.URL.absoluteString substringFromIndex:[@"image-preview:" length]];
//        path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//        __block NSUInteger index;
//        [self.mUrlArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            if ([obj isEqualToString:path]) {
//                index = idx;
//            }
//        }];
//
//        IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:[IDMPhoto photosWithURLs:self.mUrlArray]];
//
//        browser.displayActionButton = NO;
//        browser.displayArrowButton = YES;
//        browser.displayCounterLabel = YES;
//        browser.usePopAnimation = YES;
//        browser.displayActionButton = YES;
//        [browser setInitialPageIndex:index];
//        // Show
//        [self presentViewController:browser animated:YES completion:nil];
//        //path 就是被点击图片的url
//        return NO;
//    }
//    return YES;
//}
@end
