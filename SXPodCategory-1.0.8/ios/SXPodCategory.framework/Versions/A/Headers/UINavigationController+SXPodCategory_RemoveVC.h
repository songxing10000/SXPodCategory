//
//  UINavigationController+RemoveVC.h
//  dfpo
//
//  Created by mac on 2017/4/12.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

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

/**
 寻找栈内指定类型控制器
 @param cls 指定类型
 @return 栈内指定类型控制器<nullable>
 */
- (__kindof UIViewController * _Nullable)findViewControllerOfClass:(Class)cls;
@end
NS_ASSUME_NONNULL_END
