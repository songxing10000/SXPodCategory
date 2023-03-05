//
//  HjProgressView.m
//  shiku_im
//
//  Created by dfpo on 15/02/2022.
//  Copyright © 2022 Reese. All rights reserved.
//

#import "SXProgressView.h"
@implementation SXProgressView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.m_allProgressColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
        self.m_progressColor = [UIColor colorWithRed:76/255.0 green:135/255.0 blue:241/255.0 alpha:1.0];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 画bg
    CGContextSaveGState(context);
    CGFloat corner = CGRectGetHeight(rect)*0.5;
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:corner];
    CGContextSetFillColorWithColor(context, self.m_allProgressColor.CGColor);
    [roundedRect fill];
   
    
    // 画进度
    CGRect rectToDrawIn = CGRectMake(0, 0, self.frame.size.width * self.m_progress, self.frame.size.height);
    UIBezierPath *pRoundedRect = [UIBezierPath bezierPathWithRoundedRect:rectToDrawIn cornerRadius:corner];
    CGContextSetFillColorWithColor(context, self.m_progressColor.CGColor);
    [pRoundedRect fill];
}
-(void)setM_progress:(CGFloat)m_progress{ 
    _m_progress = m_progress;
    if (_m_progress < 0) {
        _m_progress = 0;
    } else if (_m_progress > 1) {
        _m_progress = 1;
    }
    [self setNeedsDisplay];
}
@end
