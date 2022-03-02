//
//  UIViewController+Add.h
//  BoSheng
//
//  Created by dfpo on 16/9/26.
//  Copyright © 2016年 dfpo. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SXPodCategory_Add)

/**
 隐藏返回按钮
 */
- (void)hideBackItem;
#pragma mark - 简化调用
/// 简化 self.navigationController pushViewController:vc animated:YES];
- (void)push:(__kindof UIViewController *)vc;

/// 简化 [self.navigationController popViewControllerAnimated:YES];
- (void)pop;

/// 跳转到指定vc
- (void)popToVCByVCName:(NSString *)vcName;

- (void)popToVCByVCName:(NSString *)vcName animated:(BOOL)animated;

#pragma mark - 其他
+ (UIViewController *)presentingVC;

/** 获取和自身处于同一个UINavigationController里的上一个UIViewController */
@property(nonatomic, weak, readonly) UIViewController *previousViewController;
@end

NS_ASSUME_NONNULL_END
