//
//  SQPhoneViewController.m
//  Encapsulation
//
//  Created by mac on 17/1/9.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "SQPhoneViewController.h"

@interface SQPhoneViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>  // 选择图片回调需要引入这两个协议
@property (weak, nonatomic) IBOutlet UIImageView *OPicture; //原始图片
@property (weak, nonatomic) IBOutlet UIImageView *EPicture; //不压缩显示的图片

@end

@implementation SQPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _EPicture.contentMode = UIViewContentModeScaleAspectFill;//保证不压缩显示
    _EPicture.layer.masksToBounds = YES;
    self.title = @"获取手机相册，首先按原图显示，其次再让图片根据约定的宽高显示，保证图片不被压缩";
    
}
- (IBAction)getPicture:(UIButton *)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];
}




// 选中照片

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //获取原始图片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _OPicture.image = image;
    _EPicture.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}







@end
