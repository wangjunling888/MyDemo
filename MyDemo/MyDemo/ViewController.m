//
//  ViewController.m
//  MyDemo
//
//  Created by 王俊岭 on 2017/9/30.
//  Copyright © 2017年 王俊岭. All rights reserved.
//

#import "ViewController.h"
#import "JLTestLightLabelViewController.h"
#import "CQSideBarManager.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CQSideBarManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) JLTestLightLabelViewController *sideBarVC;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *reuseID = @"textReuseID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    
                             
    return cell;
}

- (NSArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = @[
                     @"测试富文本label",
                     @"测试侧边栏"
                     ];
    }
    return _dataArr;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* str = self.dataArr[indexPath.row];
    
    if ([str isEqualToString:@"测试富文本label"]) {
        
        JLTestLightLabelViewController *vc = [[JLTestLightLabelViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([str isEqualToString:@"测试侧边栏"]) {
        [[CQSideBarManager sharedInstance] openSideBar:self];
    }
    
    NSLog(@"测试");
    
    NSLog(@"测试");
    
    NSLog(@"刚才删除错了");
    
}
#pragma mark - CQSideBarManagerDelegate
- (UIView *)viewForSideBar {
    return self.sideBarVC.view;
}



- (JLTestLightLabelViewController *)sideBarVC {
    if (_sideBarVC == nil) {
        _sideBarVC = [[JLTestLightLabelViewController alloc] init];
        _sideBarVC.view.cq_width = self.view.cq_width - 35.f;
    }
    return _sideBarVC;
}


@end
