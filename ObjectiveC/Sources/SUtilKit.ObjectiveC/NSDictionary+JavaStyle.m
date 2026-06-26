#import "NSDictionary+JavaStyle.h"
#import <Foundation/Foundation.h>

@implementation NSDictionary (JavaStyle)

#pragma mark - 安全的获取方法
- (id)getObjectForKey:(id)key {
    if (!key) return nil;
    return [self objectForKey:key];
}

- (id)getObjectForKey:(id)key defaultValue:(id)defaultValue {
    id value = [self getObjectForKey:key];
    return value ? value : defaultValue;
}

#pragma mark - 检查方法
- (BOOL)containsKey:(id)key {
    if (!key) return NO;
    return [[self allKeys] containsObject:key];
}

- (BOOL)containsValue:(id)value {
    if (!value) return NO;
    return [[self allValues] containsObject:value];
}

- (BOOL)isEmpty {
    return self.count == 0;
}

- (NSUInteger)size {
    return self.count;
}

#pragma mark - 键值集合
- (NSArray *)keyArray {
    return [self allKeys];
}

- (NSArray *)valueArray {
    return [self allValues];
}

- (NSSet *)keySet {
    return [NSSet setWithArray:[self allKeys]];
}

#pragma mark - 转换方法
- (NSDictionary *)filterByPredicate:(BOOL(^)(id key, id value))predicate {
    if (!predicate) return @{};
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (predicate(key, obj)) {
            [result setObject:obj forKey:key];
        }
    }];
    
    return [result copy];
}

@end
