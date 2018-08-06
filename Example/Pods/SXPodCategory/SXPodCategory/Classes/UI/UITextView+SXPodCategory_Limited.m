//
//  UIButton+Call.h
//  dfpo
//
//  Created by dfpo on 2016/11/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UITextView+SXPodCategory_Limited.h"
#import <objc/runtime.h>
static char *kAction;
static char *klimit;
static char *targetKey;


@implementation UITextView (SXPodCategory_Limited)

/**
 *  限制字符提示
 *
 *  @param target   action的Target
 *  @param action   限制执行事件
 *  @param limitMax 限制数量
 */
-(void)addTarget:(id)target action:(SEL)action limitMax:(NSInteger)limitMax
{
    
    NSString *limitStr=[NSString stringWithFormat:@"%ld",(long)limitMax];
    objc_setAssociatedObject(self, &klimit, limitStr, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, &targetKey, target, OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, &kAction, NSStringFromSelector(action), OBJC_ASSOCIATION_COPY);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UIControlEventEditingChangedByLimit) name: UITextViewTextDidChangeNotification object:nil];
}


+(void)load
{
    Class class = [self class];
    
    SEL originalSelector = @selector(removeFromSuperview);
    SEL swizzledSelector = @selector(removeFromSuperviewExt);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}


-(void)removeFromSuperviewExt
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeFromSuperviewExt];
}


/**
 *  输入内容限制
 */
-(void)UIControlEventEditingChangedByLimit
{
    id target = objc_getAssociatedObject(self, &targetKey);
    if (!target&&![target isKindOfClass:[NSNull class]]) {
        return;
    }
    NSString *actionStr = objc_getAssociatedObject(self, &kAction);
    SEL runAction  = NSSelectorFromString(actionStr);
    if (!runAction) {
        return;
    }
    
    NSString *limitStr = objc_getAssociatedObject(self, &klimit);
    NSInteger maxLength=[limitStr integerValue];
    
    NSString *toBeString = self.text;
    
    UITextInputMode *currentInputMode = self.textInputMode;
    NSString *lang = [currentInputMode primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
//            if (toBeString.length > maxLength) {

            if ([self getStringLengthIfIsEmojiLengthAsOneFromString:toBeString] > maxLength) {

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
                
                
                
                //[target performSelector:action];
                if ([target respondsToSelector:runAction]) {
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"  //消除performSelector 可能不存在的警告
                    [target performSelector:runAction ];
                }
            }
            else
            {
                // 有高亮选择的字符串，则暂不对文字进行统计和限制
            }
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
//        if (toBeString.length > maxLength)
        if ([self getStringLengthIfIsEmojiLengthAsOneFromString:toBeString] > maxLength)

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
            // 调用target事件
            if ([target respondsToSelector:runAction]) {
                [target performSelector:runAction ];
            }
            
        }
        
    }
}
#pragma mark - 解耦，不依赖于 NSString+SXPodCategory_Add.h

- (NSInteger)getStringLengthIfIsEmojiLengthAsOneFromString:(NSString *)string
{
    __block NSInteger stringLength = 0;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff)
         {
             if (substring.length > 1)
             {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f)
                 {
                     stringLength += 1;
                 }
                 else
                 {
                     stringLength += 1;
                 }
             }
             else
             {
                 stringLength += 1;
             }
         } else if (substring.length > 1)
         {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3)
             {
                 stringLength += 1;
             }
             else
             {
                 stringLength += 1;
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff)
             {
                 stringLength += 1;
             }
             else if (0x2B05 <= hs && hs <= 0x2b07)
             {
                 stringLength += 1;
             }
             else if (0x2934 <= hs && hs <= 0x2935)
             {
                 stringLength += 1;
             }
             else if (0x3297 <= hs && hs <= 0x3299)
             {
                 stringLength += 1;
             }
             else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50)
             {
                 stringLength += 1;
             }
             else
             {
                 stringLength += 1;
             }
         }
     }];
    return stringLength;
}

@end
