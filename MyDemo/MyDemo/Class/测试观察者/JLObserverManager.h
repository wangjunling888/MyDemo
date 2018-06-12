//
//  JLObserverManager.h
//  MyDemo
//
//  Created by 王俊岭 on 2018/6/9.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JLObserverObserveeHandle;

@interface JLObserverManager : NSObject

+(JLObserverObserveeHandle *)addObserverToObject:(NSObject *)obj forKey:(NSString *)keyPath block:(void(^)(NSDictionary *changes))block;

@end
