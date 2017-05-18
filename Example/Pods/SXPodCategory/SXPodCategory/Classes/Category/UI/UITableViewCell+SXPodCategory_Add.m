//
//  UITableViewCell+Nib.m
//  CKK_SJ
//
//  Created by MobileUser on 2016/11/23.
//  Copyright © 2016年 BILL. All rights reserved.
//

#import "UITableViewCell+SXPodCategory_Add.h"

@implementation UITableViewCell (SXPodCategory_Add)

+ (instancetype)cellFromTableView:(UITableView *)tableView {
    
    
    NSString *cellIDStr = NSStringFromClass(self);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDStr];
    if (cell) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if ([[NSBundle mainBundle] pathForResource:cellIDStr ofType:@"nib"] == nil) {
        
        cell = [[[self class] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIDStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    cell = [[[NSBundle mainBundle] loadNibNamed:cellIDStr owner:nil options:nil] lastObject];
    [tableView registerNib:[UINib nibWithNibName:cellIDStr bundle:nil] forCellReuseIdentifier:cellIDStr];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end

