//
//  UIAlertAction+Undefind.h
//  CKK_SJ
//
//  Created by MobileUser on 2016/11/28.
//  Copyright © 2016年 BILL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (SXPodCategory_Undefined)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end

@interface UIAlertController (Undefined)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
