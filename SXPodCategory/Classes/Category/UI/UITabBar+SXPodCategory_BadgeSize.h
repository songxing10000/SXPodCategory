//
//  UITabBar+BadgeSize.h
//  CKK_SJ
//
//  Created by dfpo on 2016/12/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 tabbar上的红点大小处理
 */
@interface UITabBar (SXPodCategory_BadgeSize)


/**
 显示小红点
 */
- (void)showBadgeOnItemIndex:(int)index;


/**
 隐藏小红点
 */
- (void)hideBadgeOnItemIndex:(int)index;
@end
/*  使用案例
 一、导入头文件
 #import "UITabBar+badge.h"
 
 二、tabBarController.tabBar调用方法
 
 //显示
 [self.tabBarController.tabBar showBadgeOnItemIndex:2];
 //隐藏
 [self.tabBarController.tabBar hideBadgeOnItemIndex:2]
 
 */
