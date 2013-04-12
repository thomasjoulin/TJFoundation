//
//  UILabel+Sizing.h
//  TJFoundation
//
//  Created by Thomas Joulin on 4/12/13.
//
//

@interface UILabel (Sizing)

- (void)sizeToFitConstrainingToWidth;
- (void)sizeToFitConstrainingToHeight;
- (void)sizeToFitConstrainingToSize:(CGSize)constrainedSize;

@end
