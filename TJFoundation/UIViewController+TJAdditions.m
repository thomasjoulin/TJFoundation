//
//  UIViewController+TJAdditions.m
//  TJFoundation
//
//  Created by Thomas Joulin on 10/16/13.
//
//

#import "UIViewController+TJAdditions.h"

@implementation UIViewController (TJAdditions)

- (id)firstParentViewControllerOfClass:(Class)class
{
    if (self.parentViewController)
    {
        if ([self.parentViewController isKindOfClass:class])
        {
            return self.parentViewController;
        }
        else
        {
            return [self.parentViewController firstParentViewControllerOfClass:class];
        }
    }
    
    return nil;
}

@end
