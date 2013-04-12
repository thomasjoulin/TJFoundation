//
//  UILabel+Sizing.m
//  TJFoundation
//
//  Created by Thomas Joulin on 4/12/13.
//
//

#import "UILabel+Sizing.h"
#import "UIView+Frame.h"

@implementation UILabel (Sizing)

- (void)sizeToFitConstrainingToWidth
{
    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)];
    
    [self setHeight:size.height];
}

- (void)sizeToFitConstrainingToHeight
{
    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(CGFLOAT_MAX, self.frame.size.height)];
    
    [self setWidth:size.width];
}

- (void)sizeToFitConstrainingToSize:(CGSize)constrainedSize
{
    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:constrainedSize];
    
    [self setSize:size];
}

@end
