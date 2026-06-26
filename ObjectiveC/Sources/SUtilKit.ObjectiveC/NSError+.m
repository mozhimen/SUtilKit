//
//  UtilNSError.m
//  libStockIn
//
//  Created by Taiyou on 2026/6/22.
//
#import "NSError+.h"

@implementation NSError (Plus)

+ (NSError *)newInstance:(NSString*) domain
                    code:(NSInteger) code
                  reason:(NSString*) reason{
    return [NSError errorWithDomain: domain code:code userInfo:@{ NSLocalizedDescriptionKey : reason }];
}

@end
