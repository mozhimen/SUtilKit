//
//  UtilNSError.h
//  libStockIn
//
//  Created by Taiyou on 2026/6/22.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSError (Plus)

+ (NSError *)newInstance:(NSString*) domain
                    code:(NSInteger) code
                  reason:(NSString*) reason;

@end

NS_ASSUME_NONNULL_END
