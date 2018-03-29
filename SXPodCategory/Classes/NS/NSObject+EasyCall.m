//
//  NSObject+EasyCall.m
//  Pods
//
//  Created by dfpo on 2017/8/7.
//
//

#import "NSObject+EasyCall.h"
#import "NSObject+SXPodCategory_BKAssociatedObjects.h"

static const char *kCustomCell_indexPathKey = "kCustomCell_indexPathKey";
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

- (BOOL)isDictAndHasMsg {
    
    return [self isKindOfClass:[NSDictionary class]] && [self valueForKey: @"msg"] != nil;
}

- (NSIndexPath *)cell_indexPath {
    
    NSIndexPath *idxP = [self bk_associatedValueForKey:kCustomCell_indexPathKey];
    return idxP;
}
- (void)setCell_indexPath:(NSIndexPath *)cell_indexPath {
    
    [self bk_associateValue:cell_indexPath withKey:kCustomCell_indexPathKey];
}
#pragma mark - 防崩溃
- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

@end
