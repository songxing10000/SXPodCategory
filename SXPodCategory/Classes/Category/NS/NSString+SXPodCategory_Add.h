//
//  NSString+Add.h
//  dfpo
//
//  Created by dfpo on 16/8/8.
//  Copyright © 2016年 dfpo. All rights reserved.
//


#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

@interface NSMutableString(SXPodCategory_SX_Safe)
- (void)safeAppendString:(NSString *)aString;
@end
@interface NSString (SXPodCategory_Add)

/**
 长度：11位
 •开头必须为1，只能输入数字
 • 输入后显示的格式是
 • 注册时 -> 在输入后验证唯一性，是否已经注册。。 如果号码已经注册，提示用户："手机号已经在垫付宝、轻易贷、1号车网、车快快存在，请直接登录"
 */
- (BOOL)checkPhone;


/**
 • 长度：6-20位
 •可输入英文大小写字母、数字，不能全部为数字。
 • 注册时 -> 在输入后验证唯一性，是否已经注册
 */
- (BOOL)checkPassword;
/// 检测字符串是否是数字或字母组成
- (BOOL)isNumberOrLetter;


/** 从时间戳到年月日时分秒的字符串 %d-%02d-%02d */
+ (instancetype)stringFromTimeStamp:(CGFloat)timeStamp;

//年月日
+ (NSString *)dayWithTimeIntervalString:(NSString *)timeString;

//包含时分秒
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

/** 去除首尾空白字符和换行字符，以及其他位置的空白字符和换行字符 */
- (NSString *)replaceWhitespaceAndNewLineSymbol;

- (CGFloat)getHeightWithFont:(UIFont *)font withMaxWidth:(CGFloat)maxWidth;

/** 字符串实例对象是否匹配该正则 */
- (BOOL)isValidWithRegularString:(NSString *)regular;

/** 手机是否合法 */
- (BOOL)isValidMobile;

/** 身份证是否合法 */
- (BOOL)isValidIDCardNumber;

/**
 密码须是数字、字母、特殊字符至少2种组合，长度6-20位。

 @return <#return value description#>
 */
- (BOOL)isvalidPassword;
/**
 *  不为空
 *
 *  @return return self && self.length
 */
- (BOOL)hasValue;
/** 是否为空或者是空格 */
- (BOOL)isEmpty;

/// 是否全部是数字
- (BOOL)isvalidDigits;

/**
 *
 *  返回字符串长度，如果是emoj表情返回1
 *
 */
- (NSInteger)getStringLengthIfIsEmojiLengthAsOne;

/**
 *
 *  字符串中有多少个emoji表情
 *
 */
- (int)emojiCount;


/**
 字符串中是否包含表情，不太准

 @return <#return value description#>
 */
- (BOOL)isContainsEmoji;
#pragma mark 推送时加入的md5
- (NSString *)md5String;
@end
