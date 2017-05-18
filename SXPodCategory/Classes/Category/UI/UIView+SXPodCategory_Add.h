

#import <UIKit/UIKit.h>

#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))
///线的宽度
#define kLineWidth (IS_RETINA ? 0.5 : 1)

/** 快速集成x,y,width,height等getter setter方法 */
@interface UIView (Add)

@property (nonatomic) CGFloat x; /**< 直接获取/设置UIView的x属性 */

@property (nonatomic) CGFloat y; /**< 直接获取/设置UIView的y属性 */

@property (nonatomic) CGFloat centerX; /**< 直接获取/设置UIView的中心点的x属性 */

@property (nonatomic) CGFloat centerY; /**< 直接获取/设置UIView的中心点的y属性 */

@property (nonatomic) CGFloat width; /**< 直接获取/设置UIView的width属性 */

@property (nonatomic) CGFloat height; /**< 直接获取/设置UIView的height属性 */

@property (nonatomic) CGSize  size; /**< 直接获取/设置UIView的size属性 */

@property (nonatomic) CGPoint origin; /**< 直接获取/设置UIView的origin属性 */

@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;


/** 从xib中创建一个控件，无File's Owner */
+ (instancetype)viewFromXib;

- (void)removeAllSubviews;
@end
