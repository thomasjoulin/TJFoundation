//
//  UIWebView+RemoveShadow.m
//  TJFoundation
//
//  Created by Thomas Joulin on 3/20/13.
//
//

#import "UIWebView+RemoveShadow.h"

@implementation UIWebView (RemoveShadow)

- (void)removeShadow
{
    if ([[self subviews] count] > 0)
    {
        for (UIView *shadowView in [[[self subviews] objectAtIndex:0] subviews])
        {
            [shadowView setHidden:YES];
        }
        
        [[[[[self subviews] objectAtIndex:0] subviews] lastObject] setHidden:NO];
    }
}

@end
