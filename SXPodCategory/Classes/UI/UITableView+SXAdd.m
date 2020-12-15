//
//  UITableView+SXAdd.m
//  SXPodCategory
//
//  Created by dfpo on 2020/12/15.
//

#import "UITableView+SXAdd.h"

@implementation UITableView (SXAdd)
/// 注册xib cell
- (void)registerXibCell:(Class)xibCellClass {
    NSString *cellClassStr = NSStringFromClass([xibCellClass class]);
    UINib *nib = [UINib nibWithNibName:cellClassStr bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:cellClassStr];
}
@end
