//
//  UIButton+Call.h
//  dfpo
//
//  Created by dfpo on 2016/11/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UITextField+SXPodCategory_Limited.h"
#import <objc/runtime.h>
static char *klimit;

@implementation UITextField (SXPodCategory_Limited)
@dynamic limitMax ;

-(void)setLimitMax:(int)limitMax
{
    NSString *limitStr=[NSString stringWithFormat:@"%d",limitMax];
    objc_setAssociatedObject(self, &klimit, limitStr, OBJC_ASSOCIATION_RETAIN);
    [self addTarget:self action:@selector(UIControlEventEditingChangedByLimit) forControlEvents:UIControlEventEditingChanged];
}
-(int)limitMax
{
    return [objc_getAssociatedObject(self,  &klimit)intValue] ;
}

-(int )caculateTheLength:(NSString*)str{
    
    __block int length = 0 ;
    //    [str enumerateSubstringsInRange:NSMakeRange(0, str.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
    //        if ([DPVerifyUtilities isHanZi:substring]) {
    //            length+=1 ;
    //        }
    //    }] ;
    
    return length ;
}

-(void)UIControlEventEditingChangedByLimit
{
    NSString *limitStr = objc_getAssociatedObject(self, &klimit);
    NSInteger maxLength=[limitStr integerValue];
    
    NSString *toBeString = self.text;
    int hzNum = [self caculateTheLength:self.text] ;
    
    
    NSString *lang = [self.textInputMode primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            
            if (toBeString.length+hzNum > maxLength) {
                
#if 0
                //找到当前输入光标位置, 删除超出内容
                UITextPosition* beginning = self.beginningOfDocument;
                UITextRange* selectedRange = self.selectedTextRange;
                UITextPosition* selectionStart = selectedRange.start;
                
                NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
                self.text = [self.text stringByReplacingCharactersInRange:NSMakeRange(location-( (toBeString.length-maxLength+hzNum)/2 + (toBeString.length-(maxLength-hzNum))%2), (toBeString.length-maxLength+hzNum)/2+(toBeString.length-maxLength+hzNum)%2) withString:@""];
#endif
                //判断第三方中文输入法的emoji表情
                NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
                if (rangeIndex.length == 1)
                {
                    self.text = [toBeString substringToIndex:maxLength];
                }
                else
                {
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                    self.text = [toBeString substringWithRange:rangeRange];
                }
                // 这里可以调用 弹窗提示超出文本了
                
                
            }
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
            else
            {
                
            }
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length+hzNum > maxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
            if (rangeIndex.length == 1)
            {
                self.text = [toBeString substringToIndex:maxLength];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                self.text = [toBeString substringWithRange:rangeRange];
            }
            
            // 这里可以调用弹窗提示了
            
#if 0
            //找到当前输入光标位置, 删除超出内容
            UITextPosition* beginning = self.beginningOfDocument;
            UITextRange* selectedRange = self.selectedTextRange;
            UITextPosition* selectionStart = selectedRange.start;
            
            NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
            self.text = [self.text stringByReplacingCharactersInRange:NSMakeRange(location-(toBeString.length+hzNum-maxLength), toBeString.length-maxLength+hzNum) withString:@""];
#endif
            
        }
        
    }
}

@end
