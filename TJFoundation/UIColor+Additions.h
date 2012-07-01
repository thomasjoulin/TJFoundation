//
//  UIColor+Leijon.h
//  Leijon
//
//  Created by Thomas Joulin on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
}       RGBA;

@interface UIColor (Leijon)

+ (UIColor *)darkGrayLeijonColor;
+ (UIColor *)lightGrayLeijonColor;

@end
