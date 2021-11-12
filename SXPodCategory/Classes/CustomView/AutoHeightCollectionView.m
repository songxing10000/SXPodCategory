//
//  AutoHeightCollectionView.m
//  SXSearchDemo
//
//  Created by dfpo on 11/11/2021.
//

#import "AutoHeightCollectionView.h"

@implementation AutoHeightCollectionView
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
