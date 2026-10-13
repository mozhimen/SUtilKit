//
//  NSData+JSON.m
//  libStockOut
//
//  Created by Taiyou on 2026/3/10.
//
#import "NSData+JSON.h"

@implementation NSData (JSON)

- (NSDictionary *)toJSONDictionaryWithError:(NSError **)error {
    id jsonObject = [NSJSONSerialization JSONObjectWithData:self
                                                    options:NSJSONReadingMutableContainers
                                                      error:error];
    if (error != NULL && *error != nil) {
        return nil;
    }
    if (![jsonObject isKindOfClass:[NSDictionary class]]) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"com.example.JSONConversion"
                                         code:3840
                                     userInfo:@{NSLocalizedDescriptionKey: @"JSON is not a dictionary"}];
        }
        return nil;
    }
    return (NSDictionary *)jsonObject;
}

@end
