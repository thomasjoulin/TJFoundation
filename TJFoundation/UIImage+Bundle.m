//
//  UIImage+Bundle.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/20/12.
//
//

#import "UIImage+Bundle.h"
#import <TJFoundation/NSBundle+TJFoundation.h>

@implementation UIImage (Bundle)

//// Causes crashed because is a private method : stackoverflow.com/questions/13798254/ios-crash-missing-images-before-playing-video+&cd=1&hl=en&ct=clnk
//+ (UIImage *)imageNamed:(NSString *)imageName inBundle:(NSBundle *)bundle
//{
//    return [UIImage imageWithContentsOfFile:[[NSBundle TJFoundationBundle] pathForResource:imageName ofType:nil]];
//}

@end
