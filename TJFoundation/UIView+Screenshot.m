//
//  UIImage+Screenshot.m
//  TJFoundation
//
//  Created by Thomas Joulin on 11/1/12.
//

#import <QuartzCore/QuartzCore.h>

#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)

- (UIImage *)screenshot
{
    CGRect screenRect = self.bounds;
    
    UIGraphicsBeginImageContextWithOptions(screenRect.size, self.layer.opaque, 0.f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor clearColor] set];
    CGContextFillRect(ctx, screenRect);
    
    [self.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
