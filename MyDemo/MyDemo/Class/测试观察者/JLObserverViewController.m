//
//  JLObserverViewController.m
//  MyDemo
//
//  Created by 王俊岭 on 2018/6/9.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import "JLObserverViewController.h"
#import "JLObserverObserveeHandle.h"
#import "JLObserverManager.h"

#import "JLMyObserver.h"

@interface JLObserverViewController ()
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) JLObserverObserveeHandle *resultLabelMonitor;

@property (nonatomic, strong) JLMyObserver *observer;

@end

@implementation JLObserverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.label];
    __weak typeof(self) weakSelf = self;

    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.observer = [[JLMyObserver alloc] initWithChangeBlock:^(NSDictionary *dic) {
        NSLog(@"%@", dic);
    }];
    
    [self.label addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
   
    
    

}



- (void)dealloc {
    NSLog(@"x销毁了");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    if (self.handler) {
//        self.handler(change);
//    }
      NSLog(@"%@", change);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.text = @"asfjasldjfj";
    }
    return _label;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.label.text = @"woshi";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
