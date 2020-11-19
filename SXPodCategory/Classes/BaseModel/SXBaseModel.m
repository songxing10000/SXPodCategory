//
//  KBBaseModel.m
//  KangBoCoin
//
//  Created by dfpo on 2020/5/16.
//  Copyright © 2020 KBCoin. All rights reserved.
//

#import "SXBaseModel.h"
#import "NSObject+YYModel.h"

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
@end
