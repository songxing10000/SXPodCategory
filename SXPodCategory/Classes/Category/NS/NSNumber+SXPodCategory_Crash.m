//
//  NSNumber+Crash.m
//  3434
//
//  Created by dfpo on 16/10/19.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "NSNumber+SXPodCategory_Crash.h"
#import <UIKit/UIKit.h>
@implementation NSNumber (SXPodCategory_Crash)

+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {

    if (aSelector == @selector(length)) {
        return [NSString stringWithFormat:@"%@", self];
    }
    if (aSelector == @selector(boundingRectWithSize:options:attributes:context:)) {
        return [NSString stringWithFormat:@"%@", self];
    }
    if (aSelector == @selector(rangeOfCharacterFromSet:)) {
        return [NSString stringWithFormat:@"%@", self];
    }
    if (aSelector == @selector(drawWithRect:options:attributes:context:)) {
        return [NSString stringWithFormat:@"%@", self];

    }
    if (aSelector == @selector(hasColorGlyphsInRange:attributes:)) {
        return [NSString stringWithFormat:@"%@", self];
    }
    if (aSelector == @selector(isNaturallyRTL)) {
        return [NSString stringWithFormat:@"%@", self];
    }
    return nil;
}

@end
