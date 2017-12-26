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


- (instancetype)stringValue {
    
    return self;
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {

    // use NSString as NSNumber
    if ([NSNumber instancesRespondToSelector:aSelector]) {
        
//        NSLog(@"--错误--把NSNumber->%@,当作字符串来操作---", self);
        return [[NSDecimalNumber alloc] initWithString:self];
        
    } else if ([NSString instancesRespondToSelector:aSelector]) {
        
        return self;
    } else if ([NSArray instancesRespondToSelector:aSelector]) {
        
//        NSLog(@"--错误--把NSArray->%@,当作字符串来操作---", self);
        return @[];
    } else if ([NSDictionary instancesRespondToSelector:aSelector]) {
        
//        NSLog(@"--错误--把NSDictionary->%@,当作字符串来操作---", self);
        return @{};
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
