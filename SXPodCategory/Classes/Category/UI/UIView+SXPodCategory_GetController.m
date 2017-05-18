//
//  UIView+GetController.m
//  dfpo
//
//  Created by dfpo on 16/7/25.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UIView+SXPodCategory_GetController.h"
@implementation UIView (SXPodCategory_GetController)
@dynamic viewController; 

- (UIViewController *)getViewController {
    
    if ([self.nextResponder isKindOfClass:[UIViewController class]]) {
        return (UIViewController *)self.nextResponder;
    }
    if (self.superview == nil) {
        NSAssert(NO, @"此控件没有父控件");
    }
    return self.superview.getViewController;
}

@end
