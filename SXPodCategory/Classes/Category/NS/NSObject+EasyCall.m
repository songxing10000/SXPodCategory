//
//  NSObject+EasyCall.m
//  Pods
//
//  Created by dfpo on 2017/8/7.
//
//

#import "NSObject+EasyCall.h"

@implementation NSObject (EasyCall)

- (BOOL)isDict {
    
    return [self isKindOfClass:[NSDictionary class]];
}
-(BOOL)isArray {
    
    return [self isKindOfClass:[NSArray class]];
}
- (BOOL)isString {
    
    return [self isKindOfClass:[NSString class]];
}



- (BOOL)isDictAndHasData {
    
    return [self isKindOfClass:[NSDictionary class]] && [self valueForKey: @"data"] != nil;
}
@end
