//
//  DetailViewController.h
//  111
//
//  Created by yangyue on 15/7/14.
//  Copyright (c) 2015年 com.yintai.iphone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

