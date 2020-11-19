//
//  UIView+Constraint.m
//  dfpo
//
//  Created by mac on 2017/4/7.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "UIView+SXPodCategory_Constraint.h"

@implementation UIView (SXPodCategory_Constraint)
- (NSLayoutConstraint *)widthConstraint {
    return [self constraintForAttribute:NSLayoutAttributeWidth];
}
- (NSLayoutConstraint *)heightConstraint {
    return [self constraintForAttribute:NSLayoutAttributeHeight];
}
- (NSLayoutConstraint *)trailingConstraint {
    return [self constraintForAttribute:NSLayoutAttributeTrailing];
}
- (NSLayoutConstraint *)leadingConstraint {
    return [self constraintForAttribute:NSLayoutAttributeLeading];
}
- (NSLayoutConstraint *)topConstraint {
    return [self constraintForAttribute:NSLayoutAttributeTop];
}
- (NSLayoutConstraint *)bottomConstraint {
    return [self constraintForAttribute:NSLayoutAttributeBottom];
}
- (NSLayoutConstraint *)centerXConstraint {
    return [self constraintForAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)centerYConstraint {
    return [self constraintForAttribute:NSLayoutAttributeCenterY];
}

-(NSLayoutConstraint *)constraintForAttribute:(NSLayoutAttribute)attribute {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray<NSLayoutConstraint *> *constraintArray = [self.superview constraints];

    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }
    
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        if (attribute == NSLayoutAttributeLeft) {
            for (NSLayoutConstraint *constraint in constraintArray) {
                if ([constraint.firstItem isEqual: self] ||
                    [constraint.secondItem isEqual: self]) {
                    if (constraint.firstAttribute == NSLayoutAttributeLeading ||
                        constraint.secondAttribute == NSLayoutAttributeLeading) {
                        // ib中的约束 是leading
                        return  constraint;
                    }
                }
            }
        }
        else if (attribute == NSLayoutAttributeRight) {
            for (NSLayoutConstraint *constraint in constraintArray) {
                if ([constraint.firstItem isEqual: self] ||
                    [constraint.secondItem isEqual: self]) {
                    if (constraint.firstAttribute == NSLayoutAttributeTrailing ||
                        constraint.secondAttribute == NSLayoutAttributeTrailing) {
                        // ib中的约束 是trailing
                        return  constraint;
                    }
                }
            }
        }
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

@end
