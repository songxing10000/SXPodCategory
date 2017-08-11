//
//  NSObject+EasyCall.h
//  Pods
//
//  Created by dfpo on 2017/8/7.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (EasyCall)

/// [self isKindOfClass:[NSDictionary class]];
@property(nonatomic, readonly) BOOL isDict;

/// [self isKindOfClass:[NSArray class]];
@property(nonatomic, readonly) BOOL isArray;

/// [self isKindOfClass:[NSString class]];
@property(nonatomic, readonly) BOOL isString;


#pragma mark - 再次扩展常用方法
///  [self isKindOfClass:[NSDictionary class]] && [self valueForKey: @"data"] != nil;
@property(nonatomic, readonly) BOOL isDictAndHasData;

///  [self isKindOfClass:[NSDictionary class]] && [self valueForKey: @"msg"] != nil;
@property(nonatomic, readonly) BOOL isDictAndHasMsg;

@end
