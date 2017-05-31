//
//  UILabel+LineSpacing.h
//  Chekuaikuai
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SXPodCategory_LineSpacing)

/**
 给label设置行间距

 @param text 要显示什么字
 @param fontSize 全部字的字号
 @param textColor 全部字的颜色
 @param lineSpacing 全部字的行间距
 */
- (void)setLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor lineSpacing:(CGFloat)lineSpacing;
@end
