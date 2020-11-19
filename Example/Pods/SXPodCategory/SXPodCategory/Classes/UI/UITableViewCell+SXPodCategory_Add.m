//
//  UITableViewCell+Nib.m
//  dfpo
//
//  Created by dfpo on 2016/11/23.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UITableViewCell+SXPodCategory_Add.h"

@implementation UITableViewCell (SXPodCategory_Add)

+ (instancetype)cellFromTableView:(UITableView *)tableView {
    
    NSString *classStringHasPrefix = NSStringFromClass([self class]);
    NSArray *classStrings = [classStringHasPrefix componentsSeparatedByString:@"."];
    NSString *cellIDStr = classStrings.lastObject;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDStr];
    if (cell) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if ([[NSBundle mainBundle] pathForResource:cellIDStr ofType:@"nib"] == nil) {
        
        cell = [[[self class] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIDStr];
        [tableView registerClass:[self class] forCellReuseIdentifier:cellIDStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    cell = [[[NSBundle mainBundle] loadNibNamed:cellIDStr owner:nil options:nil] lastObject];
    [tableView registerNib:[UINib nibWithNibName:cellIDStr bundle:nil] forCellReuseIdentifier:cellIDStr];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark - 寻找自身所在的TableView
- (UITableView *)tableView {
    UIResponder *responder = self.nextResponder;
    while (responder && ![responder isKindOfClass:[UITableView class]]) {
        responder = [responder nextResponder];
    }
    return (responder && [responder isKindOfClass:UITableView.class]) ? (UITableView *)responder : nil;
}

- (NSIndexPath *)index_path {
    return [self.tableView indexPathForCell:self];
}

@end

