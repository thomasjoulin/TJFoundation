//
//  NSString+NSString_Hash.m
//  Leijon
//
//  Created by Thomas Joulin on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+Hash.h"
#import "NSData+Base64.h"

@interface NSString ()

unsigned char _strToChar(char a, char b);

@end

@implementation NSString (Hash)

- (NSString *)md5Hash
{
    const char      *cStr = [self UTF8String];
    unsigned char   result[CC_MD5_DIGEST_LENGTH];
    NSMutableString *result2;
    
    CC_MD5(cStr, strlen(cStr), result);
    result2 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
    {
        [result2 appendFormat:@"%02x", result[i]];
    }       
    
    return [NSString stringWithString:result2];
}

- (NSString *)base64EncodedMd5Hash
{
    return [[[self md5Hash] decodeFromHexidecimal] base64EncodedString];
}

unsigned char _strToChar(char a, char b)
{
    char encoder[3] = {'\0','\0','\0'};
    
    encoder[0] = a;
    encoder[1] = b;

    return (char) strtol(encoder, NULL, 16);
}

- (NSData *)decodeFromHexidecimal
{
    const char      *bytes = [self cStringUsingEncoding: NSUTF8StringEncoding];
    NSUInteger      length = strlen(bytes);
    unsigned char   *r = (unsigned char *) malloc(length / 2 + 1);
    unsigned char   *index = r;
    
    while ((*bytes) && (*(bytes +1)))
    {
        *index = _strToChar(*bytes, *(bytes +1));
        index++;
        bytes+=2;
    }
    *index = '\0';
    
    NSData * result = [NSData dataWithBytes: r length: length / 2];
    free(r);
    
    return result;
}

@end
