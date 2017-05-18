//
//  NSArray+Crash.m
//  Chekuaikuai
//
//  Created by mac on 2017/4/26.
//  Copyright © 2017年 北京壹号车科技有限公司. All rights reserved.
//

#import "NSArray+SXPodCategory_Crash.h"

@implementation NSArray (SXPodCategory_Crash)
+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == NSSelectorFromString(@"objectForKeyedSubscript:")) {
        NSLog(@"--错误--把字典->%@,当作数组来操作---", self);
        return @{}.mutableCopy;
    }
    
    
    return nil;
}

@end
