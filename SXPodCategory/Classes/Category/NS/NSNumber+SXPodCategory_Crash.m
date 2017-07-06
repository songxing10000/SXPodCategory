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

    // use NSNumber as NSString
    if (aSelector == @selector(length) ||
        aSelector == @selector(isEqualToString:) ||
        aSelector == @selector(rangeOfCharacterFromSet:) ||
        aSelector == NSSelectorFromString(@"isNaturallyRTL") ||
        aSelector == @selector(drawWithRect:options:attributes:context:) ||
        aSelector == NSSelectorFromString(@"hasColorGlyphsInRange:attributes:") ||
        aSelector == @selector(boundingRectWithSize:options:attributes:context:)) {
       
        return [NSString stringWithFormat:@"%@", self];
    }
    return nil;
}

@end
