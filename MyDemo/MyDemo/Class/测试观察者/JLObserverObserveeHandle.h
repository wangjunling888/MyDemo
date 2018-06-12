//
//  JLObserverObserveeHandle.h
//  MyDemo
//
//  Created by 王俊岭 on 2018/6/9.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JLMyObserver.h"

@interface JLObserverObserveeHandle : NSObject



-(id)initWithObserver:(JLMyObserver *)observer target:(NSObject *)obj keyPath:(NSString *)keyPath;



@end
