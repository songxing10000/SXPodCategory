
#import "SXLabel.h"

@implementation SXLabel
- (CGSize)sizeThatFits:(CGSize)size {
    /// 水平方向上的间距和
    CGFloat hValue = self.m_edgeInsets.left+self.m_edgeInsets.right;
    /// 垂直方向上的间距和
    CGFloat vValue = self.m_edgeInsets.top+self.m_edgeInsets.bottom;
    size = [super sizeThatFits:CGSizeMake(size.width - hValue, size.height -vValue)];
    size.width += hValue;
    size.height += vValue;
    return size;
}

- (CGSize)intrinsicContentSize {
    CGFloat preferredMaxLayoutWidth = self.preferredMaxLayoutWidth;
    if (preferredMaxLayoutWidth <= 0) {
        preferredMaxLayoutWidth = CGFLOAT_MAX;
    }
    return [self sizeThatFits:CGSizeMake(preferredMaxLayoutWidth, CGFLOAT_MAX)];
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.m_edgeInsets)];
}

- (void)setM_edgeInsets:(UIEdgeInsets)m_edgeInsets {
    _m_edgeInsets = m_edgeInsets;
    [self setNeedsDisplay];
}

@end
