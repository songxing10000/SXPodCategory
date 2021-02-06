//
//  KBBaseModel.m
//  KangBoCoin
//
//  Created by dfpo on 2020/5/16.
//  Copyright © 2020 KBCoin. All rights reserved.
//

#import "SXBaseModel.h"
#import <YYModel/YYModel.h>
//#if __has_include(<YYModel/YYModel.h>)
//#import <YYModel/NSObject+YYModel.h>
//#import <YYModel/YYClassInfo.h>
//#else
//#import "NSObject+YYModel.h"
//#import "YYClassInfo.h"
//#endif

@implementation SXBaseModel
+(instancetype)modelWithJSON:(id)json {
    return [[self class] yy_modelWithJSON:json];
}
+(NSArray *)modelsWithJSON:(id)json {
    return [NSArray yy_modelArrayWithClass:[self class] json:json];
}
- (id)modelToJSONObject {
    return [self yy_modelToJSONObject];
}



- (NSString *)description {
    return [self yy_modelDescription];
}
- (void)updateAllProFrom:(id)other {
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *name = property_getName(properties[i]);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        id propertyValue = [other valueForKey:propertyName];
        if (propertyValue) {
            [self setValue:propertyValue forKey:propertyName];
        }
    }
    free(properties);
}
@end
