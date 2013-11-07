//
//  UISearchBar+TJAdditions.m
//  TJFoundation
//
//  Created by Thomas Joulin on 11/7/13.
//
//

#import "UISearchBar+TJAdditions.h"
#import "UIDevice+TJAdditions.h"

@implementation UISearchBar (TJAdditions)

- (void)setKeyboardReturnKeyType:(UIReturnKeyType)returnKeyType
{
    UITextField *textField;
    
    if ([UIView instancesRespondToSelector:@selector(addMotionEffect:)])
    {
        for (UIView *subview in self.subviews)
        {
            for (UIView *subSubview in subview.subviews)
            {
                if ([subSubview conformsToProtocol:@protocol(UITextInputTraits)])
                {
                    textField = (UITextField *)subSubview;
                    break;
                }
            }
        }
    }
    else
    {
        for (UIView *searchBarSubview in [self subviews])
        {
            if ([searchBarSubview conformsToProtocol:@protocol(UITextInputTraits)])
            {
                textField = (UITextField *)searchBarSubview;
            }
        }
    }
    
    [textField setReturnKeyType:UIReturnKeyDone];
    [textField setKeyboardAppearance:UIKeyboardAppearanceAlert];
    [textField setEnablesReturnKeyAutomatically:NO];
}

@end
