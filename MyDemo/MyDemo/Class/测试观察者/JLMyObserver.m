//
//  JLMyObserver.m
//  MyDemo
//
//  Created by 王俊岭 on 2018/6/9.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import "JLMyObserver.h"

@interface JLMyObserver ()

@property (nonatomic, copy) void(^handler)(NSDictionary *block);
@property (nonatomic, copy) NSString *keyPath;
@end

@implementation JLMyObserver


- (instancetype)initWithChangeBlock:(void(^)(NSDictionary *dic))block
{
    self = [super init];
    if (self) {
         self.handler = block;
    }
    return self;
}

//- (void)addObserver:(id)observer forKey:(NSString *)keyPath block:(void(^)(NSDictionary *changes))block {
//    [self addObserver:observer forKeyPath:keyPath options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
//    self.keyPath = keyPath;
//    self.handler = block;
//}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (self.handler) {
        self.handler(change);
    }
    
}


@end
