//
//  UIView+Constraint.h
//  dfpo
//
//  Created by mac on 2017/4/7.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SXPodCategory_Constraint)


/**
 当前view的，宽度约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *widthConstraint;

/**
 当前view的，高度约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *heightConstraint;

/**
 当前view的，左侧约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *leadingConstraint;

/**
 当前view的，右侧约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *trailingConstraint;

/**
 当前view的，上方约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *topConstraint;

/**
 当前view的，下方约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *bottomConstraint;

@end
