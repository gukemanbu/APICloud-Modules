//
//  UZAlbumSingleton.m
//  UIAlbumBrowser
//
//  Created by wei on 2017/8/28.
//  Copyright © 2017年 wei. All rights reserved.
//

#import "UZAlbumSingleton.h"

@implementation UZAlbumSingleton
//全局变量
static id _instance = nil;
//单例方法
+(instancetype)sharedSingleton{
    return [[self alloc] init];
}
////alloc会调用allocWithZone:
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
//初始化方法
- (instancetype)init{
    // 只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}
//copy在底层 会调用copyWithZone:
- (id)copyWithZone:(NSZone *)zone{
    return  _instance;
}
+ (id)copyWithZone:(struct _NSZone *)zone{
    return  _instance;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{
    return _instance;
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}
@end

