//
//  JLTestHtmlStrViewController.m
//  MyDemo
//
//  Created by 王俊岭 on 2018/5/23.
//  Copyright © 2018年 王俊岭. All rights reserved.
//

#import "JLTestHtmlStrViewController.h"

#import "JLTestPerson.h"

#import <WebKit/WebKit.h>

@interface JLTestHtmlStrViewController ()
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSDictionary *dic;
@property (nonatomic, strong) JLTestPerson *person;
@end

@implementation JLTestHtmlStrViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.backBarButtonItem.target = self;
        self.navigationItem.backBarButtonItem.action = @selector(testBackBtn);
    }
    return self;
}

- (void)testBackBtn {
    NSLog(@"点击了返回按钮");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testKVC];

    [self setupUI];
    
    
    NSString * str1 = @"&lt;div style='font-size: 50px; color: #ff0000;'""&gt;Google（中文名：谷歌），是一家美国的跨国科技企业。&lt;/div&gt;&lt;div&gt;Google由当时在斯坦福大学攻读理工博士的拉里·佩奇和谢尔盖·布卢姆共同创建，因此两人也被称为“Google Guys”。&lt;/div&gt;&lt;div&gt;1998年9月4日，Google以私营公司的形式创立，设计并管理一个互联网搜索引擎“Google搜索”。&lt;/div&gt;";
    NSString * str2 = @"&lt;p&gt;&lt;br&gt;&lt;/p&gt";
    NSString * str3 = @"&lt;p&gt;qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq&lt;/p&gt";
    //1.将字符串转化为标准HTML字符串
    //1.将字符串转化为标准HTML字符串
    str1 = [self htmlEntityDecode:str1];
    //2.将HTML字符串转换为attributeString
    NSAttributedString * attributeStr = [self attributedStringWithHTMLString:str1];
    
    
    
//    NSString *htmlStr = @"我的<span style='color:red'>aafaf微</span>我的<span style='color:red'>aafaf微</span>";
//    NSAttributedString *att = [[NSAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
   

    //3.使用label加载html字符串
    self.label.attributedText = attributeStr;
    
   //4. 使用webview加载
    [self.webView loadHTMLString:str1 baseURL:nil];
}

- (void)setupUI {
    [self testWebView];
//    [self testLabel];
    
}
- (void)testLabel {
    [self.view addSubview: self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)testWebView {
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (WKWebView *)webView {
    if (_webView == nil) {
        _webView = [[WKWebView alloc] init];
    }
    return _webView;
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 0;
    }
    return _label;
}
//将 &lt 等类似的字符转化为HTML中的“<”等
- (NSString *)htmlEntityDecode:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"]; // Do this last so that, e.g. @"&amp;lt;" goes to @"&lt;" not @"<"
    return string;
}

//将HTML字符串转化为NSAttributedString富文本字符串
- (NSAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString
{
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [[NSAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
}

//将富文本转换成html字符串
- (NSString *)htmlStrWithAttributedStr:(NSAttributedString *)attributeStr {
    //富文本转换为html(最后相当于整个网页代码，会有css等)
    NSDictionary *dic = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,                 NSCharacterEncodingDocumentAttribute:@(NSUnicodeStringEncoding)};
    
    NSData *data = [attributeStr dataFromRange:NSMakeRange(0, attributeStr.length) documentAttributes:dic error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUnicodeStringEncoding];
}



//去掉 HTML 字符串中的标签
- (NSString *)filterHTML:(NSString *)html {
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

- (NSDictionary *)dic {
    if (_dic ==nil) {
        return [NSDictionary dictionary];
    }
    return _dic;
}
- (JLTestPerson *)person {
    if (_person  == nil) {
        _person = [JLTestPerson new];
    }
    return _person;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testKVC];
}
- (void)testKVC {
    [self.person setValue:nil forKey:@"test"];
    
    NSLog(@"%@", [self.person valueForKey:@"test"]);
}
@end
