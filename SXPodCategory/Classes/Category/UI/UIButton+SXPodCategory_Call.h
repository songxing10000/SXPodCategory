//
//  UIButton+Call.h
//  dfpo
//
//  Created by dfpo on 2016/11/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SXPodCategory_Call)

@property (nullable, nonatomic) NSString *normalTitle;
@property (nullable, nonatomic) NSString *selectedTitle;
@property (nullable, nonatomic) NSString *disabledTitle;

@property (nullable, nonatomic) UIColor *normalTitleColor;
@property (nullable, nonatomic) UIColor *selectedTitleColor;
@property (nullable, nonatomic) UIColor *disabledTitleColor;

@property (nullable, nonatomic) UIImage *normalImage;
@property (nullable, nonatomic) UIImage *selectedImage;
@property (nullable, nonatomic) UIImage *disabledImage;

@property (nullable, nonatomic) UIImage *normalBackgroundImage;
@property (nullable, nonatomic) UIImage *selectedBackgroundImage;
@property (nullable, nonatomic) UIImage *disabledBackgroundImage;

///     [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
- (void)addTarget:(nullable id)target action:(nullable SEL)action;
@end
