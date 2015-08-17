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
@property (strong,nonatomic)WebViewJavascriptBridge *javascriptBridge;
@end

@implementation JsBridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wbView.delegate = self;
    
    [WebViewJavascriptBridge enableLogging];

    // Do any additional setup after loading the view from its nib.
    _javascriptBridge = [WebViewJavascriptBridge bridgeForWebView:self.wbView handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC received message from JS: %@", data);
        responseCallback(@"Response for message from ObjC");

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
