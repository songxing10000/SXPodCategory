//
//  UIView+Constraint.m
//  Chekuaikuai
//
//  Created by mac on 2017/4/7.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "UIView+SXPodCategory_Constraint.h"
#import "NSObject+SXPodCategory_BKAssociatedObjects.h"

static const char *kCustomWidthKey = "kCustomWidthKey";
static const char *kCustomHeightKey = "kCustomHeightKey";
static const char *kCustomLeadingKey = "kCustomLeadingKey";
static const char *kCustomTrailingKey = "kCustomTrailingKey";
static const char *kCustomTopKey = "kCustomTopKey";
static const char *kCustomBottomKey = "kCustomBottomKey";

@implementation UIView (SXPodCategory_Constraint)
- (NSLayoutConstraint *)widthConstraint {
    NSLayoutConstraint *widthConstraint = [self bk_associatedValueForKey:kCustomWidthKey];
    if (widthConstraint) {
        return widthConstraint;
    }
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (((constraint.firstItem == self && constraint.secondItem == nil) || (constraint.firstItem == nil && constraint.secondItem == self)) &&
            ((constraint.firstAttribute == NSLayoutAttributeWidth && constraint.relation == NSLayoutRelationEqual) ||
             (constraint.secondAttribute == NSLayoutAttributeWidth && constraint.relation == NSLayoutRelationEqual))) {
                
                [self bk_weaklyAssociateValue:constraint withKey:kCustomWidthKey];
                return constraint;
        }
    }
    return nil;
}
- (NSLayoutConstraint *)heightConstraint {
    NSLayoutConstraint *heightConstraint = [self bk_associatedValueForKey:kCustomHeightKey];
    if (heightConstraint) {
        return heightConstraint;
    }
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (((constraint.firstItem == self && constraint.secondItem == nil) || (constraint.firstItem == nil && constraint.secondItem == self)) &&
            ((constraint.firstAttribute == NSLayoutAttributeHeight && constraint.relation == NSLayoutRelationEqual) ||
             (constraint.secondAttribute == NSLayoutAttributeHeight && constraint.relation == NSLayoutRelationEqual))) {
            
            
                [self bk_weaklyAssociateValue:constraint withKey:kCustomHeightKey];
                return constraint;
        }
    }
    
    
    return nil;
}
- (NSLayoutConstraint *)trailingConstraint {
    if (self.superview == nil) {
        return nil;
    }
    NSLayoutConstraint *trailingConstraint = [self bk_associatedValueForKey:kCustomTrailingKey];
    if (trailingConstraint) {
        return trailingConstraint;
    }
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ((constraint.firstItem != nil && constraint.secondItem != nil) &&
            (constraint.firstAttribute == NSLayoutAttributeTrailing || constraint.secondAttribute == NSLayoutAttributeTrailing) &&
            (constraint.firstItem == self || constraint.secondItem == self)) {
            [self bk_weaklyAssociateValue:constraint withKey:kCustomTrailingKey];
            return constraint;
        }
    }
    return nil;
}
- (NSLayoutConstraint *)leadingConstraint {
    if (self.superview == nil) {
        return nil;
    }
    NSLayoutConstraint *leadingConstraint = [self bk_associatedValueForKey:kCustomLeadingKey];
    if (leadingConstraint) {
        return leadingConstraint;
    }
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ((constraint.firstItem != nil && constraint.secondItem != nil) &&
            (constraint.firstAttribute == NSLayoutAttributeLeading || constraint.secondAttribute == NSLayoutAttributeLeading) &&
            (constraint.firstItem == self || constraint.secondItem == self)) {
            
            [self bk_weaklyAssociateValue:constraint withKey:kCustomLeadingKey];
            return constraint;
        }
    }
    return nil;
}
- (NSLayoutConstraint *)topConstraint {
    if (self.superview == nil) {
        return nil;
    }
    NSLayoutConstraint *topConstraint = [self bk_associatedValueForKey:kCustomTopKey];
    if (topConstraint) {
        return topConstraint;
    }
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ((constraint.firstItem != nil && constraint.secondItem != nil) &&
            (constraint.firstAttribute == NSLayoutAttributeTop || constraint.secondAttribute == NSLayoutAttributeTop) &&
            (constraint.firstItem == self || constraint.secondItem == self)) {
            
            [self bk_weaklyAssociateValue:constraint withKey:kCustomTopKey];
            return constraint;
        }
    }
    return nil;
}
- (NSLayoutConstraint *)bottomConstraint {
    if (self.superview == nil) {
        return nil;
    }
    NSLayoutConstraint *bottomConstraint = [self bk_associatedValueForKey:kCustomBottomKey];
    if (bottomConstraint) {
        return bottomConstraint;
    }
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ((constraint.firstItem != nil && constraint.secondItem != nil) &&
            (constraint.firstAttribute == NSLayoutAttributeBottom || constraint.secondAttribute == NSLayoutAttributeBottom) &&
            (constraint.firstItem == self || constraint.secondItem == self)) {
            
            [self bk_weaklyAssociateValue:constraint withKey:kCustomBottomKey];
            return constraint;
        }
    }
    return nil;
}
@end
