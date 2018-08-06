//
//  UIView+GetController.m
//  dfpo
//
//  Created by dfpo on 16/7/25.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UIView+SXPodCategory_GetController.h"
@implementation UIView (SXPodCategory_GetController)
-(UIViewController *)viewController {
    return [self getViewController];
}
- (UIViewController *)getViewController {
    
    if ([self.nextResponder isKindOfClass:[UIViewController class]]) {
        return (UIViewController *)self.nextResponder;
    }
    if (self.superview == nil) {
        return [self topViewController];
    }
    return self.superview.getViewController;
}
//获取当前屏幕显示的viewcontroller
- (UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[self windowRootViewController]];
}
- (UIViewController *)windowRootViewController{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}
@end
