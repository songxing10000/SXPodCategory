//
//  NSNull+OVNatural.m
//  WisdomTown
//
//  Created by dfpo on 16/8/25.
//  Copyright © 2016年 songxing10000. All rights reserved.
//

#import "NSNull+SXPodCategory_OVNatural.h"

@implementation NSNull (SXPodCategory_OVNatural)
- (void)forwardInvocation:(NSInvocation *)invocation
{
    if ([self respondsToSelector:[invocation selector]]) {
        [invocation invokeWithTarget:self];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *sig = [[NSNull class] instanceMethodSignatureForSelector:selector];
    if(sig == nil) {
        sig = [NSMethodSignature signatureWithObjCTypes:"@^v^c"];
    }
    return sig;
}


- (float)floatValue{ return 0.0; }

- (int)intValue{ return 0; }

- (NSInteger)integerValue { return 0;}

- (NSUInteger)length { return 0; }

- (NSString *)description { return @"0"; }

- (NSArray *)componentsSeparatedByString:(NSString *)separator { return @[]; }

- (id)objectForKey:(id)key { return nil; }

- (BOOL)boolValue { return NO; }

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet{
    return NSMakeRange(NSNotFound, 0);
}
@end
