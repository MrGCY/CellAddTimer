//
//  CYTimerCell.m
//  TableViewCellAddTimer
//
//  Created by Mr.GCY on 2018/12/10.
//  Copyright © 2018 Mr.GCY. All rights reserved.
//

#import "CYTimerCell.h"
#import "CYTimerViewModel.h"
@interface CYTimerCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) CYTimerViewModel * viewModel;
@property (nonatomic, strong) NSIndexPath * indexPath;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation CYTimerCell

- (void)awakeFromNib {
    [super awakeFromNib];
     self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)bindViewModel:(id)viewModel andIndexPath:(nonnull NSIndexPath *)indexPath{
     if ([viewModel isKindOfClass:[CYTimerViewModel class]]) {
          self.indexPath = indexPath;
          self.titleLabel.text = [NSString stringWithFormat:@"第%zd个",indexPath.row];
          if (self.viewModel) {
               //避免重复监听
               return;
          }
          self.viewModel = (CYTimerViewModel *)viewModel;
          @weakify(self);
          [RACObserve(self.viewModel, countDown) subscribeNext:^(id  _Nullable x) {
               @strongify(self);
               CYTimeModel * model = self.viewModel.dataArray[self.indexPath.row];
               self.timeLabel.text = [self transformTime:model.restTime];
          }];
     }
}
-(NSString *)transformTime:(NSInteger)count{
     NSInteger hour = count / 3600;
     NSInteger min = (count - hour * 3600) / 60;
     NSInteger sec = count - hour * 3600 - min * 60;
     NSString * time = [NSString stringWithFormat:@"%.2zd:%.2zd:%.2zd",hour,min,sec];
     return time;
}
@end
