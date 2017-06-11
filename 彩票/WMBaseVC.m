//
//  WMBaseVC.m
//  MuseumWork
//
//  Created by iosDevelop on 17/3/20.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import "WMBaseVC.h"
@interface WMBaseVC ()
@property(strong,nonatomic)UIView *menuVIew;
@property(strong,nonatomic)UIView *maskView;
@property(strong,nonatomic)UIImageView *backgroundImage;

@property(strong,nonatomic)NSArray *toolImageArr;
@property(strong,nonatomic)NSArray *toolTitleArr;

@end

@implementation WMBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toolImageArr = @[@"toolGuide",@"toolProdoout",@"toolSearch",@"toolLanguage",@"toolInfo"];
    self.toolTitleArr = @[@"导览",@"展览",@"搜索",@"语言",@"资讯"];

    
    //[self.view addSubview:self.menuVIew];
    //[self.view addSubview:self.maskView];
    [self.view addSubview:self.backgroundImage];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton  *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    menuButton.frame = CGRectMake(0, 0, 40, 40);
    menuButton.backgroundColor = [UIColor clearColor];
    [menuButton setImage:[UIImage imageNamed:@"menuButton"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:menuButton];
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"clearPic"] forBarMetrics:UIBarMetricsDefault];
}
- (UIImageView *)backgroundImage{
    if (!_backgroundImage) {
        _backgroundImage = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _backgroundImage.backgroundColor = [UIColor clearColor];
    }
    return _backgroundImage;
}

- (UIView *)menuVIew{
    if (_menuVIew == nil) {
        _menuVIew = [[UIView alloc]initWithFrame:CGRectMake(-Width+100, 0, Width-100, Height)];
        _menuVIew.backgroundColor = [UIColor cyanColor];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:_menuVIew.bounds];
        imageView.backgroundColor = [UIColor clearColor];
        [imageView setImage:[UIImage imageNamed:@"menubgImage"]];
        [_menuVIew addSubview:imageView];
        [self setUpButtoninView:_menuVIew];
        _menuVIew.alpha = 0;
    }
    return _menuVIew;
}
- (UIView *)maskView{
    if (_maskView == nil) {
        _maskView = [[UIView alloc]initWithFrame:CGRectMake(Width-100, 0, 100, Height)];
        _maskView.backgroundColor = [UIColor blackColor];
        UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToMainView)];
        [_maskView addGestureRecognizer:pan];
        _maskView.alpha = 0;
    }
    return _maskView;
}
- (void)setUpButtoninView:(UIView *)view{
    
    for (int i = 0; i<=4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i/2*70+55, i%2*110+110, 37.5, 90);
        btn.backgroundColor = [UIColor redColor];
        [btn setImage:[UIImage imageNamed:self.toolImageArr[i]] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%@",self.toolTitleArr[i]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(-30, 0, 0, 0)];
        [view addSubview:btn];
    }
    
}
- (void)menuButtonClick:(UIButton *)btn{
   
    if (self.menuVIew.alpha>0) {
        [self backToMainView];
        return;
    }
  __block CGRect maskViewF = self.maskView.frame;
  __block CGRect ViewF = self.view.frame;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        maskViewF.origin.x= 0;
        ViewF.origin.x = Width-100;
        self.menuVIew.alpha = 1;
        self.maskView.frame = maskViewF;
        self.maskView.alpha = 0.3f;
        self.view.frame = ViewF;
        [self.view bringSubviewToFront:self.menuVIew];
        [self.view bringSubviewToFront:self.maskView];
    } completion:nil];
}
- (void)backToMainView{
    __block CGRect maskViewF = self.maskView.frame;
    __block CGRect ViewF = self.view.frame;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        maskViewF.origin.x= Width-100;
        ViewF.origin.x = 0;
        self.maskView.frame = maskViewF;
        self.maskView.alpha = 0;
        self.menuVIew.alpha = 0;
        self.view.frame = ViewF;
        [self.view sendSubviewToBack:self.menuVIew];
        [self.view sendSubviewToBack:self.maskView];
    } completion:nil];
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
