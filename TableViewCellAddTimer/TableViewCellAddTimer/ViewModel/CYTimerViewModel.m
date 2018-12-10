//
//  CYTimerViewModel.m
//  TableViewCellAddTimer
//
//  Created by Mr.GCY on 2018/12/10.
//  Copyright © 2018 Mr.GCY. All rights reserved.
//

#import "CYTimerViewModel.h"
@interface CYTimerViewModel()
@property (nonatomic, strong) NSTimer * timer;
//计数器
@property (nonatomic, assign,readwrite) NSInteger  countDown;
@end
@implementation CYTimerViewModel
-(instancetype)init{
     if (self = [super init]) {
          [self setupData];
     }
     return self;
}
-(void)setupData{
     self.countDown = 0;
     NSArray * arr = @[@(180),@(5000),@(2000),@(800),@(1500),@(500),@(300)];
     self.dataArray = [NSMutableArray arrayWithCapacity:arr.count];
     self.dataArray = [NSMutableArray arrayWithCapacity:0];
     for (NSNumber * num in arr) {
          CYTimeModel * model = [[CYTimeModel alloc] init];
          model.restTime = num.integerValue;
          [self.dataArray addObject:model];
     }
}
-(void)modifyRestTime:(NSInteger)restTime andIndexPath:(NSIndexPath *)indexPath{
     if (self.dataArray.count > 0 && indexPath.row < self.dataArray.count) {
          CYTimeModel * model = self.dataArray[indexPath.row];
          model.restTime = restTime;
     }
}
#pragma mark- 计时器相关
//开启定时器
-(void)startTimer{
     if (!self.timer) {
          self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                        target:self
                                                      selector:@selector(timerLoop)
                                                      userInfo:nil
                                                       repeats:YES];
          [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
     }
}
//停止定时器
-(void)stopTimer{
     if (self.timer) {
          [self.timer invalidate];
          self.timer = nil;
     }
}
//计时
-(void)timerLoop{
     //这样处理不管有没有展示到，时间也会做倒计时处理
     for (CYTimeModel * model in self.dataArray) {
          model.restTime -= 1;
     }
     self.countDown +=1;
}
@end
