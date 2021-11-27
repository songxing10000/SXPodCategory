//
//  UICollectionViewCell+Add.h
//  dfpo
//
//  Created by mac on 2017/3/22.
//  Copyright © 2017年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (SXPodCategory_Add)

+ (instancetype)cellFromCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
/**
 寻找自身所在的CollectionView
 */
@property (nonatomic, readonly, nullable) UICollectionView *collectionView;
@end
NS_ASSUME_NONNULL_END
