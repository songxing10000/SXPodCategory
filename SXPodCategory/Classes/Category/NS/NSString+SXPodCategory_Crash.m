//
//  NSStringr+SXPodCategory_Crash.m
//  3434
//
//  Created by dfpo on 16/10/19.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "NSString+SXPodCategory_Crash.h"
#import <UIKit/UIKit.h>
@implementation NSString (SXPodCategory_Crash)

+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {

    // use NSString as NSNumber
    if ([NSNumber instancesRespondToSelector:aSelector]) {
       
        return [[NSDecimalNumber alloc] initWithString:self];
    }
    return nil;
}

@end
