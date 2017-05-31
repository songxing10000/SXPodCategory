//
//  UIButton+Call.h
//  CKK_SJ
//
//  Created by dfpo on 2016/11/29.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SXPodCategory_Limited)

/**
 *  限制字符提示(应用场景限制字符数据）
 *
 *  @param target   action的Target
 *  @param action   限制条件执行事件
 *  @param limitMax 内容宽度最大值
 */
-(void)addTarget:(id)target action:(SEL)action limitMax:(NSInteger)limitMax;


@end
