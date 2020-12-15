//
//  UIFont+SXAdd.m
//  SXPodCategory
//
//  Created by dfpo on 2020/12/15.
//

#import "UIFont+SXAdd.h"

@implementation UIFont (SXAdd)
/// PingFangSC-Regular
+(instancetype)pFSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}
/// PingFangSC-Semibold
+(instancetype)pFBlodSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}
/// PingFangSC-Medium
+(instancetype)pFMediumSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];;
}
@end
