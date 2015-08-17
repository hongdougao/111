//
//  BaseViewController.m
//  111
//
//  Created by yangyue on 15/8/17.
//  Copyright (c) 2015年 com.yintai.iphone. All rights reserved.
//

#import "BaseViewController.h"
#import "WBViewController.h"
#import "JsBridgeViewController.h"
@interface BaseViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataSourceArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tb;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tb.dataSource =self;
    self.tb.delegate = self;
    dataSourceArr = @[@"native",@"js bridge"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = dataSourceArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        WBViewController *wb = [[WBViewController alloc]initWithNibName:@"WBViewController" bundle:nil];
        [self.navigationController pushViewController:wb animated:YES];
    }else if(indexPath.row == 1){
    
        JsBridgeViewController *js = [[JsBridgeViewController alloc]initWithNibName:@"JsBridgeViewController" bundle:nil];
        [self.navigationController pushViewController:js animated:YES];
    }
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
