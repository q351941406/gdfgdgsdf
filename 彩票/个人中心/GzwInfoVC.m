//
//  GzwServerVC.m
//  ScanCode
//
//  Created by Wang Jiang on 2017/6/1.
//  Copyright © 2017年 ScanCode. All rights reserved.
//

#import "GzwInfoVC.h"
#import "HSSetTableInfoController.h"
#import "DemoSettingController.h"
#import "GzwThemeTool.h"
#import "CYloginRegisterViewController.h"
@interface GzwInfoVC ()

@end

@implementation GzwInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人中心";
    
    self.view.backgroundColor = [GzwThemeTool backgroudTheme];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
        {
            NSNumber *n = [[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
            if (n.boolValue) {
                HSSetTableInfoController *vc = [[HSSetTableInfoController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }else {
                CYloginRegisterViewController *loginRegister = [[CYloginRegisterViewController alloc] init];
                [self presentViewController:loginRegister animated:YES completion:nil];
            }
            
        }
            break;
        case 1:
        {
            DemoSettingController *vc = [[DemoSettingController alloc]initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 2:
        {
            

        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Table view data source



@end
