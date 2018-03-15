//
//  NSArray+SX_Safe.m
//  dfpo
//
//  Created by mac on 2017/3/22.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "NSArray+SXPodCategory_SX_Safe.h"

@implementation NSArray (SXPodCategory_SX_Safe)
- objectForKey:(NSString *)aKey {
    
    //    NSLog(@"----%@---", @"把数组当字典来使用");
    return nil;
}
- (__kindof id)safe_ObjectAtIndex:(NSUInteger)index {
    if ([self count] == 0) {
        
        return nil;
    }
    if (index < self.count) {
    
        return [self objectAtIndex:index];
    }
//    NSLog(@"----数组-> %@ ,取第-> %zd个元素时出错---", self, index);
    return nil;
}
+ (BOOL)resolveClassMethod:(SEL)sel
{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if ([NSDictionary instancesRespondToSelector:aSelector]) {
        
        //        NSLog(@"--错误--把字典->%@,当作数组来操作---", self);
        return @{};
    } else if ([NSArray instancesRespondToSelector:aSelector]) {
        
        return self;
    } else if ([NSNumber instancesRespondToSelector:aSelector]) {
        
        //        NSLog(@"--错误--把NSNumber->%@,当作数组来操作---", self);
        return @1111111;
    } else if ([NSString instancesRespondToSelector:aSelector]) {
        
        //        NSLog(@"--错误--把NSString->%@,当作数组来操作---", self);
        return @"1111111";
    }
    
    
    return [super forwardingTargetForSelector:aSelector];
}

@end


@implementation NSMutableArray (SXPodCategory_SX_Safe)
- (void)safe_addObject:(id)anObject {
    
    if (anObject != nil) {
    
        [self addObject:anObject];
    } else {
        
//        NSLog(@"----数组-> %@ ,加入元素-> %@ 时出错---", self, anObject);
    }
}
@end

@implementation NSDictionary(SX_Safe)

- (void)safeSetObject:(id)anObject forKey:(NSString *)aKey {
    if (anObject != nil) {
     
        [self safeSetObject:anObject forKey:aKey];
    } else {
        
//        NSLog(@"----字典-> %@ ,key为 -> %@ ,加入元素-> %@ 时出错---", self, aKey, anObject);
    }
}
@end
