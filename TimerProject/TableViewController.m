//
//  TableViewController.m
//  TimerProject
//
//  Created by liuny on 2018/4/10.
//  Copyright © 2018年 liuny. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property(nonatomic, strong)NSTimer *timer;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self regularTimerTwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)regularTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

-(void)regularTimerTwo{
    _timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    //NSRunLoopCommonModes包含UITrackingRunLoopMode和NSDefaultRunLoopMode
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

-(void)timerAction{
    NSLog(@"===timerAction!===");
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //runloop它同一时刻只能在一个mode下运行，其他mode上的任务暂停。
    NSLog(@"runloop mode:%@",[NSRunLoop currentRunLoop].currentMode);
}

@end
