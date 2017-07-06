//
//  NSFileManager+Add.h
//  dfpo
//
//  Created by mac on 2017/3/16.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ImageExt   (@"jpg")

@interface NSFileManager (SXPodCategory_Add)

- (NSString *)getAppDocumentPath;

- (NSString *)getAppTempPath;

- (NSString *)userDirectory;

- (NSString *)genFilenameWithExt:(NSString *)ext;

- (NSString *)filepathForVideo:(NSString *)filename;

- (NSString *)filepathForImage:(NSString *)filename;

@end
