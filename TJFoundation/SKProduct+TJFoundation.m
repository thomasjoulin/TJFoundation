//
//  SKProduct+TJFoundation.m
//  TJFoundation
//
//  Created by Thomas Joulin on 12/6/12.
//

#import "SKProduct+TJFoundation.h"

@implementation SKProduct (TJFoundation)

- (NSString *)localizedPrice
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:self.priceLocale];
    
    return [numberFormatter stringFromNumber:self.price];
}

@end
