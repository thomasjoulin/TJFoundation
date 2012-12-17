//
//  UIImageView+TJFoundation.m
//  TJFoundation
//
//  Created by Thomas Joulin on 11/12/12.
//

#import "UIImageView+TJFoundation.h"

@implementation UIImageView (Additions)

- (id)initWithImageNamed:(NSString *)imageName
{
    return [self initWithImage:[UIImage imageNamed:imageName]];
}

@end
