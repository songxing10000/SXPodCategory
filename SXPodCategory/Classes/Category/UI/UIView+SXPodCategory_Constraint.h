//
//  UIView+Constraint.h
//  Chekuaikuai
//
//  Created by mac on 2017/4/7.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SXPodCategory_Constraint)


/**
 宽度约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *widthConstraint;

/**
 高度约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *heightConstraint;

/**
 左侧约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *leadingConstraint;

/**
 右侧约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *trailingConstraint;

/**
 上方约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *topConstraint;

/**
 下方约束
 */
@property (nonatomic, weak, readonly) NSLayoutConstraint *bottomConstraint;

@end
