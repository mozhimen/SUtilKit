//
//  NSMutableDictionary+JavaStyle.m
//  libStockIn
//
//  Created by Taiyou on 2026/3/12.
//
#import <Foundation/Foundation.h>
#import "NSMutableDictionary+JavaStyle.h"

@implementation NSMutableDictionary (JavaStyle)

#pragma mark - 安全的添加/更新方法
- (void)putObject:(id)value forKey:(id<NSCopying>)key {
    if (!key) return;
    
    if (value) {
        [self setObject:value forKey:key];
    }
}

- (void)putAll:(NSDictionary *)dictionary {
    if (dictionary) {
        [self addEntriesFromDictionary:dictionary];
    }
}

- (void)putIfAbsent:(id)value forKey:(id<NSCopying>)key {
    if (!key || !value) return;
    
    if (![self objectForKey:key]) {
        [self setObject:value forKey:key];
    }
}

#pragma mark - 移除方法
- (void)removeForKey:(id)key {
    if (key) {
        [self removeObjectForKey:key];
    }
}

- (void)removeForKeys:(NSArray *)keys {
    if (keys) {
        [self removeObjectsForKeys:keys];
    }
}

- (void)clear {
    [self removeAllObjects];
}

#pragma mark - 转换方法
- (NSMutableDictionary *)filterByPredicate:(BOOL(^)(id key, id value))predicate {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    if (!predicate) return result;
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (predicate(key, obj)) {
            [result setObject:obj forKey:key];
        }
    }];
    
    return result;
}

#pragma mark - 便捷初始化
+ (instancetype)dictionaryOfCapacity:(NSUInteger)capacity {
    return [NSMutableDictionary dictionaryWithCapacity:capacity];
}

+ (instancetype)dictionaryFromDictionary:(NSDictionary *)dict {
    if (!dict) {
        return [NSMutableDictionary dictionary];
    }
    return [NSMutableDictionary dictionaryWithDictionary:dict];
}

@end
