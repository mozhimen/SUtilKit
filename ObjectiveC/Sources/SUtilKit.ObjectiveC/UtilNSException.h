//
//  UtilNSException.h
//  libStockIn
//
//  Created by Taiyou on 2026/1/23.
//
#import <Foundation/Foundation.h>

#pragma mark - NSError <-> NSException 静态函数

/// NSError -> NSException 并抛出
static void throwNSExceptionFromError(NSError *error) {
    if (!error) return;

    NSException *exception = [NSException exceptionWithName:@"NSErrorException"
                                                     reason:error.localizedDescription
                                                   userInfo:@{@"NSError": error}];
    @throw exception;
}

/// NSException -> NSError
static NSError *nSException2nSError(NSException *exception,NSInteger code) {
    if (!exception) return nil;

    NSError *error = exception.userInfo[@"NSError"];
    if (!error) {
        // 如果 userInfo 没有 NSError，则创建一个新的 NSError
        error = [NSError errorWithDomain:exception.name
                                    code:code
                                userInfo:@{NSLocalizedDescriptionKey: exception.reason ?: @"Unknown error",
                                           @"NSException": exception}];
    }
    return error;
}
