//
//  STScanSearchTableViewCell.h
//  my
//
//  Created by soso-mac on 2017/4/12.
//  Copyright © 2017年 soso-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STScanSearchTableViewCell;

@protocol STScanSearchTableViewCellDelegate <NSObject>

-(void)setLeftScanSearchTableViewCell:(STScanSearchTableViewCell *)cell;
-(void)setRightScanSearchTableViewCell:(STScanSearchTableViewCell *)cell;
@end

@interface STScanSearchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabA;
@property (weak, nonatomic) IBOutlet UILabel *nameLabB;
@property (assign, nonatomic)id<STScanSearchTableViewCellDelegate> delegate;
-(void)setdataAry:(NSArray *)dataAry btnAry:(NSMutableArray *)btnAry indexPath:(NSIndexPath *)indexPath;
@end
