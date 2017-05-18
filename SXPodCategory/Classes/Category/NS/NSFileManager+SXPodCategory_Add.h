//
//  NSFileManager+Add.h
//  CKK_SJ
//
//  Created by mac on 2017/3/16.
//  Copyright © 2017年 一号车. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ImageExt   (@"jpg")

@interface NSFileManager (Add)

- (NSString *)getAppDocumentPath;

- (NSString *)getAppTempPath;

- (NSString *)userDirectory;

- (NSString *)genFilenameWithExt:(NSString *)ext;

- (NSString *)filepathForVideo:(NSString *)filename;

- (NSString *)filepathForImage:(NSString *)filename;

@end
