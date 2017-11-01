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
    if ([NSString instancesRespondToSelector:aSelector]) {
       
        NSLog(@"--错误--把NSString->%@,当作NSNumber来操作---", self);
        return [NSString stringWithFormat:@"%@", self];
    } else if ([NSNumber instancesRespondToSelector:aSelector]) {
        
        return self;
    } else if ([NSArray instancesRespondToSelector:aSelector]) {
        
        NSLog(@"--错误--把NSArray->%@,当作NSNumber来操作---", self);
        return @[];
    } else if ([NSDictionary instancesRespondToSelector:aSelector]) {
        
        NSLog(@"--错误--把NSDictionary->%@,当作NSNumber来操作---", self);
        return @{};
    }
    return nil;
}

@end
