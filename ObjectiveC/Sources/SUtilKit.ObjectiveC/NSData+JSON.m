//
//  NSData+JSON.m
//  libStockOut
//
//  Created by Taiyou on 2026/3/10.
//
#import "NSData+JSON.h"

@implementation NSData (JSON)

- (NSDictionary *)toJSONDictionaryWithError:(NSError **)error {
    id jsonObj = [NSJSONSerialization JSONObjectWithData:self
                                                 options:NSJSONReadingMutableContainers
                                                   error:error];
    
    // 如果有错误，直接返回 nil
    if (*error) {
        return nil;
    }
    
    // 检查是否为字典类型
    if (![jsonObj isKindOfClass:[NSDictionary class]]) {
        if (error) {
            *error = [NSError errorWithDomain:@"NSData+JSON" code:3840 userInfo:@{NSLocalizedDescriptionKey: @"JSON is not a dictionary"}];
        }
        return nil;
    }
    
    return (NSDictionary *)jsonObj;
}

@end
