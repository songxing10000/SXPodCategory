//
//  NSProcessInfo+Version.h
//  dfpo
//
//  Created by mac on 2017/7/14.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSProcessInfo (Version)

+ (BOOL)runningAtLeastiOS8;
+ (BOOL)runningAtLeastiOS9;
+ (BOOL)runningAtLeastiOS10;
+ (BOOL)runningAtLeastiOS11;
+ (BOOL)runningAtLeastiOSSystemMajorVersion:(NSInteger)majorVersion
                               minorVersion:(NSInteger)minorVersion
                               patchVersion:(NSInteger)patchVersion;
@end
