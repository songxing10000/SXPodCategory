//
//  UITextField+Add.m
//  CKK_SJ
//
//  Created by mac on 2017/3/21.
//  Copyright © 2017年 一号车. All rights reserved.
//

#import "UITextField+SXPodCategory_Add.h"

static NSString *const kUITextFieldPlaceholderColorKey = @"_placeholderLabel.textColor";

@implementation UITextField (SXPodCategory_Add)

- (UIColor *)placeholderColor {
    
    return [self valueForKeyPath:kUITextFieldPlaceholderColorKey];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    if (![placeholderColor isKindOfClass:[UIColor class]]) {
        return;
    }
    if (placeholderColor == nil) {
        return;
    }
    if (![self isKindOfClass:[UITextField class]]) {
        return;
    }
    if (self == nil) {
        return;
    }
    [self setValue:placeholderColor forKeyPath:kUITextFieldPlaceholderColorKey];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"--UITextField--setValue:%@ forUndefinedKey:%@--", value, key);
}
@end
