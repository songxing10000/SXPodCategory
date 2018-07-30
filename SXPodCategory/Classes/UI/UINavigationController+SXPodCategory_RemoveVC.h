//
//  UINavigationController+RemoveVC.h
//  dfpo
//
//  Created by mac on 2017/4/12.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (SXPodCategory_RemoveVC)

/**
 移除堆栈里类型为 VCClass 的控制器
 */
- (void)removeVCClass:(Class)aVCClass;

/**
 调回到某个页面

 @param ctrlClassName 页面的类名字符串
 @param animate 是否动画
 */
- (void)backToController:(NSString *)ctrlClassName animated:(BOOL)animate;

@end
