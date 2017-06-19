//
//  GzwHeadSelectTool.m
//  功能机
//
//  Created by sky33 on 16/3/3.
//  Copyright © 2016年 action. All rights reserved.
//

#import "GzwHeadSelectTool.h"
#import <MobileCoreServices/MobileCoreServices.h>
#define ViewW [UIScreen mainScreen].bounds.size.width
#define viewH [UIScreen mainScreen].bounds.size.height
//#import "REFrostedViewController.h"
@interface GzwHeadSelectTool ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
/**
 *  当前显示控制器
 */
@property(nonatomic,strong)UIViewController *VC;
/**
 *  回调block
 */
@property(nonatomic,copy)void (^block)(UIImage *image);
@end
@implementation GzwHeadSelectTool

-(void)showVC:(UIViewController *)vc WithBlock:(void (^)(UIImage *image))block
{
    self.block = block;
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", nil];
    [sheet addButtonWithTitle:@"在相册里选择"];// 添加个选项

    // 取出当前页面控制器
 
    self.VC = vc;
    [sheet showInView:self.VC.view];
    
//    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
//    NSArray *ddd = [rootViewController valueForKey:@"jp_viewControllers"];
//    NSLog(@"%@",ddd);
//    self.VC   = ddd.lastObject;
//    [sheet showInView:self.VC.view];

}
//-(void)show
//{
//    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", nil];
//    [sheet addButtonWithTitle:@"在相册里选择"];// 添加个选项
//    
//    // 取出当前页面控制器
//    REFrostedViewController *ref = (REFrostedViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//    UINavigationController *nav = (UINavigationController *)ref.contentViewController;
//    self.VC = nav.topViewController;
//    [sheet showInView:self.VC.view];
//}
-(void)dealloc
{
    
}
#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 原来这个控制器就是个导航控制器
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.navigationBar.translucent = NO;
//    [[picker navigationBar].translucent = NO;
    picker.delegate = self;
    picker.allowsEditing = YES;
    switch (buttonIndex) {
        case 0:{// 拍照
            //资源类型为图片库
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.videoQuality = UIImagePickerControllerQualityTypeLow;
            [self.VC.navigationController presentViewController:picker animated:YES completion:nil];
        }
            break;
        case 1:{// 取消
            
            NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
            if ([self.VC isKindOfClass:[UITableViewController class]]) {
                UITableViewController *tableVC = (UITableViewController *)self.VC;
                [tableVC.tableView deselectRowAtIndexPath:index animated:YES];
            }
            self.VC = nil;
        }
            break;
        case 2:{// 在相册里选择
            //资源类型为图片库
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self.VC.navigationController presentViewController:picker animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

#pragma mark UIImagePickerControllerDelegate
// 用户选择了相片后，或拍照后点击完成调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSLog(@"%@",info);
    //通过UIImagePickerControllerMediaType判断返回的是照片还是视频
    NSString* type = info[@"UIImagePickerControllerMediaType"];
    //获取照片的原图
    UIImage *image = info[@"UIImagePickerControllerEditedImage"];
    //如果返回的type等于kUTTypeImage，代表返回的是照片,并且需要判断当前相机使用的sourcetype是拍照还是相册
    if ([type isEqualToString:(NSString*)kUTTypeImage]) {
        if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {// 从图片库里获取的
            NSLog(@"选的是照片");
        }
    }
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {// 从相机里获取的图片
        //如果是拍照的照片，则需要手动保存到本地，系统不会自动保存拍照成功后的照片
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
//    // 原始图片可以根据照相时的角度来显示，但UIImage无法判定，于是出现获取的图片会向左转９０度的现象。
//    UIImageOrientation imageOrientation=image.imageOrientation;
//    if(imageOrientation!=UIImageOrientationUp) {
//        // 以下为调整图片角度的部分
//        UIGraphicsBeginImageContext(image.size);
//        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//        image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        // 调整图片角度完毕
//    }
    // 传递图片
    if (self.block) {
        self.block(image);
    }
    if ([self.delegate respondsToSelector:@selector(didSelect:)]) {
//        [self.delegate didSelect:[self imageWithScale:self.size.width]];
    }
    self.VC = nil;
    [picker dismissViewControllerAnimated:YES completion:nil];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;// 白色状态栏
}

// 点取消调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;// 白色状态栏
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.VC = nil;
}
//保存照片成功后的回调
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    NSLog(@"图片保存到相册");
}
@end
