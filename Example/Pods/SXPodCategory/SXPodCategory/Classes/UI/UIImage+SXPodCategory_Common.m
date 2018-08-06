//
//  UIImageView+add.h
//  ckksj
//
//  Created by dfpo on 16/8/20.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import "UIImage+SXPodCategory_Common.h"
#import <CoreGraphics/CoreGraphics.h>
@implementation UIImage (SXPodCategory_Common)

+(instancetype)imageWithColor:(UIColor *)aColor{
    return [UIImage imageWithColor:aColor withFrame:CGRectMake(0, 0, 1, 1)];
}

+(instancetype)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame{
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    CGContextFillRect(context, aFrame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
- (instancetype)imageTosize:(CGSize)size {
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = self.size;
    }
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0);
#if 1 // 图片过小的时候，有个背景色处理
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [[UIColor navigationBarColor] CGColor]);
//    CGContextSetBlendMode(context, kCGBlendModeNormal);
//    CGContextFillRect(context, rect);
#endif
    
    [self drawInRect:rect];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (instancetype)circleImageWithSize:(CGSize)size backgroudColor:(UIColor *)backgroudColor lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = self.size;
    }
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0);
    
    [backgroudColor setFill];
    UIRectFill(rect);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path addClip];
    [self drawInRect:rect];
    
    if (lineWidth != 0) {
        
        UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:rect];
        ovalPath.lineWidth = lineWidth;
        [lineColor setStroke];
        [ovalPath stroke];
    }
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}
- (instancetype)imageWithSize:(CGSize)size cornerRadius:(CGFloat)radius backgroudColor:(UIColor *)backgroudColor lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = self.size;
    }
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0);
    
    [backgroudColor setFill];
    UIRectFill(rect);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [path addClip];
    if (self.size.width > size.width && self.size.height > size.height && self.size.height > self.size.width) {
    
        [[self imageInRect:CGRectMake((self.size.width-self.size.width)*0.5,
                                      (self.size.height-self.size.width/3*2)*0.5,
                                      self.size.width,
                                      self.size.width/3*2)] drawInRect:rect];
    } else {
    
        [self drawInRect:rect];
    }
    if (lineWidth != 0) {
        
        UIBezierPath *ovalPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];;
        ovalPath.lineWidth = lineWidth;
        [lineColor setStroke];
        [ovalPath stroke];
    }
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}
- (UIImage *)imageInRect:(CGRect)rect{
    
    //将UIImage转换成CGImageRef
    CGImageRef sourceImageRef = [self CGImage];
    
    //按照给定的矩形区域进行剪裁
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    
    //将CGImageRef转换成UIImage
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];

    CGImageRelease(newImageRef);

    //返回剪裁后的图片
    return newImage;
}
@end
