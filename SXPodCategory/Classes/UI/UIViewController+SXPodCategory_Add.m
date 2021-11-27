//
//  UIViewController+Add.m
//  BoSheng
//
//  Created by dfpo on 16/9/26.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UIViewController+SXPodCategory_Add.h"

#import <objc/runtime.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>


@implementation UIViewController (SXPodCategory_Add)

- (void)hideBackItem {
    // 不用系统的item这行代码有效果，可以隐藏返回按钮
    self.navigationItem.leftBarButtonItem = nil;
    // 用系统的item这行代码有效果，可以隐藏返回按钮
    self.navigationItem.hidesBackButton =YES;
}
#pragma mark - 简化调用
- (void)push:(__kindof UIViewController *)vc {
    if ([self isKindOfClass:[UINavigationController class]]) {
        
        [(UINavigationController *)self pushViewController:vc animated:YES];
    } else if ([self isKindOfClass:[UITabBarController class]]) {
        
        [[(UITabBarController *)self selectedViewController] push:vc];
    } else {
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(void)pop {
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)self;
        [nav popViewControllerAnimated:YES];
    } else {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)popToVCByVCName:(NSString *)vcName animated:(BOOL)animated {
    UINavigationController *nav = self.navigationController;
    if (nav == nil) {
        return;
    }
    NSArray<UIViewController *> *vcs = nav.viewControllers;
    NSArray<UIViewController *> *destVCs =
    [vcs filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject isKindOfClass: NSClassFromString(vcName)];
    }]];
    if (destVCs.count <= 0) {
        return;
    }
    [nav popToViewController:destVCs[0] animated:animated];
    
}
- (void)popToVCByVCName:(NSString *)vcName {
    [self popToVCByVCName: vcName animated: YES];
}
#pragma mark - 其他
- (UIViewController *)previousViewController {
    if (self.navigationController.viewControllers && self.navigationController.viewControllers.count > 1 && self.navigationController.topViewController == self) {
        NSUInteger count = self.navigationController.viewControllers.count;
        return (UIViewController *)[self.navigationController.viewControllers objectAtIndex:count - 2];
    }
    return nil;
}
+ (UIViewController *)presentingVC{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        
        result = [(UITabBarController *)result selectedViewController];
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        
        result = [(UINavigationController *)result topViewController];
    }
    return result;
}
@end
