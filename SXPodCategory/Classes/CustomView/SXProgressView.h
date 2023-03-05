//
//  SXProgressView.h
//  shiku_im
//
//  Created by dfpo on 15/02/2022.
//  Copyright © 2022 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// https://gitee.com/songxing10000/imgs/raw/master/2021/imgs/20220215145321.png
@interface SXProgressView : UIView
/// 进度
@property(nonatomic, assign) CGFloat m_progress;
/// 所有进度颜色
@property(nonatomic, strong) UIColor *m_allProgressColor;
/// 当前进度颜色
@property(nonatomic, strong) UIColor *m_progressColor;

@end

NS_ASSUME_NONNULL_END
