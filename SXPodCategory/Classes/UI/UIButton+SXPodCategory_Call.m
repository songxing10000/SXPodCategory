//
//  UIButton+Call.m
//  dfpo
//
//  Created by dfpo on 2016/11/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UIButton+SXPodCategory_Call.h"

@implementation UIButton(SXPodCategory_Call)
- (void)setBackgroundColor:(nullable UIColor *)bgColor forState:(UIControlState)state {
    if (bgColor && [bgColor isKindOfClass:[UIColor class]]) {
        UIImage *bgImg = [self imageWithColor:bgColor withFrame:CGRectMake(0, 0, 1, 1)];
        [self setBackgroundImage:bgImg forState:UIControlStateHighlighted];
    }
}
-(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame{
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    CGContextFillRect(context, aFrame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
