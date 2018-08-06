//
//  UIButton+Call.m
//  dfpo
//
//  Created by dfpo on 2016/11/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UIButton+SXPodCategory_Call.h"

@implementation UIButton(SXPodCategory_Call)
- (void)setNormalTitle:(NSString *)normalTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
}
- (NSString *)normalTitle {
    return [self titleForState:UIControlStateNormal];
}
- (void)setSelectedTitle:(NSString *)selectedTitle {
    [self setTitle:selectedTitle forState:UIControlStateSelected];

}
- (NSString *)selectedTitle {
    return [self titleForState:UIControlStateSelected];
}
- (void)setDisabledTitle:(NSString *)disabledTitle {
    [self setTitle:disabledTitle forState:UIControlStateDisabled];

}
- (NSString *)disabledTitle {
    return [self titleForState:UIControlStateDisabled];

}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
}
- (UIColor *)normalTitleColor {
    return [self titleColorForState:UIControlStateNormal];
}

- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor {
    [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
}
- (UIColor *)selectedTitleColor {
    return [self titleColorForState:UIControlStateSelected];
}
- (void)setDisabledTitleColor:(UIColor *)disabledTitleColor {
    [self setTitleColor:disabledTitleColor forState:UIControlStateDisabled];
}
- (UIColor *)disabledTitleColor {
    return [self titleColorForState:UIControlStateDisabled];
}

- (void)setNormalImage:(UIImage *)normalImage {
    [self setImage:normalImage forState:UIControlStateNormal];
}
- (UIImage *)normalImage {
    return [self imageForState:UIControlStateNormal];
}
- (void)setSelectedImage:(UIImage *)selectedImage {
    [self setImage:selectedImage forState:UIControlStateSelected];

}
- (UIImage *)selectedImage {
    return [self imageForState:UIControlStateSelected];
}
- (void)setDisabledImage:(UIImage *)disabledImage {
    [self setImage:disabledImage forState:UIControlStateDisabled];
}
- (UIImage *)disabledImage {
    return [self imageForState:UIControlStateDisabled];
}

- (void)setNormalBackgroundImage:(UIImage *)normalBackgroundImage {
    [self setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
}
- (UIImage *)normalBackgroundImage {
    return [self backgroundImageForState:UIControlStateNormal];
}

- (void)setSelectedBackgroundImage:(UIImage *)selectedBackgroundImage {
    [self setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
}
- (UIImage *)selectedBackgroundImage {
    return [self backgroundImageForState:UIControlStateSelected];
}
- (void)setDisabledBackgroundImage:(UIImage *)disabledBackgroundImage {
    [self setBackgroundImage:disabledBackgroundImage forState:UIControlStateDisabled];
}
- (UIImage *)disabledBackgroundImage {
    return [self backgroundImageForState:UIControlStateDisabled];
}
///     [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
- (void)addTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
