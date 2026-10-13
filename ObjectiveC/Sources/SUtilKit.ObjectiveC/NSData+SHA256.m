//
//  NSData+SHA256.m
//  libStockInPass
//
//  Created by Taiyou on 2026/8/19.
//

#import "NSData+SHA256.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (SHA256)

- (NSData *)sha256 {
    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = { 0 };
    CC_SHA256(self.bytes, (CC_LONG)self.length, digest);
    return [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
}

@end


