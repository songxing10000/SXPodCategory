//
//  NSFileManager+Add.m
//  CKK_SJ
//
//  Created by mac on 2017/3/16.
//  Copyright © 2017年 一号车. All rights reserved.
//

#import "NSFileManager+SXPodCategory_Add.h"
#define RDVideo    (@"video")
#define RDImage    (@"image")

@implementation NSFileManager (SXPodCategory_Add)
- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([self fileExistsAtPath: [URL path]]);
    
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue:@(YES)
                                  forKey:NSURLIsExcludedFromBackupKey
                                   error:&error];
    if(!success)
    {
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
    
}
- (NSString *)getAppDocumentPath
{
    static NSString *appDocumentPath = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        appDocumentPath= paths[0];
        if (![self fileExistsAtPath:appDocumentPath])
        {
            [self createDirectoryAtPath:appDocumentPath
            withIntermediateDirectories:NO
                             attributes:nil
                                  error:nil];
        }
        [self addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:appDocumentPath]];
    });
    return appDocumentPath;
    
}

- (NSString *)getAppTempPath
{
    return NSTemporaryDirectory();
}

- (NSString *)userDirectory
{
    return @"f";
//    NSString *documentPath = [CKKFileLocationHelper getAppDocumentPath];
//    NSString *phonenum = [CKKLoginManager sharedManager].currentLoginData.phoneNum;
//    if ([phonenum length] == 0)
//    {
//        NSLog(@"Error: Get User Directory While UserID Is Empty");
//    }
//    NSString* userDirectory= [NSString stringWithFormat:@"%@%@/",documentPath,phonenum];
//    if (![self fileExistsAtPath:userDirectory])
//    {
//        [self createDirectoryAtPath:userDirectory
//                                  withIntermediateDirectories:NO
//                                                   attributes:nil
//                                                        error:nil];
//        
//    }
//    return userDirectory;
}

- (NSString *)resourceDir: (NSString *)resouceName
{
    NSString *dir = [[self userDirectory] stringByAppendingPathComponent:resouceName];
    if (![self fileExistsAtPath:dir])
    {
        [self createDirectoryAtPath:dir
                                  withIntermediateDirectories:NO
                                                   attributes:nil
                                                        error:nil];
    }
    return dir;
}


-(NSString *)filepathForVideo:(NSString *)filename
{
    return [self filepathForDir:RDVideo
                                        filename:filename];
}

- (NSString *)filepathForImage:(NSString *)filename
{
    return [self filepathForDir:RDImage
                                        filename:filename];
}

- (NSString *)genFilenameWithExt:(NSString *)ext
{
    CFUUIDRef uuid = CFUUIDCreate(nil);
    NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuid);
    CFRelease(uuid);
    NSString *uuidStr = [[uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
    NSString *name = [NSString stringWithFormat:@"%@",uuidStr];
    return [ext length] ? [NSString stringWithFormat:@"%@.%@",name,ext]:name;
}


#pragma mark - 辅助方法
- (NSString *)filepathForDir:(NSString *)dirname
                    filename:(NSString *)filename
{
    return [[self resourceDir:dirname] stringByAppendingPathComponent:filename];
}

@end
