//
//  WBViewController.m
//  111
//
//  Created by yangyue on 15/8/14.
//  Copyright (c) 2015年 com.yintai.iphone. All rights reserved.
//

#import "WBViewController.h"
#define SCREEN_WIDTH 	 [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
@interface WBViewController ()<UIWebViewDelegate>
{  UIWebView *wb ;}
@end

@implementation WBViewController



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveBtn:(id)sender {
    NSString *str = @"ajkdfsjaf";
    [wb stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"openAppMeans.openAppClick('%@')",str]];
//    [wb stringByEvaluatingJavaScriptFromString:@"openAppMeans.openAppClick()"];
    
}
- (IBAction)backBtn:(id)sender {
    [wb stringByEvaluatingJavaScriptFromString:@"openAppMeans.openAppBack()"];//调用js方法
}
- (IBAction)goBackBtn:(id)sender {
    [wb goBack];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    wb = [[UIWebView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT-180)];
    wb.delegate =self;
    [wb loadRequest: [NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"a" withExtension:@"html"]]] ;
//    [wb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.yintai.com/Event/Baopinjie/Baopinjie.html?storeId=1234"]]];
  
    [self.view addSubview:wb];
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *requestString = [[request URL] absoluteString];
       requestString = [requestString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"]) {
        if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"])
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Alert from Cocoa Touch" message:[components objectAtIndex:2]
                                  delegate:self cancelButtonTitle:nil
                                  otherButtonTitles:@"OK", nil];
            [alert show];
        }
        return NO;
    }
    return YES;
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
