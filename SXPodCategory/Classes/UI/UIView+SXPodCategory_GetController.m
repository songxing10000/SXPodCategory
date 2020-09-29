//
//  UIView+GetController.m
//  dfpo
//
//  Created by dfpo on 16/7/25.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UIView+SXPodCategory_GetController.h"
@implementation UIView (SXPodCategory_GetController)
#pragma mark - 寻找自身所在的控制器
- (UIViewController *)viewController {
    return [self nextResponderForClass:NSClassFromString(@"UIViewController")];
}

#pragma mark - 寻找响应链上的指定类实例
- (id)nextResponderForClass:(Class)cls {
    if ([self isKindOfClass:cls]) return self;
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:cls]) break;
        responder = responder.nextResponder;
    } while (responder);
    return responder;
}

@end
