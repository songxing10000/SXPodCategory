//
//  NSArray+Crash.m
//  dfpo
//
//  Created by mac on 2017/4/26.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "NSArray+SXPodCategory_Crash.h"

@implementation NSArray (SXPodCategory_Crash)

- objectForKey:(NSString *)aKey {
    
    NSLog(@"----%@---", @"把数组当字典来使用");
    return nil;
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if ([NSDictionary instancesRespondToSelector:aSelector]) {
        NSLog(@"--错误--把字典->%@,当作数组来操作---", self);
        return @{}.mutableCopy;
    }
    
    
    return nil;
}

@end
