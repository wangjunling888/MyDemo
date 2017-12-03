//
//  JLViewController.m
//  MyDemo
//
//  Created by 王俊岭 on 2017/10/20.
//  Copyright © 2017年 王俊岭. All rights reserved.
//

#import "JLViewController.h"

#import "masonry.h"

@interface JLViewController ()

@end

@implementation JLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] init];
   
    [btn setImage:[UIImage imageNamed:@"icon_move_done"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(200);
    }];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
