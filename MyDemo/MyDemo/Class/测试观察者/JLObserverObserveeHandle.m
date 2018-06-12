//
//  JLObserverObserveeHandle.m
//  MyDemo
//
//  Created by 王俊岭 on 2018/6/9.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import "JLObserverObserveeHandle.h"

@interface JLObserverObserveeHandle ()

@property (nonatomic, strong) JLMyObserver *observer;
@property (nonatomic, strong) NSObject *obj;
@property (nonatomic, copy) NSString *keyPath;

@end


@implementation JLObserverObserveeHandle


-(id)initWithObserver:(JLMyObserver *)observer target:(NSObject *)obj keyPath:(NSString *)keyPath {
//    删除以便更加简洁
    self = [super init];
    if (self) {
        self.obj = obj;
        self.observer = observer;
        self.keyPath = keyPath;
    }
    return self;
}




-(void)removeObserver {
    [self.obj removeObserver:self forKeyPath:self.keyPath context:nil];
    self.obj = nil;
}
-(void)dealloc {
    [self removeObserver];
}

@end
