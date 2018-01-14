//
//  HSSetTableInfoController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableInfoController.h"
#import "HSSetTableViewController.h"
#import "GzwHeadSelectTool.h"
#import "ReactiveCocoa.h"
#import "GzwThemeTool.h"
#import "HSTextTableViewCell.h"
#import "HSImageTableViewCell.h"
#define ViewW [UIScreen mainScreen].bounds.size.width
#define viewH [UIScreen mainScreen].bounds.size.height
@interface HSSetTableInfoController ()
/**
 *  必须要强引用着才行
 */
@property(nonatomic,strong)GzwHeadSelectTool *tool;
@end

@implementation HSSetTableInfoController

-(GzwHeadSelectTool *)tool
{
    if (!_tool) {
        _tool = [[GzwHeadSelectTool alloc]init];
        _tool.size = CGSizeMake(ViewW, ViewW);
    }
    return _tool;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
//    self.historyCell.imageView.image = [[[UIImage imageNamed:@"icons8-Open Window_50"] gzw_imageWithColor:[GzwThemeTool cellIconFirstTheme]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    self.expertCell.imageView.image = [[[UIImage imageNamed:@"icons8-Personal Trainer_50"] gzw_imageWithColor:[GzwThemeTool cellIconFirstTheme]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    cell.textLabel.textColor = [GzwThemeTool titleTextTheme];
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [GzwThemeTool cellBackgroudTheme];
    if ([cell isKindOfClass:HSTextTableViewCell.class]) {
        HSTextTableViewCell *cell2 = cell;
        cell2.detailLabel.textColor = [UIColor whiteColor];
    }
    if ([cell isKindOfClass:HSImageTableViewCell.class]) {
        HSImageTableViewCell *cell2 = cell;
        if ([cell2.textLabel.text isEqualToString:@"我的二维码"]) {
            cell2.bigImageView.image = [cell2.bigImageView.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
            cell2.bigImageView.tintColor = [GzwThemeTool cellIconFirstTheme];
        }
    }
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [GzwThemeTool cellSeparatorTheme];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    self.title = @"个人信息";
    self.view.backgroundColor = [GzwThemeTool backgroudTheme];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:0 target:nil action:nil];
    self.navigationItem.rightBarButtonItem.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定退出登录吗？" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [user setObject:@NO forKey:@"isLogin"];
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return [RACSignal empty];
    }];
    
    
    
    
    //头像
    UIImage *icon = [UIImage imageNamed:@"demo_avatar_jobs"];
    
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documents stringByAppendingPathComponent:@"person.archiver"];
    UIImage *imageIcon = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    __block HSImageCellModel *header = [[HSImageCellModel alloc] initWithTitle:@"头像" placeholderImage:imageIcon imageUrl:nil actionBlock:^(HSBaseCellModel *model) {
        [self.tool showVC:self WithBlock:^(UIImage *image) {
            header.placeHoderImage = image;
            [self.tableView reloadData];
            //获得Document的路径
            NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
            NSString *path = [documents stringByAppendingPathComponent:@"person.archiver"];//拓展名可以自己随便取
            [NSKeyedArchiver archiveRootObject:image toFile:path];
        }];
    } imageBlock:nil];
    //名字
    __block HSTextCellModel *name = [[HSTextCellModel alloc] initWithTitle:@"名字" detailText:[user valueForKey:@"name"] actionBlock:^(HSBaseCellModel *model) {
        [self edit:^(NSString *text) {
            name.detailText = text;
            [user setObject:text forKey:@"name"];
        }];
        
    }];
    
    
    
    //手机号
    HSTextCellModel *number = [[HSTextCellModel alloc] initWithTitle:@"手机号" detailText:[user valueForKey:@"18696004771"] actionBlock:^(HSBaseCellModel *model) {
       
    }];
    number.selectionStyle = UITableViewCellSelectionStyleNone;
    number.showArrow = NO;
    
    //我的二维码
    UIImage *image = [UIImage imageNamed:@"ic_icon_qrCode"];
    HSImageCellModel *qrCode = [[HSImageCellModel alloc] initWithTitle:@"我的二维码" placeholderImage:image imageUrl:nil actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:nil];
    qrCode.imageSize = CGSizeMake(15, 15);
    qrCode.cellHeight = HS_KCellHeight;
    
    //我的地址
    HSBaseCellModel *address = [[HSBaseCellModel alloc] initWithTitle:@"我的地址" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    //性别
   __block HSTextCellModel *sex = [[HSTextCellModel alloc] initWithTitle:@"性别" detailText:[user valueForKey:@"sex"] actionBlock:^(HSBaseCellModel *model) {
        [self edit:^(NSString *text) {
            sex.detailText = text;
            [user setObject:text forKey:@"sex"];
        }];
    }];
    //地区
    __block HSTextCellModel *area = [[HSTextCellModel alloc] initWithTitle:@"地区" detailText:[user valueForKey:@"area"] actionBlock:^(HSBaseCellModel *model) {
        [self edit:^(NSString *text) {
            area.detailText = text;
            [user setObject:text forKey:@"area"];
        }];
    }];
    //个性签名
    __block HSTextCellModel *sign = [[HSTextCellModel alloc] initWithTitle:@"签名" detailText:[user valueForKey:@"sign"] actionBlock:^(HSBaseCellModel *model) {
        [self edit:^(NSString *text) {
            sign.detailText = text;
            [user setObject:text forKey:@"sign"];
        }];
    }];
    
    
    
//    sign.controlRightOffset = 30;
//    sign.arrowControlRightOffset = 50;
    
 
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:header,name,number,qrCode,address, nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:area,sex,sign,nil];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];

}
-(void)edit:(void (^)(NSString *text))dddd
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"修改资料" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *userNameTextField = alertController.textFields.firstObject;
        dddd(userNameTextField.text);
        [self.tableView reloadData];
    }];
    
    //定义第一个输入框；
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入";
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"%@控制器销毁",self.class);
}





@end
