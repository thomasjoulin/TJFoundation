//
//  UIImage+Crop.m
//  TJFoundation
//
//  Created by Thomas Joulin on 11/1/12.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

- (UIImage *)crop:(CGRect)rect
{
    if (self.scale > 1.0f)
    {
        rect = CGRectMake(rect.origin.x * self.scale,
                          rect.origin.y * self.scale,
                          rect.size.width * self.scale,
                          rect.size.height * self.scale);
    }
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage    *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];

    CGImageRelease(imageRef);

    return result;
}

@end
