//
//  NSDictionary+JavaStyle.h
//  libStockIn
//
//  Created by Taiyou on 2026/3/12.
//
#import <Foundation/Foundation.h>

@interface NSDictionary (JavaStyle)

#pragma mark - 安全的获取方法
- (id)getObjectForKey:(id)key;
- (id)getObjectForKey:(id)key defaultValue:(id)defaultValue;

#pragma mark - 检查方法
- (BOOL)containsKey:(id)key;
- (BOOL)containsValue:(id)value;
- (BOOL)isEmpty;
- (NSUInteger)size;

#pragma mark - 键值集合
- (NSArray *)keyArray;
- (NSArray *)valueArray;
- (NSSet *)keySet;

#pragma mark - 转换方法
- (NSDictionary *)filterByPredicate:(BOOL(^)(id key, id value))predicate;

@end
