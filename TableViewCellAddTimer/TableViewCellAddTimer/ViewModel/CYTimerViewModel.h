//
//  CYTimerViewModel.h
//  TableViewCellAddTimer
//
//  Created by Mr.GCY on 2018/12/10.
//  Copyright © 2018 Mr.GCY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYTimeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CYTimerViewModel : NSObject
@property (nonatomic, strong) NSMutableArray * dataArray;
//计数器
@property (nonatomic, assign,readonly) NSInteger  countDown;
-(void)modifyRestTime:(NSInteger)restTime andIndexPath:(NSIndexPath *)indexPath;
//开启定时器
-(void)startTimer;
//停止定时器
-(void)stopTimer;
@end

NS_ASSUME_NONNULL_END
