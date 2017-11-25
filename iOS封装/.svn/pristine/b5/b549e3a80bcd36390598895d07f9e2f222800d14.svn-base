//
//  Lbcamera.m
//  调用相机相册
//
//  Created by sm on 17/1/3.
//  Copyright © 2017年 sm. All rights reserved.
//

#import "Lbcamera.h"
#import <UIKit/UIKit.h>

@interface Lbcamera ()

@end

@implementation Lbcamera

+(void)getcameraTarget:(id)target{

    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = target;
        // 设置拍照后的图片可以被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [target presentViewController:picker animated:YES completion:nil];
    }else {
        
    }

}

+(void)getPhotoTarget:(id)target{

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = target;
    //    // 设置选择后的图片可以被编辑
    //    picker.allowsEditing = YES;
    //    [self presentViewController:picker animated:YES completion:nil];
    //1.获取媒体支持格式
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.mediaTypes = @[mediaTypes[0]];
    //5.其他配置
    //allowsEditing是否允许编辑，如果值为no，选择照片之后就不会进入编辑界面
    //picker.allowsEditing = YES;
    //6.推送
    [target presentViewController:picker animated:YES completion:nil];


}

@end
