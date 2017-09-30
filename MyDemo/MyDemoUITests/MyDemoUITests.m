//
//  MyDemoUITests.m
//  MyDemoUITests
//
//  Created by 王俊岭 on 2017/9/30.
//  Copyright © 2017年 王俊岭. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MyDemoUITests : XCTestCase

@end

@implementation MyDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSLog(@"自定义测试testExample");
    int  a= 3;
    XCTAssertTrue(a == 0,"a 不能等于 0");
}

@end
