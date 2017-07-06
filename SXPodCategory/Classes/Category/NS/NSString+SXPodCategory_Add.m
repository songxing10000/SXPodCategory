//
//  NSString+Add.m
//  dfpo
//
//  Created by dfpo on 16/8/8.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "NSString+SXPodCategory_Add.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSMutableString(SXPodCategory_SX_Safe)
- (void)safeAppendString:(NSString *)aString {
    if ([aString isKindOfClass:[NSString class]] &&
        [aString hasValue] ) {
        [self appendString:aString];
    }
}

@end
@implementation NSString (SXPodCategory_Add)

+ (instancetype)stringFromTimeStamp:(CGFloat)timeStamp {
    
    time_t timeInterval = timeStamp;
    struct tm *cTime = localtime(&timeInterval);
    NSString *dateStr = [NSString stringWithFormat:@"%d-%02d-%02d",
                         cTime->tm_year + 1900,
                         cTime->tm_mon + 1,
                         cTime->tm_mday];

    return dateStr;
}

//年月日
+ (NSString *)dayWithTimeIntervalString:(NSString *)timeString
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]]];
    
    return currentDateStr;
    
}

//包含时分秒
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]]];
    
    return currentDateStr;
    
}

-(NSString *)TimeStamp:(NSString *)strTime

{
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:[strTime doubleValue]]];

    return currentDateStr;
    
}


/** 去除首尾空白字符和换行字符，以及其他位置的空白字符和换行字符 */
- (NSString *)replaceWhitespaceAndNewLineSymbol {
    // 1、去除掉内容首尾的空白字符和换行字符
    NSCharacterSet *s = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *str = [self stringByTrimmingCharactersInSet:s];
    // 2、去除掉其它位置的空白字符和换行字符
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}

- (CGFloat)getHeightWithFont:(UIFont *)font withMaxWidth:(CGFloat)maxWidth{
    CGSize resultSize = CGSizeZero;
    if (self.length <= 0) {
        return 0;
    }
    resultSize = [self boundingRectWithSize:CGSizeMake(floor(maxWidth), floor(MAXFLOAT))//用相对小的 width 去计算 height / 小 heigth 算 width
                                    options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                 attributes:@{NSFontAttributeName: font}
                                    context:nil].size;
    resultSize = CGSizeMake(floor(resultSize.width + 1), floor(resultSize.height + 1));//上面用的小 width（height） 来计算了，这里要 +1
    return resultSize.height;
}
/** 手机是否合法 */
- (BOOL)isValidMobile
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[156])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,181
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        if([regextestcm evaluateWithObject:self] == YES) {
            NSLog(@"China Mobile");
        } else if([regextestct evaluateWithObject:self] == YES) {
            NSLog(@"China Telecom");
        } else if ([regextestcu evaluateWithObject:self] == YES) {
            NSLog(@"China Unicom");
        } else {
            NSLog(@"Unknow");
        }
        
        return YES;
    }
    else
    {
        return NO;
    }
}
/** 身份证是否合法 */
- (BOOL)isValidIDCardNumber {
    NSString *IDCardRgex = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}|^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X|x)$";
    return [self isValidWithRegularString:IDCardRgex];
}
/** 字符串实例对象是否匹配该正则 */
- (BOOL)isValidWithRegularString:(NSString *)regular {
    if (self.isEmpty) {
        return NO;
    }
    if ([regular replaceWhitespaceAndNewLineSymbol].length == 0) {
        return NO;
    }
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular] evaluateWithObject:self];
}
/// 是否全部是数字
- (BOOL)isvalidDigits {
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet: nonNumbers];
    return r.location == NSNotFound;
}
- (BOOL)hasValue {
    
    return self && self.length;
}
- (BOOL)isvalidPassword {
    NSString *psdRegx = @"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\\d]{6,20}$";
    return [self isValidWithRegularString:psdRegx];
}
/// 检测字符串是否是数字或字母组成
- (BOOL)isNumberOrLetter
{
    NSString *numberOrLetter = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:numberOrLetter] invertedSet];
    NSString *filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basic = [self isEqualToString:filtered];
    return basic;
}
/// 是否为空或者是空格
- (BOOL)isEmpty ///< 是否为空或者是空格
{
    
    NSString * newSelf = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(nil == self
       || self.length ==0
       || [self isEqualToString:@""]
       || [self isEqualToString:@"<null>"]
       || [self isEqualToString:@"(null)"]
       || [self isEqualToString:@"null"]
       || newSelf.length ==0
       || [newSelf isEqualToString:@""]
       || [newSelf isEqualToString:@"<null>"]
       || [newSelf isEqualToString:@"(null)"]
       || [newSelf isEqualToString:@"null"]
       || [self isKindOfClass:[NSNull class]] ){
        
        return YES;
        
    }else{
        // <object returned empty description> 会来这里
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        
        return [trimedString isEqualToString: @""];
    }
    
    return NO;
}



/**
 *
 *  返回字符串长度，如果是emoj表情返回1
 *
 */
- (NSInteger)getStringLengthIfIsEmojiLengthAsOne
{
    __block NSInteger stringLength = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff)
         {
             if (substring.length > 1)
             {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f)
                 {
                     stringLength += 1;
                 }
                 else
                 {
                     stringLength += 1;
                 }
             }
             else
             {
                 stringLength += 1;
             }
         } else if (substring.length > 1)
         {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3)
             {
                 stringLength += 1;
             }
             else
             {
                 stringLength += 1;
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff)
             {
                 stringLength += 1;
             }
             else if (0x2B05 <= hs && hs <= 0x2b07)
             {
                 stringLength += 1;
             }
             else if (0x2934 <= hs && hs <= 0x2935)
             {
                 stringLength += 1;
             }
             else if (0x3297 <= hs && hs <= 0x3299)
             {
                 stringLength += 1;
             }
             else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50)
             {
                 stringLength += 1;
             }
             else
             {
                 stringLength += 1;
             }
         }
     }];
    return stringLength;
}


/**
 *
 *  字符串中有多少个emoji表情
 *
 */
- (int)emojiCount {
    __block int emojiNum = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     emojiNum++;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3 || ls == 0xfe0f) {
                 emojiNum++;
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 emojiNum++;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 emojiNum++;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 emojiNum++;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 emojiNum++;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 emojiNum++;
             }
         }
     }];
    return emojiNum;
}

- (BOOL)isContainsEmoji
{
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}

/**
 长度：11位
 •开头必须为1，只能输入数字
 • 输入后显示的格式是
 • 注册时 -> 在输入后验证唯一性，是否已经注册。。 如果号码已经注册，提示用户："手机号已经在垫付宝、轻易贷、1号车网、车快快存在，请直接登录"
 */
- (BOOL)checkPhone{
    
    //数字条件
    NSRegularExpression *tNumRegularExpression =
    [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //符合数字条件的有几个字节
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:self
                                                                       options:NSMatchingReportProgress
                                                                         range:NSMakeRange(0, self.length)];
    return self.length == 11 && [self hasPrefix:@"1"] && tNumMatchCount == 11;
}

/**
 • 长度：6-20位
 •可输入英文大小写字母、数字，不能全部为数字。
 */
- (BOOL)checkPassword{
    // 过滤四位连续字符
    NSInteger length = self.length;
    for (NSInteger i = 0; i < length - 4; i++) {
        // 第一个
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        // 第二个
        NSRange range1 = NSMakeRange(i + 1, 1);
        NSString *subString1 = [self substringWithRange:range1];
        // 第三个
        NSRange range2 = NSMakeRange(i + 2, 1);
        NSString *subString2 = [self substringWithRange:range2];
        // 第四个
        NSRange range3 = NSMakeRange(i + 3, 1);
        NSString *subString3 = [self substringWithRange:range3];
        // 第四个
        NSRange range4 = NSMakeRange(i + 4, 1);
        NSString *subString4 = [self substringWithRange:range4];
        
        if ([subString isEqualToString:subString1] && [subString isEqualToString:subString2] && [subString isEqualToString:subString3] && [subString isEqualToString:subString4]) {
            
            return NO;
        }
    }
    
    NSString *pattern = @"^(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[_#@]+$).{6,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    if ([pred evaluateWithObject:self]) {
        NSInteger length = self.length;
        for (NSInteger i = 0; i < length; i++) {
            NSRange range=NSMakeRange(i,1);
            NSString *subString = [self substringWithRange:range];
            
            // 判断其中是否包含数字
            NSString *digit = @"^\\d+$";
            NSPredicate *digitPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", digit];
            if ([digitPre evaluateWithObject:subString]) {
                
                return YES;
            }
            // 判断其中是否包含字母
            NSString *letter = @"^[A-Za-z]+$";
            NSPredicate *letterPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", letter];
            if ([letterPre evaluateWithObject:subString]) {
                
                return YES;
            }
        }
        return NO;
    } else {
        return NO;
    }
}
#pragma mark 推送时加入的md5
/**
 *  返回二进制 Bytes 流的字符串表示形式
 *
 *  @param bytes  二进制 Bytes 数组
 *  @param length 数组长度
 *
 *  @return 字符串表示形式
 */
- (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (NSInteger i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}

- (NSString *)md5String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

@end
