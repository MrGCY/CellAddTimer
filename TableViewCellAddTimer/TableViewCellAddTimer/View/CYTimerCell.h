//
//  CYTimerCell.h
//  TableViewCellAddTimer
//
//  Created by Mr.GCY on 2018/12/10.
//  Copyright © 2018 Mr.GCY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CYTimerCell : UITableViewCell
-(void)bindViewModel:(id)viewModel andIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
