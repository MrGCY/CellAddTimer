//
//  CYTimeModel.h
//  TableViewCellAddTimer
//
//  Created by Mr.GCY on 2018/12/10.
//  Copyright © 2018 Mr.GCY. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CYTimeModel : JSONModel
//剩余时间
@property (nonatomic, assign) NSInteger  restTime;
@end

NS_ASSUME_NONNULL_END
