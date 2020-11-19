//
//  NSObject+EasyCall.m
//  Pods
//
//  Created by dfpo on 2017/8/7.
//
//

#import "NSObject+EasyCall.h"

#ifdef DEBUG
#else
@implementation NSObject (EasyCall)
- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
#endif

