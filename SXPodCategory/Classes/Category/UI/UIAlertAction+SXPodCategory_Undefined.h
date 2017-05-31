//
//  UIAlertAction+Undefind.h
//  CKK_SJ
//
//  Created by dfpo on 2016/11/28.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (SXPodCategory_Undefined)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end

@interface UIAlertController (Undefined)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
