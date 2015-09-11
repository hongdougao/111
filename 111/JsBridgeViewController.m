//
//  JsBridgeViewController.m
//  111
//
//  Created by yangyue on 15/8/17.
//  Copyright (c) 2015年 com.yintai.iphone. All rights reserved.
//

#import "JsBridgeViewController.h"
#import "WebViewJavascriptBridge.h"

@interface JsBridgeViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *wbView;
@property (strong,nonatomic)WebViewJavascriptBridge *bridge;
@end

@implementation JsBridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wbView.delegate = self;
    
    [WebViewJavascriptBridge enableLogging];

    // Do any additional setup after loading the view from its nib.
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:self.wbView
                                                    handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC received message from JS: %@", data);
        responseCallback(@"Response for message from ObjC");

    }];
    
    [self.wbView loadRequest: [NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"a" withExtension:@"html"]]] ;
    
   }
- (IBAction)click:(id)sender {
    [self.bridge send:@"Well hello there"];
    [self.bridge send:[NSDictionary dictionaryWithObject:@"Foo" forKey:@"Bar"]];
    [self.bridge send:@"Give me a response, will you?"
     responseCallback:^(id responseData) {
         NSLog(@"ObjC got its response! %@", responseData);
     }];
}
- (IBAction)click3Action:(id)sender {
    
    //动态给js js需要的东西
    [self.bridge registerHandler:@"handleCustom"
                         handler:^(id data, WVJBResponseCallback responseCallback) {
                             NSLog(@"responsCall Back :%@",responseCallback);
        NSString *str = @"hello js";
        responseCallback(str);
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
