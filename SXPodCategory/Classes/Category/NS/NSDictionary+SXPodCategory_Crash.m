//
//  NSDictionary+Crash.m
//  dfpo
//
//  Created by mac on 2017/4/26.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "NSDictionary+SXPodCategory_Crash.h"


@implementation NSDictionary (SXPodCategory_Crash)
+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if ([NSArray instancesRespondToSelector:aSelector]) {
        
//        NSLog(@"--错误--把NSArray->%@,当作字典来操作---", self);
        return @[];
    }else if ([NSNumber instancesRespondToSelector:aSelector]) {
        
//        NSLog(@"--错误--把NSNumber->%@,当作字典来操作---", self);
        return @1111111;
    }
    else if ([NSString instancesRespondToSelector:aSelector]) {
        
//        NSLog(@"--错误--把NSString->%@,当作字典来操作---", self);
        return @"1111111";
    } else if ([NSDictionary instancesRespondToSelector:aSelector]) {
        
        return self;
    }
    
    
    return [super forwardingTargetForSelector:aSelector];
}

@end
