//
//  NSDictionary+Crash.m
//  dfpo
//
//  Created by mac on 2017/4/26.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "NSDictionary+SXPodCategory_Crash.h"
#import <objc/runtime.h>

@implementation NSDictionary (SXPodCategory_Crash)
NSString *tempKey;
id dynamicGetterIMP(id self, SEL _cmd) {
    if([self isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)self;
        if ([dict.allKeys containsObject:tempKey]) {
            return [self valueForKeyPath:tempKey];
        }
    }
    return nil;
}
void dynamicSetterIMP(id self, SEL _cmd, id value) {
    if([self isKindOfClass:[NSMutableDictionary class]]) {
        NSMutableDictionary *dict = (NSMutableDictionary *)self;
        if ([dict.allKeys containsObject:tempKey]) {
            [dict setObject:value forKey:tempKey];
        }
    }
}
+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}
+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    
    NSString *selString = NSStringFromSelector(aSEL);
    if(![selString containsString:@":"]) {
        tempKey = nil;
        tempKey = NSStringFromSelector(aSEL);
        class_addMethod(self, aSEL, (IMP)dynamicGetterIMP, "v@:");
        return YES;
    } else if (selString.length >= 4 &&
               [selString hasPrefix:@"set"] &&
               [selString componentsSeparatedByString:@":"]) {
        
        if ([selString characterAtIndex:3] >= 'A' && [selString characterAtIndex:3] <= 'Z') {
            @autoreleasepool {
                NSString *noMaoHaoString = [selString stringByReplacingOccurrencesOfString:@":" withString:@""];
                NSString *noSetString = [noMaoHaoString stringByReplacingOccurrencesOfString:@"set" withString:@""];
                NSString *firstString = [[NSString stringWithFormat: @"%C", [noSetString characterAtIndex:0]] lowercaseString];
                NSString *otherString =
                [noSetString stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
                tempKey = nil;
                tempKey = [firstString stringByAppendingString:otherString];
                class_addMethod(self, aSEL, (IMP)dynamicSetterIMP, "v@:@");
            }
            return YES;
        }
        
    }
    return [super resolveInstanceMethod:aSEL];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([NSArray instancesRespondToSelector:aSelector]) {
        return @[];
    }else if ([NSNumber instancesRespondToSelector:aSelector]) {
        return @1111111;
    }
    else if ([NSString instancesRespondToSelector:aSelector]) {
        return @"1111111";
    } else if ([NSDictionary instancesRespondToSelector:aSelector]) {
        return self;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
