//
//  NSData+SHA256.h
//  libStockInPass
//
//  Created by Taiyou on 2026/8/19.
//

#import <Foundation/Foundation.h>

@interface NSData (SHA256)

- (NSData *)sha256;

@end

static NSData *sha256(NSData *data){
    return data.sha256;
}
