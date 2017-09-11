//
//  STMyViewController.m
//  my
//
//  Created by soso-mac on 2017/2/28.
//  Copyright © 2017年 soso-mac. All rights reserved.
//

#import "STMyViewController.h"



#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface STMyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSArray *dataAry;

@end

@implementation STMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
