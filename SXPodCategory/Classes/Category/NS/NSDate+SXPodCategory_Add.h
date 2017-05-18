//
//  UIImageView+add.h
//  CKK
//
//  Created by dfpo on 16/8/20.
//  Copyright © 2016年 CKK. All rights reserved.
//

#import <Foundation/Foundation.h>


/** 计算时间间隔 */
@interface NSDate (SXPodCategory_Add)

/** 计算toDate和self的时间差距 */
- (NSDateComponents *)componentsToDate:(NSDate *)toDate;

- (BOOL)isThisYear;

+ (void)initializeStatics;
+ (NSCalendar *)sharedCalendar;
+ (NSDateFormatter *)sharedDateFormatter;

+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date;
- (NSString *)string_yyyy_MM_dd;
- (NSString *)stringWithFormat:(NSString *)format;

#pragma mark - 特别情况下开放的
///  本地时区的NSDate
- (NSDate *)localDate;
@end
