//
//  NSProcessInfo+Version.m
//  dfpo
//
//  Created by mac on 2017/7/14.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "NSProcessInfo+Version.h"

@implementation NSProcessInfo (Version)

+ (BOOL)runningAtLeastiOS8 {
    
    return [self runningAtLeastiOSSystemMajorVersion:8 minorVersion:0 patchVersion:0];
}
+ (BOOL)runningAtLeastiOS9 {
    
    return [self runningAtLeastiOSSystemMajorVersion:9 minorVersion:0 patchVersion:0];
}
+ (BOOL)runningAtLeastiOS10 {
    
    return [self runningAtLeastiOSSystemMajorVersion:10 minorVersion:0 patchVersion:0];
}
+ (BOOL)runningAtLeastiOS11 {
    
    return [self runningAtLeastiOSSystemMajorVersion:11 minorVersion:0 patchVersion:0];
}
+ (BOOL)runningAtLeastiOSSystemMajorVersion:(NSInteger)majorVersion minorVersion:(NSInteger)minorVersion patchVersion:(NSInteger)patchVersion{
    
    majorVersion = majorVersion>=8?majorVersion:8;
    minorVersion = minorVersion>=0?minorVersion:0;
    patchVersion = patchVersion>=0?patchVersion:0;
    
    return [[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:
            (NSOperatingSystemVersion){.majorVersion = majorVersion, .minorVersion = minorVersion, .patchVersion = patchVersion}];
}
@end
