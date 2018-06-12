//
//  JLObserverManager.m
//  MyDemo
//
//  Created by 王俊岭 on 2018/6/9.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import "JLObserverManager.h"

#import "JLObserverObserveeHandle.h"

@implementation JLObserverManager
NSMutableArray *observers;
+(JLObserverObserveeHandle *)addObserverToObject:(NSObject *)obj forKey:(NSString *)keyPath block:(void(^)(NSDictionary *changes))block {
    JLMyObserver *observer = [[JLMyObserver alloc] init];
    [obj addObserver:observer forKeyPath:keyPath
             options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
             context:NULL];
    JLObserverObserveeHandle *details = [[JLObserverObserveeHandle alloc] initWithObserver:observer target:obj keyPath:keyPath];
    [observers addObject:details];
    return details;

}
@end
