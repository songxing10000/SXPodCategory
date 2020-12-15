//
//  UITableView+SXAdd.h
//  SXPodCategory
//
//  Created by dfpo on 2020/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (SXAdd)
- (void)registerXibCell:(Class)xibCellClass;
@end

NS_ASSUME_NONNULL_END
