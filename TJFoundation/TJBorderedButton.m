//
//  TJBorderedButton.m
//  TJFoundation
//
//  Created by Thomas Joulin on 2/17/14.
//
//

#import "TJBorderedButton.h"

@implementation TJBorderedButton

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    _borderColor = [UIColor blackColor];
}

- (void)setBorderThickness:(CGFloat)borderThickness
{
    _borderThickness = borderThickness;
    
    [self setNeedsDisplay];
}

- (void)setTopBorderThickness:(CGFloat)topBorderThickness
{
    _topBorderThickness = topBorderThickness;
    
    [self setNeedsDisplay];
}

- (void)setBottomBorderThickness:(CGFloat)bottomBorderThickness
{
    _bottomBorderThickness = bottomBorderThickness;
    
    [self setNeedsDisplay];
}

- (void)setLeftBorderThickness:(CGFloat)leftBorderThickness
{
    _leftBorderThickness = leftBorderThickness;
    
    [self setNeedsDisplay];
}

- (void)setRightBorderThickness:(CGFloat)rightBorderThickness
{
    _rightBorderThickness = rightBorderThickness;
    
    [self setNeedsDisplay];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    
    [self setNeedsDisplay];
}

- (void)setTopBorderColor:(UIColor *)topBorderColor
{
    _topBorderColor = topBorderColor;
    
    [self setNeedsDisplay];
}

- (void)setBottomBorderColor:(UIColor *)bottomBorderColor
{
    _bottomBorderColor = bottomBorderColor;
    
    [self setNeedsDisplay];
}

- (void)setLeftBorderColor:(UIColor *)leftBorderColor
{
    _leftBorderColor = leftBorderColor;
    
    [self setNeedsDisplay];
}

- (void)setRightBorderColor:(UIColor *)rightBorderColor
{
    _rightBorderColor = rightBorderColor;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if ((self.borderThickness || self.topBorderThickness) && (self.topBorderColor || self.borderColor))
    {
        UIColor *color = self.topBorderColor ?: self.borderColor;
        CGFloat thickness = self.topBorderThickness ?: self.borderThickness;
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, 0.0, self.frame.size.width, thickness));
    }
    
    if (self.borderThickness || self.bottomBorderThickness)
    {
        UIColor *color = self.bottomBorderColor ?: self.borderColor;
        CGFloat thickness = self.bottomBorderThickness ?: self.borderThickness;
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, self.frame.size.height - thickness, self.frame.size.width, thickness));
    }
    
    if (self.borderThickness || self.leftBorderThickness)
    {
        UIColor *color = self.leftBorderColor ?: self.borderColor;
        CGFloat thickness = self.leftBorderThickness ?: self.borderThickness;
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, 0.0, thickness, self.frame.size.height));
    }
    
    if (self.borderThickness || self.rightBorderThickness)
    {
        UIColor *color = self.rightBorderColor ?: self.borderColor;
        CGFloat thickness = self.rightBorderThickness ?: self.borderThickness;
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, CGRectMake(self.frame.size.width - thickness, 0.0, thickness, self.frame.size.height));
    }
}

@end
