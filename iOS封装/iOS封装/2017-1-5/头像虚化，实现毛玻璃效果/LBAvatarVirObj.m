//
//  LBAvatarVirObj.m
//  Encapsulation
//
//  Created by sm on 17/1/5.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBAvatarVirObj.h"

@implementation LBAvatarVirObj

+(UIVisualEffectView*)AddImageVir:(UIImageView*)image value:(CGFloat)value{

    UIVisualEffectView *ruVisualEffectView = [[UIVisualEffectView alloc]initWithEffect:
                           
                           [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    
    
     ruVisualEffectView.alpha = value;
    
    ruVisualEffectView.bounds=image.bounds;
    
    [image addSubview:ruVisualEffectView];
    

    return ruVisualEffectView;
}
@end
