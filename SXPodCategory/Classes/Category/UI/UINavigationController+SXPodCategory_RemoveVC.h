//
//  UINavigationController+RemoveVC.h
//  Chekuaikuai
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
@end
