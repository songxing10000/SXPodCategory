//
//  UIView+GetController.h
//  dfpo
//
//  Created by dfpo on 16/7/25.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SXPodCategory_GetController)

/// 拿到当前view所在的控制器
@property (nonatomic, readonly) UIViewController *viewController;
@end
