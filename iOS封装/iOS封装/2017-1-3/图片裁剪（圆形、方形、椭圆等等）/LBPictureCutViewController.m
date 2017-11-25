//
//  LBPictureCutViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBPictureCutViewController.h"
#import "UIImage+makeImage.h"

@interface LBPictureCutViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Lbimage;
@end

@implementation LBPictureCutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title=@"图片裁剪（圆形、方形、椭圆等等）";
    self.view.backgroundColor=[UIColor whiteColor];
    self.Lbimage.backgroundColor=[UIColor clearColor];
    self.Lbimage.contentMode=UIViewContentModeScaleAspectFit;
}

//圆形
- (IBAction)circleBt:(id)sender {
    //先将图片裁剪成正方形
    self.Lbimage.image=[UIImage squareImageFromImage:[UIImage imageNamed:@"banner01"] scaledToSize:60];
    self.Lbimage.image=[UIImage circleImageWithName:self.Lbimage.image borderWidth:1 borderColor:[UIColor whiteColor]];
}
//方形
- (IBAction)fangx:(id)sender {
    
    self.Lbimage.image=[UIImage squareImageFromImage:[UIImage imageNamed:@"banner01"] scaledToSize:60];
    
}
//椭圆
- (IBAction)tuoyuan:(id)sender {
    
    self.Lbimage.image=[UIImage circleImageWithName:[UIImage imageNamed:@"banner01"] borderWidth:1 borderColor:[UIColor whiteColor]];
    
}


@end
