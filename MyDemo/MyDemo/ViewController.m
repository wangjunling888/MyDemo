//
//  ViewController.m
//  MyDemo
//
//  Created by 王俊岭 on 2017/9/30.
//  Copyright © 2017年 王俊岭. All rights reserved.
//

#import "ViewController.h"
#import "JLTestLightLabelViewController.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArr;


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
                     @"测试富文本label"
                     
                     ];
    }
    return _dataArr;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* str = self.dataArr[indexPath.row];
    
    if ([str isEqualToString:@"测试富文本label"]) {
        
        JLTestLightLabelViewController *vc = [[JLTestLightLabelViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
