//
//  KBBaseModel.h
//  KangBoCoin
//
//  Created by dfpo on 2020/5/16.
//  Copyright © 2020 KBCoin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// 基础model
@interface SXBaseModel : NSObject
/// 字典、NSData、JSON字符串 转 模型
+ (instancetype)modelWithJSON:(id)json;
/// 字典数组 转 模型数组
+ (NSArray *)modelsWithJSON:(id)json;
/// 转换为字典或者数组
- (id)modelToJSONObject;
@end
NS_ASSUME_NONNULL_END

/*
 一、数组包含对象
 
 + (NSDictionary *)modelContainerPropertyGenericClass {
 return @{@"shopfileList" : [CKKUploadImage class],
 @"shopAuthorizeList": [CKKUploadImage class],
 @"businessAddress": [ProvinceCityDistrict class]};
 }
 
 二、服务器返回description，模型上对des对应
 
 + (NSDictionary *)modelCustomPropertyMapper {
 return @{@"des": @"description",
        @"bookID" : @[@"id",@"ID",@"book_id"]
        };
 }
 
 三、对象写入磁盘
 
 1、遵守协议 <NSCoding, NSCopying>
 2、implementation里导入头文件#import <YYModel/YYModel.h>，写入代码
 - (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
 - (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }
 - (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }
 - (NSUInteger)hash { return [self yy_modelHash]; }
 - (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; }
 - (NSString *)description { return [self yy_modelDescription]; }
 
 */
