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
@end
