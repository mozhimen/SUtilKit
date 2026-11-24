//
//  NSArray+JSON.m
//  SUtilKit.ObjectiveC
//
//  Created by Taiyou on 2026/8/28.
//
#import <Foundation/Foundation.h>

@implementation NSArray (JSONConversion)

// IDA: 0x474C
- (NSData *)toJSONDataWithError:(NSError **)error {
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:error];
}

// IDA: 0x4764
- (NSString *)toJSONStringWithError:(NSError **)error {
    NSData *jsonData = [self toJSONDataWithError:error];
    
    if (jsonData == nil) {
        return nil;
    }
    
    return [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
}

@end
