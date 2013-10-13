//
//  TJBlurNavigationBar.m
//  TJFoundation
//
//  Created by Thomas Joulin on 10/13/13.
//
//

#import "TJBlurNavigationBar.h"

@interface TJBlurNavigationBar ()

@property (nonatomic, strong) CALayer *extraColorLayer;

@end

@implementation TJBlurNavigationBar

@synthesize barTintAlpha = _barTintAlpha;

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UICollectionViewLayout
    
    if ([self respondsToSelector:@selector(barTintColor)])
    {
        [self.extraColorLayer removeFromSuperlayer];
        self.extraColorLayer.backgroundColor = self.barTintColor.CGColor;
        self.extraColorLayer.opacity = self.barTintAlpha;
        [self.layer insertSublayer:self.extraColorLayer atIndex:1];
        CGFloat spaceAboveBar = self.frame.origin.y;
        self.extraColorLayer.frame = CGRectMake(0, 0 - spaceAboveBar, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + spaceAboveBar);
    }
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
    [super setBarTintColor:barTintColor];
    
    [self setNeedsLayout];
}

- (void)setBarTintAlpha:(CGFloat)extraColorLayerOpacity
{
    _barTintAlpha = extraColorLayerOpacity;
    
    [self setNeedsLayout];
}

- (CGFloat)barTintAlpha
{
    if (!_barTintAlpha)
    {
        _barTintAlpha = 0.7;
    }
    
    return _barTintAlpha;
}

- (CALayer *)extraColorLayer
{
    if (!_extraColorLayer)
    {
        _extraColorLayer = [CALayer layer];
        _extraColorLayer.opacity = self.barTintAlpha;
        
        [self.layer addSublayer:self.extraColorLayer];
    }
    
    return _extraColorLayer;
}

@end
