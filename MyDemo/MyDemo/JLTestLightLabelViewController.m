//
//  JLTestLightLabelViewController.m
//  MyDemo
//
//  Created by 王俊岭 on 2017/12/3.
//  Copyright © 2017年 王俊岭. All rights reserved.
//

#import "JLTestLightLabelViewController.h"

#import <UILabel+YBAttributeTextTapAction.h>

@interface JLTestLightLabelViewController ()
@property (nonatomic, strong) UILabel *testLabel;

@property (nonatomic, strong) NSMutableArray *topicArr;

@property (nonatomic, strong) YYLabel *yyLabel;

@end

@implementation JLTestLightLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.testLabel];
    [self.view addSubview:self.yyLabel];
//    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(100);
//        make.left.equalTo(self.view).offset(10.f);
//        make.right.equalTo(self.view).offset(-10.f);
//    }];
//
    [self.yyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10.f);
        make.right.equalTo(self.view).offset(-10.f);
        make.top.equalTo(self.view).offset(150.f);

    }];
    
//    NSString *str = @"hahahhh#是分开了;鞍山附近;alsdj#, 沙发到家啦第三方#asfjdlafdjlf# 减法时代峰峻#放假了说了房间#";
//  NSAttributedString *attStr = [self attributedString:str color:[UIColor blackColor] font:[UIFont systemFontOfSize:13.f]];
//
//    self.testLabel.attributedText = attStr;
//
//    [self.testLabel yb_addAttributeTapActionWithStrings:self.topicArr tapClicked:^(NSString *string, NSRange range, NSInteger index) {
//        NSLog(@"%@",string);
//    }];

    
    
}

/*
 * 统一的富文本字符串
 */
- (NSAttributedString *)attributedString:(NSString *)text color:(UIColor *)color font:(UIFont *)font {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, text.length)];
    NSError *error = nil;
    
    NSRegularExpression *topicRegular = [NSRegularExpression regularExpressionWithPattern:@"#([^#]+)#" options:NSRegularExpressionAnchorsMatchLines error:&error];
    NSArray *resultArray = [topicRegular matchesInString:text options:NSMatchingReportProgress range:NSMakeRange(0, [text length])];
    
    for (NSTextCheckingResult *match in resultArray) {
        NSRange matchRange = [match range];
        [attributedString removeAttribute:NSForegroundColorAttributeName range:matchRange];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:matchRange];
        [self.topicArr addObject:[text substringWithRange:matchRange]];
    }
    return attributedString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UILabel *)testLabel {
    if (_testLabel == nil) {
        _testLabel = [[UILabel alloc] init];
        _testLabel.numberOfLines = 0;
        NSString *str = @"这里是yylabel,";
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
        attrStr.yy_font = [UIFont systemFontOfSize:20.f];
        NSRange range = [str rangeOfString:@"yylabel"];
        [attrStr yy_setColor:[UIColor redColor] range:range];
        _testLabel.attributedText = attrStr;
    }
    return _testLabel;
}

- (YYLabel *)yyLabel {
    if (_yyLabel == nil) {
        _yyLabel = [[YYLabel alloc] init];
        _yyLabel.numberOfLines = 0;
        NSString *str = @"这里是yylabel正在测试使用中这里是yylabel正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中这里是yylabel, 正在测试使用中";
        _yyLabel.text = str;
    }
    return _yyLabel;
}

- (NSMutableArray *)topicArr {
    if (_topicArr == nil) {
        _topicArr = [NSMutableArray array];
    }
    return _topicArr;
}
         

@end
