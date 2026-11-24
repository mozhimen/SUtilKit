//
//  NSArray+JSON.h
//  SUtilKit.ObjectiveC
//
//  Created by Taiyou on 2026/8/28.
//

#import <Foundation/Foundation.h>

@interface NSArray (JSONConversion)

- (NSData *)toJSONDataWithError:(NSError **)error;
- (NSString *)toJSONStringWithError:(NSError **)error;

@end
