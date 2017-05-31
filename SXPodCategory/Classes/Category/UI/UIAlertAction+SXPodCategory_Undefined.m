//
//  UIAlertAction+Undefind.m
//  CKK_SJ
//
//  Created by dfpo on 2016/11/28.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UIAlertAction+SXPodCategory_Undefined.h"

@implementation UIAlertAction (SXPodCategory_Undefined)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@" UIAlertAction UndefinedKey--%@---value---%@", key, value);
}
@end

@implementation UIAlertController (Undefined)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@" UIAlertController UndefinedKey--%@---value---%@", key, value);
}

@end
