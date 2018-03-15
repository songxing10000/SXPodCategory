//
//  UINavigationController+RemoveVC.m
//  dfpo
//
//  Created by mac on 2017/4/12.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "UINavigationController+SXPodCategory_RemoveVC.h"

@implementation UINavigationController (SXPodCategory_RemoveVC)

- (void)removeVCClass:(Class)aVCClass{
    
    NSMutableArray <UIViewController *> *vcs = self.viewControllers.mutableCopy;
    
    [vcs enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([vc isKindOfClass:[aVCClass class]]) {
            [vc.view removeFromSuperview];
            [vcs removeObject:vc];
        }
    }];
    self.viewControllers = vcs;
}
@end
