//
//  UIViewController+Add.h
//  BoSheng
//
//  Created by dfpo on 16/9/26.
//  Copyright © 2016年 dfpo. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SXPodCategory_DidFinishTakeMediaCompledBlock)(UIImage *image, NSDictionary *editingInfo);

@interface SXPodCategory_XHPhotographyHelper : NSObject

- (void)showOnPickerViewControllerSourceType:(UIImagePickerControllerSourceType)sourceType onViewController:(UIViewController *)viewController compled:(SXPodCategory_DidFinishTakeMediaCompledBlock)compled;

@end



@interface UIViewController (SXPodCategory_Add)

/**
 隐藏返回按钮
 */
- (void)hideBackItem;
#pragma mark - 简化调用
+ (instancetype)vcFromStoryboard;
+ (instancetype)vcFromStoryboardWithName:(NSString *)name;

/// 简化 self.navigationController pushViewController:vc animated:YES];
- (void)push:(__kindof UIViewController *)vc;

/// 简化 [self.navigationController popViewControllerAnimated:YES];
- (void)pop;

/// 跳转到指定vc
- (void)popToVCByVCName:(NSString *)vcName;
#pragma mark - 简化通知中心调用
/// 简化 [[NSNotificationCenter defaultCenter] postNotificationName:aName object:nil];
- (void)postNotificationName:(NSString *)aName;

/// 简化 [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject];
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject;

/// 简化 [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:aUserInfo];
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

/// 简化 [[NSNotificationCenter defaultCenter] addObserver:self selector:aSelector name:aName object:nil];
- (void)addObserverSelfAndSelector:(SEL)aSelector name:(nullable NSString *)aName;

/// 简化 [[NSNotificationCenter defaultCenter] removeObserver:self];
- (void)removeObserverSelf;


#pragma mark - 相册、拍照相关
@property (nonatomic, strong, nullable) SXPodCategory_XHPhotographyHelper *photoHelper;

/// 打开系统的相机，能编辑照片
- (void)openCameraWithcompled:(SXPodCategory_DidFinishTakeMediaCompledBlock)compled;

/// 打开系统的相册，能编辑照片
- (void)openAlbumWithcompled:(SXPodCategory_DidFinishTakeMediaCompledBlock)compled;
- (BOOL)checkPhotoLibraryAuthorizationStatus;
#pragma mark - 其他
+ (UIViewController *)presentingVC;
/// 一个 title： 提示 ，msg，取消按钮：知道了，的alertController
- (void)showTipsAlertWithMsg:(NSString *)msg;
/// 一个 title： 提示 ，msg，取消按钮：知道了，的alertController,知道了有事件block
- (void)showTipsAlertWithMsg:(NSString *)msg handler:(void (^ __nullable)(void))handler;

/** 获取和自身处于同一个UINavigationController里的上一个UIViewController */
@property(nonatomic, weak, readonly) UIViewController *previousViewController;
@end

NS_ASSUME_NONNULL_END
