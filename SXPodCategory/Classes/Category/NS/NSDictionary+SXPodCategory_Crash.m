//
//  NSDictionary+Crash.m
//  Chekuaikuai
//
//  Created by mac on 2017/4/26.
//  Copyright © 2017年 北京壹号车科技有限公司. All rights reserved.
//

#import "NSDictionary+SXPodCategory_Crash.h"


@implementation NSDictionary (SXPodCategory_Crash)
+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == NSSelectorFromString(@"objectAtIndexedSubscript:") ||
        aSelector == NSSelectorFromString(@"safe_ObjectAtIndex:")) {
        NSLog(@"--错误--把数组->%@,当作字典来操作---", self);
        return @[].mutableCopy;
    }
    
    
    return nil;
}

@end
