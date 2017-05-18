//
//  UILabel+LineSpacing.m
//  Chekuaikuai
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 北京壹号车科技有限公司. All rights reserved.
//

#import "UILabel+SXPodCategory_LineSpacing.h"

@implementation UILabel (SXPodCategory_LineSpacing)
- (void)setLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor lineSpacing:(CGFloat)lineSpacing  {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, text.length)];
    self.attributedText = attributedString;
    
}

@end
