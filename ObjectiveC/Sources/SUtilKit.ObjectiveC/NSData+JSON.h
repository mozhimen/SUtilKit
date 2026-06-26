//
//  NSData+.h
//  libStockOut
//
//  Created by Taiyou on 2026/3/10.
//

#import <Foundation/Foundation.h>

// MARK: -

@interface NSData (JSON)

- (NSDictionary *)toJSONDictionaryWithError:(NSError **)error;

@end


