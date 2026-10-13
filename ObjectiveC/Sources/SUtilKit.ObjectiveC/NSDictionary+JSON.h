//
//  NSDictionary+JSON.h
//  SUtilKit.ObjectiveC
//
//  Created by Taiyou on 2026/8/19.
//
#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end

static NSDictionary *dictionaryWithJsonString(NSString *jsonString){
    return [NSDictionary dictionaryWithJsonString:jsonString];
}
