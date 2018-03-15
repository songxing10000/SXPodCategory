//
//  UICollectionViewCell+Add.m
//  dfpo
//
//  Created by mac on 2017/3/22.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import "UICollectionViewCell+SXPodCategory_Add.h"

@implementation UICollectionViewCell (SXPodCategory_Add)
+ (instancetype)cellFromCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath {
    NSString *classStringHasPrefix = NSStringFromClass([self class]);
    NSArray *classStrings = [classStringHasPrefix componentsSeparatedByString:@"."];
    NSString *classStr =  classStrings.lastObject;
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:classStr forIndexPath:indexPath];
    if (cell) {
        return cell;
    }
    cell = [[[NSBundle mainBundle] loadNibNamed:classStr owner:nil options:nil] lastObject];
    if (cell) {
        return cell;
    }
    return [[UICollectionViewCell alloc] init];
}
@end
