//
//  JLTestPerson.m
//  MyDemo
//
//  Created by 王俊岭 on 2018/5/30.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import "JLTestPerson.h"

@interface JLTestPerson ()


@property (nonatomic, strong) NSString *test;
@end

@implementation JLTestPerson



- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"test"]) {
        NSLog(@"hahahahhah ");
        NSLog(@"hahahahhah ");
        
        NSLog(@"hahahahhah ");
    } else {
        [super setNilValueForKey:key];
    }
}

@end
