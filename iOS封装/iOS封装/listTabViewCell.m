//
//  listTabViewCell.m
//  Encapsulation
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "listTabViewCell.h"

@implementation listTabViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _bgView.layer.borderColor = [UIColor blueColor].CGColor;
    _bgView.layer.borderWidth = 1;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
