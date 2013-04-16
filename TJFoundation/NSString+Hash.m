//
//  NSString+Hash.m
//  TJFoundation
//
//  Created by Thomas Joulin on 4/16/13.
//
//

#import <CommonCrypto/CommonDigest.h>

#import "NSString+Hash.h"

@implementation NSString (Hash)

- (NSString *)sha1Value
{
    NSData          *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t         digest[CC_SHA1_DIGEST_LENGTH];
    NSMutableString *output;
    
    CC_SHA1(data.bytes, data.length, digest);
    
    output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

- (NSString *)sha256Value
{
    NSData          *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t         digest[CC_SHA256_DIGEST_LENGTH];
    NSMutableString *output;
    
    CC_SHA256(data.bytes, data.length, digest);
    
    output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
