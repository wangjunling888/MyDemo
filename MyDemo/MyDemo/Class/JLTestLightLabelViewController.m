//
//  JLTestLightLabelViewController.m
//  MyDemo
//
//  Created by 王俊岭 on 2017/12/3.
//  Copyright © 2017年 王俊岭. All rights reserved.
//

#import "JLTestLightLabelViewController.h"

#import <UILabel+YBAttributeTextTapAction.h>


#import "JLSelectItemViewController.h"


#import "CQSideBarManager.h"

@interface JLTestLightLabelViewController ()

@property (nonatomic, strong) UIButton *testBtn;
@property (nonatomic, strong) UIButton *openBtn;

@property (nonatomic, strong) JLSelectItemViewController *secondVC;
@end

@implementation JLTestLightLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.testBtn];
    [self.view addSubview:self.openBtn];
    
    
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(10.f);
        make.right.equalTo(self.view).offset(-10.f);
    }];
    
    [self.openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.testBtn.mas_bottom).offset(100);
        make.left.equalTo(self.testBtn);
    }];
    
    [self addChildViewController:self.secondVC];
    
  
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
    [[CQSideBarManager sharedInstance] closeSideBar];
}

- (JLSelectItemViewController *)secondVC {
    if (_secondVC == nil) {
        _secondVC = [[JLSelectItemViewController alloc] init];
        _secondVC.view.backgroundColor = [UIColor blueColor];
    }
    return _secondVC;
}

- (UIButton *)openBtn {
    if (_openBtn == nil) {
        _openBtn = [[UIButton alloc] init];
        [_openBtn addTarget:self action:@selector(openAnimation) forControlEvents:UIControlEventTouchUpInside];
        
        [_openBtn setTitle:@"Open" forState:UIControlStateNormal];
    }
    return _openBtn;
}

- (void)openAnimation
{
    [self.view addSubview:self.secondVC.view];
    self.secondVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    [UIView animateWithDuration:SIDEBAR_ANIMATE_DURATION animations:^{
         self.secondVC.view.frame = self.view.bounds;
        
//        _contentView.frame = CGRectMake(_startOffsetPoint.x, _startOffsetPoint.y, _currentWindow.cq_width - _startOffsetPoint.x, _currentWindow.cq_height - _startOffsetPoint.y);
//        _shadeView.backgroundColor = SIDEBAR_COLOR(0, 0, 0, 0.5f);
    }];

}

//- (void)closeAnimation {
//    [UIView animateWithDuration:SIDEBAR_ANIMATE_DURATION animations:^{
//        _contentView.frame = CGRectMake(_endOffsetPoint.x, _endOffsetPoint.y,_currentWindow.cq_width, _currentWindow.cq_height);
//        _shadeView.backgroundColor = SIDEBAR_COLOR(0, 0, 0, 0.0f);
//    } completion:^(BOOL finished) {
//
//        [_shadeView removeFromSuperview];
//        [_contentView removeFromSuperview];
//
//        [self removeObserverDeviceOrientationNotification];
//
//        _shadeView = nil;
//        _contentView = nil;
//        _delegate = nil;
//
//    }];
//}

@end
