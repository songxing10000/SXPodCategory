//
//  NSObject+Cell_IndexPath.m
//  dfpo
//
//  Created by mac on 2017/4/14.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "NSObject+SXPodCategory_Cell_indexPath.h"
#import "NSObject+SXPodCategory_BKAssociatedObjects.h"

static const char *kCustomCell_indexPathKey = "kCustomCell_indexPathKey";

@implementation NSObject (SXPodCategory_Cell_indexPath)
- (NSIndexPath *)cell_indexPath {
    
    NSIndexPath *idxP = [self bk_associatedValueForKey:kCustomCell_indexPathKey];
    return idxP;
}
- (void)setCell_indexPath:(NSIndexPath *)cell_indexPath {
    
    [self bk_associateValue:cell_indexPath withKey:kCustomCell_indexPathKey];
}


@end
