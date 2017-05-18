//
//  UIImageView+add.h
//  CKK
//
//  Created by dfpo on 16/8/20.
//  Copyright © 2016年 CKK. All rights reserved.
//

#import "NSDate+SXPodCategory_Add.h"
@import UIKit;
@implementation NSDate (SXPodCategory_Add)
static NSCalendar *_calendar = nil;
static NSDateFormatter *_displayFormatter = nil;
static NSString *kNSDateHelperFormatSQLDateWithTime     = @"yyyy-MM-dd HH:mm:ss";

/** 计算toDate和self的时间差距 */
- (NSDateComponents *)componentsToDate:(NSDate *)toDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:toDate options:0];
}

/** 是否为今天 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitDay fromDate:[NSDate date].ymd toDate:self.ymd options:0].day == 0;
}
/** 是否为昨天 */
- (BOOL)isYesterday
{
    // 1.获得系统自带的日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 2.比较2个时间的差距
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:self.ymd toDate:[NSDate date].ymd options:0];
    return cmps.day == 1;
}
/**
 *  是否为明天
 */
- (BOOL)isTomorrow
{
    // 1.获得系统自带的日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 2.比较2个时间的差距
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:self.ymd toDate:[NSDate date].ymd options:0];
    return cmps.day == -1;
}


/** 是否为今年 */
- (BOOL)isThisYear
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
        NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
        return nowYear == selfYear;
    }
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger year = [dateComponent year];
    if (year) {
        return YES;
    }
    return NO;
    
}
/** 将一个时间变为只有年月日的时间(时分秒都是0) */
- (NSDate *)ymd
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    return [fmt dateFromString:[fmt stringFromDate:self]];
}

/** 本地时区的NSDate */
- (NSDate *)localDate {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];//修改时区
    NSInteger interval = [zone secondsFromGMTForDate: self];//修改时区
    NSDate *localDate = [self  dateByAddingTimeInterval: interval]; // 2015-06-15 18:37:45 +0000
    return localDate;
}
//+ (instancetype)dateFromString:(NSString *)dateString {
//    NSDateFormatter *f = [[NSDateFormatter alloc] init];
//    f.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//    f.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
//    return [f dateFromString:dateString];
//}

+ (void)initializeStatics {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            if (_calendar == nil) {
#if __has_feature(objc_arc)
                _calendar = [NSCalendar currentCalendar];
#else
                _calendar = [[NSCalendar currentCalendar] retain];
#endif
            }
            if (_displayFormatter == nil) {
                _displayFormatter = [[NSDateFormatter alloc] init];
                NSTimeZone * zone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//转为东八区
                [_displayFormatter setTimeZone:zone];
                NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
                [_displayFormatter setLocale:locale];
            }
        }
    });
}

+ (NSCalendar *)sharedCalendar {
    [self initializeStatics];
    return _calendar;
}

+ (NSDateFormatter *)sharedDateFormatter {
    [self initializeStatics];
    return _displayFormatter;
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *formatter = [self sharedDateFormatter];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    return [date stringWithFormat:format];
}

+ (NSString *)stringFromDate:(NSDate *)date {
    return [date string];
}
- (NSString *)string {
    return [self stringWithFormat:[NSDate dbFormatString]];
}
- (NSString *)string_yyyy_MM_dd{
    return [self stringWithFormat:@"yyyy-MM-dd"];
}
- (NSString *)stringWithFormat:(NSString *)format {
    [[[self class] sharedDateFormatter] setDateFormat:format];
    NSString *timestamp_str = [[[self class] sharedDateFormatter] stringFromDate:self];
    return timestamp_str;
}
+ (NSString *)timestampFormatString {
    return kNSDateHelperFormatSQLDateWithTime;
}

// preserving for compatibility
+ (NSString *)dbFormatString {
    return [NSDate timestampFormatString];
}
@end
