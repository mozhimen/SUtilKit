//
//  UtilDictionary.m
//  GameStock
//
//  Created by Taiyou on 2026/1/6.
//
#import <Foundation/Foundation.h>
#import "UtilNSDictionary.h"

@implementation UtilDictionary

#pragma mark - 创建方法
+ (NSMutableDictionary *)mutableDict {
    return [NSMutableDictionary dictionary];
}

+ (NSMutableDictionary *)mutableDictWithCapacity:(NSUInteger)capacity {
    return [NSMutableDictionary dictionaryWithCapacity:capacity];
}

+ (NSMutableDictionary *)mutableDictFromDictionary:(NSDictionary *)dict {
    if (!dict) return [self mutableDict];
    return [NSMutableDictionary dictionaryWithDictionary:dict];
}

#pragma mark - 安全的put方法
+ (void)putObject:(id)value forKey:(id<NSCopying>)key
        intoDict:(NSMutableDictionary *)dict {
    if (!dict || !key) return;
    
    if (value) {
        [dict setObject:value forKey:key];
    }
}

+ (void)putAll:(NSDictionary *)source
       intoDict:(NSMutableDictionary *)target {
    if (!source || !target) return;
    [target addEntriesFromDictionary:source];
}

+ (void)putIfAbsent:(id)value forKey:(id<NSCopying>)key
           intoDict:(NSMutableDictionary *)dict {
    if (!dict || !key) return;
    
    if (![self getObjectForKey:key fromDict:dict] && value) {
        [self putObject:value forKey:key intoDict:dict];
    }
}

#pragma mark - 安全的get方法
+ (id)getObjectForKey:(id)key fromDict:(NSDictionary *)dict {
    if (!dict || !key) return nil;
    return [dict objectForKey:key];
}

+ (id)getObjectForKey:(id)key fromDict:(NSDictionary *)dict defaultValue:(id)defaultValue {
    id value = [self getObjectForKey:key fromDict:dict];
    return value ? value : defaultValue;
}

#pragma mark - 检查方法
+ (BOOL)containsKey:(id)key inDict:(NSDictionary *)dict {
    if (!dict || !key) return NO;
    return [[dict allKeys] containsObject:key];
}

+ (BOOL)containsValue:(id)value inDict:(NSDictionary *)dict {
    if (!dict) return NO;
    return [[dict allValues] containsObject:value];
}

+ (BOOL)isEmpty:(NSDictionary *)dict {
    return dict.count == 0;
}

+ (NSUInteger)size:(NSDictionary *)dict {
    return dict.count;
}

#pragma mark - 移除方法
+ (void)removeForKey:(id)key fromDict:(NSMutableDictionary *)dict {
    if (!dict || !key) return;
    [dict removeObjectForKey:key];
}

+ (void)removeForKeys:(NSArray *)keys fromDict:(NSMutableDictionary *)dict {
    if (!dict || !keys) return;
    [dict removeObjectsForKeys:keys];
}

+ (void)clear:(NSMutableDictionary *)dict {
    if (!dict) return;
    [dict removeAllObjects];
}

#pragma mark - 转换方法
+ (NSArray *)keysToArray:(NSDictionary *)dict {
    if (!dict) return @[];
    return [dict allKeys];
}

+ (NSArray *)valuesToArray:(NSDictionary *)dict {
    if (!dict) return @[];
    return [dict allValues];
}

+ (NSDictionary *)filter:(NSDictionary *)dict
            byPredicate:(BOOL(^)(id key, id value))predicate {
    if (!dict || !predicate) return @{};
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (predicate(key, obj)) {
            [result setObject:obj forKey:key];
        }
    }];
    
    return [result copy];
}

@end
