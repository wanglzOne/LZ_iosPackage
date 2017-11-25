//
//  LBAvatarVirtualViewController.m
//  Encapsulation
//
//  Created by sm on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBAvatarVirtualViewController.h"
#import "LBAvatarVirObj.h"

@interface LBAvatarVirtualViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UISlider *slider;//滑动条

@property(nonatomic , strong) UIVisualEffectView *ruVisualEffectView;

@end

@implementation LBAvatarVirtualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"头像虚化，实现毛玻璃效果";
    _slider.minimumValue = 0;// 设置最小值
    _slider.maximumValue = 1;// 设置最大值
    _slider.value = (_slider.minimumValue + _slider.maximumValue) / 2;// 设置初始值
    _slider.continuous = YES;// 设置可连续变化
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];// 针对值
    
    //调方法 第一个参数是将要虚拟的图片  第二个对象是虚拟的alpha 返回一个虚拟对象
   _ruVisualEffectView = [LBAvatarVirObj AddImageVir:self.headImage value:_slider.value];
    
}

-(void)sliderValueChanged:(id)slider{
    
    UISlider *slidera = (UISlider *)slider;
    
    _ruVisualEffectView.alpha=slidera.value;

}

@end
