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
    if ([NSString instancesRespondToSelector:aSelector]) {
        return [NSString stringWithFormat:@"%@", self];
    } else if ([NSNumber instancesRespondToSelector:aSelector]) {
        return self;
    } else if ([NSArray instancesRespondToSelector:aSelector]) {
        return @[];
    } else if ([NSDictionary instancesRespondToSelector:aSelector]) {
        return @{};
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
