//
//  NSMutableDictionary+JavaStyle.h
//  libStockIn
//
//  Created by Taiyou on 2026/3/12.
//
#import <Foundation/Foundation.h>

@interface NSMutableDictionary (JavaStyle)

#pragma mark - 安全的添加/更新方法
- (void)putObject:(id)value forKey:(id<NSCopying>)key;
- (void)putAll:(NSDictionary *)dictionary;
- (void)putIfAbsent:(id)value forKey:(id<NSCopying>)key;

#pragma mark - 移除方法
- (void)removeForKey:(id)key;
- (void)removeForKeys:(NSArray *)keys;
- (void)clear;

#pragma mark - 转换方法
- (NSMutableDictionary *)filterByPredicate:(BOOL(^)(id key, id value))predicate;

#pragma mark - 便捷初始化
+ (instancetype)dictionaryOfCapacity:(NSUInteger)capacity;
+ (instancetype)dictionaryFromDictionary:(NSDictionary *)dict;

@end
