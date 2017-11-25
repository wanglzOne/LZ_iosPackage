//
//  HomeHornorpictureCollectionViewCell.m
//  AngelComing
//
//  Created by sm on 16/11/22.
//  Copyright © 2016年 ruichikeji. All rights reserved.
//

#import "HomeHornorpictureCollectionViewCell.h"

@implementation HomeHornorpictureCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UILongPressGestureRecognizer *longgesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longgestureimage:)];
    [self addGestureRecognizer:longgesture];
    
}
//长按手势
-(void)longgestureimage:(UILongPressGestureRecognizer*)gesture{
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        return;
    } else if (gesture.state == UIGestureRecognizerStateBegan) {
        self.longtouchBlock(_index);
    }
    
}
@end
