//
//  NSArray+SX_Safe.m
//  dfpo
//
//  Created by mac on 2017/3/22.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "NSArray+SXPodCategory_SX_Safe.h"

@implementation NSArray (SXPodCategory_SX_Safe)

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
