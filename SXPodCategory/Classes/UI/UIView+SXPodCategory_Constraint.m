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
    NSArray *constraintArray = [self.superview constraints];
    
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }
    
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

@end
