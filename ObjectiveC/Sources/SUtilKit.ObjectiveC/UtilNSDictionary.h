//
//  UtilDictionary.h
//  GameStock
//
//  Created by Taiyou on 2026/1/6.
//

// DictUtils.h
#import <Foundation/Foundation.h>


@interface UtilDictionary : NSObject

#pragma mark - 创建方法
+ (NSMutableDictionary *)mutableDict;
+ (NSMutableDictionary *)mutableDictWithCapacity:(NSUInteger)capacity;
+ (NSMutableDictionary *)mutableDictFromDictionary:(NSDictionary *)dict;

#pragma mark - 安全的put方法
+ (void)putObject:(id)value forKey:(id<NSCopying>)key
        intoDict:(NSMutableDictionary *)dict;
        
+ (void)putAll:(NSDictionary *)source
       intoDict:(NSMutableDictionary *)target;
       
+ (void)putIfAbsent:(id)value forKey:(id<NSCopying>)key
           intoDict:(NSMutableDictionary *)dict;

#pragma mark - 安全的get方法
+ (id)getObjectForKey:(id)key fromDict:(NSDictionary *)dict;
+ (id)getObjectForKey:(id)key fromDict:(NSDictionary *)dict defaultValue:(id)defaultValue;
             
#pragma mark - 检查方法
+ (BOOL)containsKey:(id)key inDict:(NSDictionary *)dict;
+ (BOOL)containsValue:(id)value inDict:(NSDictionary *)dict;
+ (BOOL)isEmpty:(NSDictionary *)dict;
+ (NSUInteger)size:(NSDictionary *)dict;

#pragma mark - 移除方法
+ (void)removeForKey:(id)key fromDict:(NSMutableDictionary *)dict;
+ (void)removeForKeys:(NSArray *)keys fromDict:(NSMutableDictionary *)dict;
+ (void)clear:(NSMutableDictionary *)dict;

#pragma mark - 转换方法
+ (NSArray *)keysToArray:(NSDictionary *)dict;
+ (NSArray *)valuesToArray:(NSDictionary *)dict;
+ (NSDictionary *)filter:(NSDictionary *)dict
            byPredicate:(BOOL(^)(id key, id value))predicate;

@end


