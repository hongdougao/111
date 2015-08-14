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
    [wb stringByEvaluatingJavaScriptFromString:@"openAppMeans.openAppBack()"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    wb = [[UIWebView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT-180)];
    [wb loadRequest: [NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"a" withExtension:@"html"]]] ;
    [self.view addSubview:wb];
    
    
    
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
