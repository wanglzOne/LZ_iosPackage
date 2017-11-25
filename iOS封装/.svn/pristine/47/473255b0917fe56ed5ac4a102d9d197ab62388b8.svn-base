//
//  LBCalculation.m
//  iOS封装
//
//  Created by sm on 17/1/9.
//  Copyright © 2017年 cdcyi. All rights reserved.
//

#import "LBCalculation.h"

@implementation LBCalculation

+ (CGRect)CalculationText:(NSString*)text TextW:(CGFloat)TextW TextH:(CGFloat)TextH attributes:(NSDictionary*)attributesDic{

     CGRect sizeconent=[text boundingRectWithSize:CGSizeMake(TextW, TextH) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil];

    return sizeconent;

}

+ (CGRect)CalculationAttributedStringt:(NSString*)AttributedString TextW:(CGFloat)TextW TextH:(CGFloat)TextH attributes:(NSDictionary*)attributesDic spacing:(CGFloat)spacing{

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:AttributedString attributes:attributesDic];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [AttributedString length])];
    

     CGRect sizeconent=[attributedString boundingRectWithSize:CGSizeMake(TextW, TextH) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return sizeconent;

}
@end
