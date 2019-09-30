//
//  UITextField+Add.m
//  dfpo
//
//  Created by mac on 2017/3/21.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "UITextField+SXPodCategory_Add.h"
/*
 
 // 崩溃 api。获取 _placeholderLabel 不会崩溃，但是获取 _placeholderLabel 里的属性就会
 [textField setValue:[UIColor blueColor] forKeyPath:@"_placeholderLabel.textColor"];
 [textField setValue:[UIFont systemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
 
 // 替代方案 1，去掉下划线，访问 placeholderLabel
 [textField setValue:[UIColor blueColor] forKeyPath:@"placeholderLabel.textColor"];
 [textField setValue:[UIFont systemFontOfSize:20] forKeyPath:@"placeholderLabel.font"];
 
 // 替代方案 2
 textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入" attributes:@{
 NSForegroundColorAttributeName: [UIColor blueColor],
 NSFontAttributeName: [UIFont systemFontOfSize:20]
 }];
 
 */
static NSString *const kUITextFieldPlaceholderColorKey = @"placeholderLabel.textColor";

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
    
//    NSLog(@"--UITextField--setValue:%@ forUndefinedKey:%@--", value, key);
}
@end
