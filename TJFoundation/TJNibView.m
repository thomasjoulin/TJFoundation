//
//  TJNibView.m
//  TJFoundation
//
//  Created by Thomas Joulin on 10/13/13.
//
//

#import "TJNibView.h"

@implementation TJNibView

+ (instancetype)loadNib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}

@end
