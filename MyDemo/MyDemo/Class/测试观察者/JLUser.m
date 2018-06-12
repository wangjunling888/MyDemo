//
//  JLUser.m
//  MyDemo
//
//  Created by 王俊岭 on 2018/6/12.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import "JLUser.h"

@implementation JLUser


- (void)updateName {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.name = @"wangwang";
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.name = @"liuliu";
    });
    
}

@end
