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

@end
