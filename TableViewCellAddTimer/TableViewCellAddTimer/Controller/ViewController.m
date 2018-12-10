//
//  ViewController.m
//  TableViewCellAddTimer
//
//  Created by Mr.GCY on 2018/12/10.
//  Copyright © 2018 Mr.GCY. All rights reserved.
//

#import "ViewController.h"
#import "CYTimerViewModel.h"
#import "CYTimerCell.h"
static NSString * const identifierCYTimerCell = @"CYTimerCell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) CYTimerViewModel * viewModel;
@property (nonatomic, weak) IBOutlet UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     [self setupData];
     [self setupUI];
}
-(void)setupData{
     self.viewModel = [[CYTimerViewModel alloc] init];
     [self.viewModel startTimer];
}
-(void)setupUI{
     self.tableView.tableFooterView = [UIView new];
     self.tableView.rowHeight = 60;
     [self.tableView registerNib:[UINib nibWithNibName:identifierCYTimerCell bundle:nil] forCellReuseIdentifier:identifierCYTimerCell];
}
#pragma mark- UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return self.viewModel.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     CYTimerCell * cell = [tableView dequeueReusableCellWithIdentifier:identifierCYTimerCell];
     [cell bindViewModel:self.viewModel andIndexPath:indexPath];
     return cell;
}
- (IBAction)clickLoadData:(UIButton *)sender {
     NSArray * arr = @[@(180),@(5000),@(2000),@(1000),@(800),@(600)];
     for (NSNumber * num in arr) {
          CYTimeModel * model = [[CYTimeModel alloc] init];
          model.restTime = num.integerValue;
          [self.viewModel.dataArray addObject:model];
     }
     [self.tableView reloadData];
}
@end
