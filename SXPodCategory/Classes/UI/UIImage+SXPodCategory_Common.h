//
//  UIImageView+add.h
//  dfpo
//
//  Created by dfpo on 16/8/20.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SXPodCategory_Common)


+(instancetype)imageWithColor:(UIColor *)aColor;

+(instancetype)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;

/**
 把一张图片绽放到一个范围，用处，一个imageView圆角，设置layer.cornerRadius、layer.borderColor、layer.borderWidth时调用，如果非得加上layer.masksToBounds才能得到想要的效果，可尝试调用
 circleImageWithSize: backgroudColor: lineWidth: lineColor: 方法

 @param size 目的size
 @return 处理好的图片
 */
- (instancetype)imageTosize:(CGSize)size;
/**
 在一个范围方形范围内得到一个圆形图片

 @param size 这个方形多大
 @param backgroudColor 圆形后，四个角的颜色
 @param lineWidth 圆形附带的边框线宽
 @param lineColor 圆形附带的边框线颜色
 @return 处理好的图片
 */
- (instancetype)circleImageWithSize:(CGSize)size backgroudColor:(UIColor *)backgroudColor lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;

/**
 在一个范围内处理圆角

 @param size 矩形方形范围
 @param radius 四个圆角的大小
 @param backgroudColor 圆角外的颜色
 @param lineWidth 圆角边框线宽
 @param lineColor 圆角边框线颜色
 @return 处理好的图片
 */
- (instancetype)imageWithSize:(CGSize)size cornerRadius:(CGFloat)radius backgroudColor:(UIColor *)backgroudColor lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;

@end
