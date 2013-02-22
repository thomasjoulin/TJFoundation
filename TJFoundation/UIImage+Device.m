//
//  UIImage+Device.m
//  TJFoundation
//
//  Created by Thomas Joulin on 2/22/13.
//
//

#import "UIImage+Device.h"

@implementation UIImage (Device)

+ (UIImage *)imageNamed:(NSString *)imageName resolutionIndependant:(BOOL)resolutionIndependant
{
    if (resolutionIndependant &&
        [UIScreen mainScreen].bounds.size.height == 568.f &&
        (![imageName hasSuffix:@"-568h"] || ![imageName hasSuffix:@"-568h.png"] || ![imageName hasSuffix:@"-568h@2x.png"]))
    {
        NSString *path = [[[imageName stringByReplacingOccurrencesOfString:@".png" withString:@""] stringByReplacingOccurrencesOfString:@"@2x" withString:@""] stringByAppendingString:@"-568h"];
        UIImage  *image568h = [UIImage imageNamed:path];
        
        if (image568h)
        {
            return image568h;
        }
    }
    
    return [UIImage imageNamed:imageName];
}

@end
