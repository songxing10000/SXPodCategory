//
//  HDSearchTable.m
//  hfdd
//
//  Created by dfpo on 2021/2/2.
//

#import "AutoHeightTableView.h"
 
@implementation AutoHeightTableView
- (void) layoutSubviews {
    [super layoutSubviews];

    if (!CGSizeEqualToSize(self.bounds.size, [self intrinsicContentSize])){
        [self invalidateIntrinsicContentSize];
    }
}

- (CGSize)intrinsicContentSize {
    return self.contentSize;
}
@end
