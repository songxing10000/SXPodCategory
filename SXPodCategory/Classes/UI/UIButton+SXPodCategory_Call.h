//
//  UIButton+Call.h
//  dfpo
//
//  Created by dfpo on 2016/11/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SXPodCategory_Call)

/// 获取或设置 UIControlStateNormal 状态下的标题
@property (nullable, nonatomic) NSString *normalTitle;
/// 获取或设置 UIControlStateSelected 状态下的标题
@property (nullable, nonatomic) NSString *selectedTitle;
/// 获取或设置 UIControlStateDisabled 状态下的标题
@property (nullable, nonatomic) NSString *disabledTitle;

/// 获取或设置 UIControlStateNormal 状态下的标题的颜色
@property (nullable, nonatomic) UIColor *normalTitleColor;
/// 获取或设置 UIControlStateSelected 状态下的标题的颜色
@property (nullable, nonatomic) UIColor *selectedTitleColor;
/// 获取或设置 UIControlStateDisabled 状态下的标题的颜色
@property (nullable, nonatomic) UIColor *disabledTitleColor;

/// 获取或设置 UIControlStateNormal 状态下的图片
@property (nullable, nonatomic) UIImage *normalImage;
/// 获取或设置 UIControlStateSelected 状态下的图片
@property (nullable, nonatomic) UIImage *selectedImage;
/// 获取或设置 UIControlStateDisabled 状态下的图片
@property (nullable, nonatomic) UIImage *disabledImage;

/// 获取或设置 UIControlStateNormal 状态下的背景图片
@property (nullable, nonatomic) UIImage *normalBackgroundImage;
/// 获取或设置 UIControlStateSelected 状态下的背景图片
@property (nullable, nonatomic) UIImage *selectedBackgroundImage;
/// 获取或设置 UIControlStateDisabled 状态下的背景图片
@property (nullable, nonatomic) UIImage *disabledBackgroundImage;

/// 更简洁地设置按钮事件，封装 [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
- (void)addTarget:(nullable id)target action:(nullable SEL)action;

/// 设置不同状态下的背景色，内容其实是通过设置不同状态的纯色背景图片实现此功能
- (void)setBackgroundColor:(nullable UIColor *)bgColor forState:(UIControlState)state;

@end
