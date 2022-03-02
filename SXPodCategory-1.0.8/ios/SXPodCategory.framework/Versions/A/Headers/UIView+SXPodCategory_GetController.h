//
//  UIView+GetController.h
//  dfpo
//
//  Created by dfpo on 16/7/25.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SXPodCategory_GetController)

/**寻找自身所在的控制器*/
- (UIViewController *_Nullable)viewController;

/**寻找响应链上的指定类实例*/
- (id _Nullable)nextResponderForClass:(Class _Nullable )cls;
@end
