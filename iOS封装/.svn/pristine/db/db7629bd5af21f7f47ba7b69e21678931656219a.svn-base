//
//  LBPhotoAlbumViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBPhotoAlbumViewController.h"
#import "Lbcamera.h"

@interface LBPhotoAlbumViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *lbmage;

@end

@implementation LBPhotoAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
     self.title=@"调用手机相机拍照或手机相册获取图片修改用户头像";
    
}

//调相机
- (IBAction)cameraBt:(id)sender {
    
    [Lbcamera getcameraTarget:self];
}
//调相册
- (IBAction)photoBt:(id)sender {
    
    [Lbcamera getPhotoTarget:self];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        // 先把图片转成NSData
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil) {
            
            data = UIImageJPEGRepresentation(image, 0.1);
        }else {
            data=    UIImageJPEGRepresentation(image, 0.1);
        }
        //#warning 这里来做操作，提交的时候要上传
        // 图片保存的路径
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        self.lbmage.image=[UIImage imageWithData:data];
    }
}


@end
