//
//  JLSelectItemViewController.m
//  MyDemo
//
//  Created by 王俊岭 on 2018/1/4.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import "JLSelectItemViewController.h"

@interface JLSelectItemViewController ()

@property (nonatomic, strong) UIButton *testBtn;


@end

@implementation JLSelectItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.testBtn];
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(10.f);
        make.right.equalTo(self.view).offset(-10.f);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIButton *)testBtn {
    if (_testBtn == nil) {
        _testBtn = [[UIButton alloc] init];
        [_testBtn addTarget:self action:@selector(testBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        
        [_testBtn setTitle:@"close" forState:UIControlStateNormal];
    }
    return _testBtn;
}

- (void)testBtnClicked {
    [UIView animateWithDuration:0.25 animations:^{
          self.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
}
@end
