//
//  STScanSearchTableViewCell.m
//  my
//
//  Created by soso-mac on 2017/4/12.
//  Copyright © 2017年 soso-mac. All rights reserved.
//

#import "STScanSearchTableViewCell.h"


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface STScanSearchTableViewCell ()
@property(strong,nonatomic)NSMutableArray *btnAry;
@end

@implementation STScanSearchTableViewCell
-(void)setdataAry:(NSArray *)dataAry btnAry:(NSMutableArray *)btnAry indexPath:(NSIndexPath *)indexPath{
    _nameLabA.text = dataAry[indexPath.row];
    _nameLabB.text = dataAry[dataAry.count - indexPath.row - 1];
    
    _btnAry = btnAry;
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self                                                                                    action:@selector(handleSwipe:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:recognizer];
    
    
    
    UISwipeGestureRecognizer *Right = [[UISwipeGestureRecognizer alloc] initWithTarget:self                                                                                    action:@selector(handleSwipeRight:)];
    Right.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:Right];

}
-(void)handleSwipe:(UITapGestureRecognizer *)tgs{
    
    STScanSearchTableViewCell *cell = (STScanSearchTableViewCell *)tgs.view;
    
    CGFloat width = _btnAry.count * 100;
    
    [UIView animateWithDuration:.2 animations:^{
      self.contentView.frame = CGRectMake(-width , 0, kScreenWidth, self.frame.size.height);
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(setLeftScanSearchTableViewCell:)]) {
        [_delegate setLeftScanSearchTableViewCell:cell];
    }
}

-(void)handleSwipeRight:(UITapGestureRecognizer *)tgs{
    
     STScanSearchTableViewCell *cell = (STScanSearchTableViewCell *)tgs.view;
    
    [UIView animateWithDuration:.2 animations:^{
        self.contentView.frame = CGRectMake(0, 0, kScreenWidth, self.frame.size.height);
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(setRightScanSearchTableViewCell:)]) {
        [_delegate setRightScanSearchTableViewCell:cell];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
