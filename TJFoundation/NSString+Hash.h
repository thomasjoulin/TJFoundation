//
//  NSString+NSString_Hash.h
//  Leijon
//
//  Created by Thomas Joulin on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hash)

- (NSString *)md5Hash;
- (NSString *)base64EncodedMd5Hash;

// Decodes a hexadecimally encoded binary string
// Similar to hex2bin() in PHP
- (NSData *)decodeFromHexidecimal;

@end
