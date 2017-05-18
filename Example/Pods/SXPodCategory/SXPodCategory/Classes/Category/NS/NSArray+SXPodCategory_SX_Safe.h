//
//  NSArray+SX_Safe.h
//  CKK_SJ
//
//  Created by mac on 2017/3/22.
//  Copyright © 2017年 一号车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray <ObjectType> (SXPodCategory_SX_Safe)

- (ObjectType)safe_ObjectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray <ObjectType> (SXPodCategory_SX_Safe)

- (void)safe_addObject:(ObjectType)anObject;

@end

@interface NSDictionary<__covariant KeyType, __covariant ObjectType>(SX_Safe)

- (void)safeSetObject:(ObjectType)anObject forKey:(KeyType <NSCopying>)aKey;

@end
