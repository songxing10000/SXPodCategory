//
//  UIButton+Call.h
//  dfpo
//
//  Created by dfpo on 2016/11/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SXPodCategory_Call)
/// 设置不同状态下的背景色，内容其实是通过设置不同状态的纯色背景图片实现此功能
- (void)setBackgroundColor:(nullable UIColor *)bgColor forState:(UIControlState)state;
@end
