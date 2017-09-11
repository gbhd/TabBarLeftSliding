//
//  STScanSearchViewController.m
//  my
//
//  Created by soso-mac on 2017/4/7.
//  Copyright © 2017年 soso-mac. All rights reserved.
//

#import "STScanSearchViewController.h"
#import "STScanSearchTableViewCell.h"

#define btnTag 1000

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface STScanSearchViewController ()<UITableViewDelegate,UITableViewDataSource,STScanSearchTableViewCellDelegate>
@property(strong,nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *dataAry;
@property (strong, nonatomic)NSMutableArray *btnAry;
@property (strong, nonatomic)NSArray *btnTitleAry;
@property (assign, nonatomic)NSIndexPath *mIndexPath;
@end

@implementation STScanSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _dataAry = @[@"上课绝代风华尽快释放回家肯定是疯",@"德基法国货到付款就更好的风格和地方即可看见时代就开始奋斗精神可好",@"德基法国货到付款就更好的风格和地方即可",@"上课绝代风华尽快释放回家肯定是疯",@"狂的计划公开的风格和肯",@"德基法国货到付款就更好的风格和地方即可看见时代就开始奋斗精神可好",@"上课绝代风华尽快释放回家肯定是疯",@"狂的计划公开的风格和肯",@"德基法国货到付款就更好的风格和地方即可看见时代就开始奋斗精神可好",@"上课绝代风华尽快释放回家肯定是疯",@"狂的计划公开的风格和肯",@"德基法国货到付款就更好的风格和地方即可",@"上课绝代风华尽快释放回家肯定是疯",@"狂的计划公开的风格和肯",@"德基法国货到付款就更好的风格和地方即可",@"上课绝代风华尽快释放回家肯定是疯",@"狂的计划公开的风格和肯",@"德基法国货到付款就更好的风格和地方即可",@"上课绝代风华尽快释放回家肯定是疯",@"狂的计划公开的风格和肯",@"德基法国货到付款就更好的风格和地方即可看见时代就开始奋斗精神可好"];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64 - 49)style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.estimatedRowHeight = 400;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    
    _btnAry = [NSMutableArray new];
    
    _btnTitleAry = @[@"删除",@"淘汰"];
    
    for (int i = 0; i < _btnTitleAry.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.tag = btnTag + i;
        switch (i) {
            case 0:
                btn.backgroundColor = [UIColor greenColor];
                break;
            case 1:
                btn.backgroundColor = [UIColor redColor];
                break;
            default:
                break;
        }
        
        btn.frame = CGRectMake(kScreenWidth - i*100, 0,0, 100);
        [btn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle: _btnTitleAry[i] forState:UIControlStateNormal];
        [btn setTintColor:[UIColor whiteColor]];
        [_btnAry addObject:btn];
    }
    
}

#pragma mark-- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataAry.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"cellName";
    STScanSearchTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"STScanSearchTableViewCell" owner:self options:nil]lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.delegate = self;
    }
    [cell setdataAry:_dataAry btnAry:_btnAry indexPath:indexPath];
    return cell;
}
-(void)setLeftScanSearchTableViewCell:(STScanSearchTableViewCell *)cell{
    
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    
    CGRect rect = [_tableView rectForRowAtIndexPath:indexPath];
    for (int i = 0;i < _btnAry.count; i++) {
        UIButton *btn = _btnAry[i];
        for (UIView *view in _tableView.subviews) {
            if ([view isEqual:btn]) {
                
                [view removeFromSuperview];
            }
        }
        [_tableView addSubview:btn];
        
        btn.frame = CGRectMake(kScreenWidth - 100 * (i + 1), rect.origin.y, 100, cell.frame.size.height);
    
        if (indexPath.row != _mIndexPath.row) {
            STScanSearchTableViewCell *oldCell = [_tableView cellForRowAtIndexPath:_mIndexPath];
            
            [UIView animateWithDuration:.2 animations:^{
                oldCell.contentView.frame = CGRectMake(0, 0, kScreenWidth, oldCell.frame.size.height);
            }];
        }
    }
    _mIndexPath = indexPath;
}
-(void)setRightScanSearchTableViewCell:(STScanSearchTableViewCell *)cell{
    
    for (int i = 0;i < _btnAry.count; i++) {
        UIButton *btn = _btnAry[i];
        for (UIView *view in _tableView.subviews) {
            if ([view isEqual:btn]) {
                
                [view removeFromSuperview];
            }
        }
    }
}
-(void)selectBtn:(UIButton *)btn{
    
    for (int i = 0;i < _btnAry.count; i++) {
        UIButton *btn = _btnAry[i];
        for (UIView *view in _tableView.subviews) {
            if ([view isEqual:btn]) {
                
                [view removeFromSuperview];
            }
        }
    }
    
    STScanSearchTableViewCell *cell = [_tableView cellForRowAtIndexPath:_mIndexPath];
    
    [UIView animateWithDuration:.2 animations:^{
        cell.contentView.frame = CGRectMake(0, 0, kScreenWidth, cell.frame.size.height);
    }];
    
    NSLog(@"_mIndexPath == %zi",_mIndexPath.row);
    
    
    switch (btn.tag - btnTag) {
        case 0:
            NSLog(@"btn.tag == %zi",btn.tag);
            break;
        case 1:
            NSLog(@"btn.tag == %zi",btn.tag);
            break;
            
        default:
            break;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    for (int i = 0;i < _btnAry.count; i++) {
        UIButton *btn = _btnAry[i];
        for (UIView *view in _tableView.subviews) {
            if ([view isEqual:btn]) {
                
                [view removeFromSuperview];
            }
        }
    }
    
    STScanSearchTableViewCell *cell = [_tableView cellForRowAtIndexPath:_mIndexPath];
    
    [UIView animateWithDuration:.2 animations:^{
        cell.contentView.frame = CGRectMake(0, 0, kScreenWidth, cell.frame.size.height);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

@end
