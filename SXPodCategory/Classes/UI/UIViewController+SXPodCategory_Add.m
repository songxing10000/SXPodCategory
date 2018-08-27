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


//静态就交换静态，实例方法就交换实例方法
void SXPodCategory_Swizzle(Class c, SEL origSEL, SEL newSEL)
{
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method newMethod = nil;
    if (!origMethod) {
        origMethod = class_getClassMethod(c, origSEL);
        if (!origMethod) {
            return;
        }
        newMethod = class_getClassMethod(c, newSEL);
        if (!newMethod) {
            return;
        }
    }else{
        newMethod = class_getInstanceMethod(c, newSEL);
        if (!newMethod) {
            return;
        }
    }
    
    //自身已经有了就添加不成功，直接交换即可
    if(class_addMethod(c, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))){
        class_replaceMethod(c, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else{
        method_exchangeImplementations(origMethod, newMethod);
    }
}


@implementation UIViewController (SXPodCategory_Add)

+ (instancetype)vcFromStoryboard {
    
    NSString *classStringHasPrefix = NSStringFromClass([self class]);
    NSArray *classStrings = [classStringHasPrefix componentsSeparatedByString:@"."];
    NSString *classString = classStrings.lastObject;
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:classString bundle:nil];

    if (!sb || ![sb instantiateInitialViewController]) {
        
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor redColor];
        return vc;
    }
    return [sb instantiateInitialViewController];
}
+ (instancetype)vcFromStoryboardWithName:(NSString *)name {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    NSString *classStringHasPrefix = NSStringFromClass([self class]);
    NSArray *classStrings = [classStringHasPrefix componentsSeparatedByString:@"."];
    NSString *classString = classStrings.lastObject;
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier: classString];
    if (vc) {
        
        return vc;
    }
    vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    return vc;
}

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
- (void)popToVCByVCName:(NSString *)vcName {
    
    [self.navigationController.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([vc isKindOfClass:NSClassFromString(vcName)]) {
            [self.navigationController popToViewController:vc animated:YES];
            *stop = YES;
        }
        
    }];
}
#pragma mark 发送通知
- (void)postNotificationName:(NSString *)aName {
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:nil];
}
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject {
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject];
}
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:aUserInfo];
}
#pragma mark - 监听通知
- (void)addObserverSelfAndSelector:(SEL)aSelector name:(nullable NSString *)aName {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:aSelector name:aName object:nil];
}
#pragma mark 移除通知
- (void)removeObserverSelf {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 相册、拍照相关
- (void)openCameraWithcompled:(SXPodCategory_DidFinishTakeMediaCompledBlock)compled {
    
    if (![self checkCameraAuthorizationStatus]) {
        return;
    }
    
    [self.photoHelper showOnPickerViewControllerSourceType:UIImagePickerControllerSourceTypeCamera onViewController:self compled:compled];
    
    
}
- (void)openAlbumWithcompled:(SXPodCategory_DidFinishTakeMediaCompledBlock)compled {
    if (![self checkPhotoLibraryAuthorizationStatus]) {
        return;
    }
    [self.photoHelper showOnPickerViewControllerSourceType:UIImagePickerControllerSourceTypePhotoLibrary onViewController:self compled:compled];
}
- (BOOL)checkCameraAuthorizationStatus
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        [self showTipsAlertWithMsg:@"该设备不支持拍照"];
        return NO;
    }
    
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (AVAuthorizationStatusDenied == authStatus ||
            AVAuthorizationStatusRestricted == authStatus) {
            
            [self showTipsAlertWithMsg:@"请在iPhone的“设置->隐私->相机”中打开本应用的访问权限"];
            return NO;
        }
    }
    
    return YES;
}
- (BOOL)checkPhotoLibraryAuthorizationStatus
{
    if ([ALAssetsLibrary respondsToSelector:@selector(authorizationStatus)]) {
        ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
        if (ALAuthorizationStatusDenied == authStatus ||
            ALAuthorizationStatusRestricted == authStatus) {
            
            [self showTipsAlertWithMsg:@"请在iPhone的“设置->隐私->照片”中打开本应用的访问权限"];
            return NO;
        }
    }
    return YES;
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
    if ([result isKindOfClass:[UITabBarController class]] ||
        [result isKindOfClass:NSClassFromString(@"CKKTabBarController")] ||
        [result isKindOfClass:NSClassFromString(@"KYTabBarController")]) {
        
        result = [(UITabBarController *)result selectedViewController];
    }
    if ([result isKindOfClass:[UINavigationController class]] ||
        [result isKindOfClass:NSClassFromString(@"CKKNavigationController")] ||
        [result isKindOfClass:NSClassFromString(@"KYNavigationController")]) {
        
        result = [(UINavigationController *)result topViewController];
    }
    return result;
}
- (void)showTipsAlertWithMsg:(NSString *)msg {

    [self showTipsAlertWithMsg:msg handler:NULL];
}

- (void)showTipsAlertWithMsg:(NSString *)msg handler:(void (^ __nullable)(void))handler{
    
    NSString *title = @"提示";
    
    UIAlertController *alertC =
    [UIAlertController alertControllerWithTitle:title
                                        message:msg
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction =
    [UIAlertAction actionWithTitle:@"知道了"
                             style:UIAlertActionStyleCancel
                           handler:^(UIAlertAction * _Nonnull action) {
                               if (handler) {
                                   handler();
                               }
                           }];
    
    [alertC addAction:cancelAction];
    
    [self presentViewController:alertC animated:YES completion:NULL];
}
#pragma mark - 关联对象处理
- (SXPodCategory_XHPhotographyHelper *)photoHelper
{
    static SXPodCategory_XHPhotographyHelper *_sx_defaultPhotoHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sx_defaultPhotoHelper = [[SXPodCategory_XHPhotographyHelper alloc] init];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
    return objc_getAssociatedObject(self, @selector(photoHelper)) ?: _sx_defaultPhotoHelper;
#pragma clang diagnostic pop
}
- (void)setPhotoHelper:(SXPodCategory_XHPhotographyHelper *)photoHelper {
    
    objc_setAssociatedObject(self, @selector(photoHelper), photoHelper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end




@interface SXPodCategory_XHPhotographyHelper ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) SXPodCategory_DidFinishTakeMediaCompledBlock didFinishTakeMediaCompled;

@end

@implementation SXPodCategory_XHPhotographyHelper

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)dealloc {
    self.didFinishTakeMediaCompled = nil;
}

- (void)showOnPickerViewControllerSourceType:(UIImagePickerControllerSourceType)sourceType onViewController:(UIViewController *)viewController compled:(SXPodCategory_DidFinishTakeMediaCompledBlock)compled {
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
        return;
    }
    self.didFinishTakeMediaCompled = [compled copy];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.editing = YES;
    imagePickerController.delegate = self;
    imagePickerController.sourceType = sourceType;
    imagePickerController.allowsEditing = NO;
    if (sourceType == UIImagePickerControllerSourceTypeCamera) {
        /// 在拍照界面，不允许出现照片选项，否则外界调用会有问题
//        imagePickerController.mediaTypes =  [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    
    
    // 风格一致
//    UIColor *color = [UIColor redColor];
//
//    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
//    UIImage *image = [self imageWithColor:color withFrame:frame];
//    [imagePickerController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    imagePickerController.navigationBar.tintColor = color;
        imagePickerController.navigationBar.tintColor = [UIColor blackColor];

//    imagePickerController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
//                                                                NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    
    [viewController presentViewController:imagePickerController animated:YES completion:NULL];
}
- (UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame{
    
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    CGContextFillRect(context, aFrame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
- (void)dismissPickerViewController:(UIImagePickerController *)picker {
    
    typeof(self) __weak weakSelf = self;
    [picker dismissViewControllerAnimated:YES completion:^{
        weakSelf.didFinishTakeMediaCompled = nil;
    }];
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    if (self.didFinishTakeMediaCompled) {
        
        self.didFinishTakeMediaCompled(info[picker.allowsEditing?UIImagePickerControllerEditedImage:UIImagePickerControllerOriginalImage], info);
    }
    [self dismissPickerViewController:picker];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissPickerViewController:picker];
}

@end
