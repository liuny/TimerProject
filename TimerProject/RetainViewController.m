//
//  RetainViewController.m
//  TimerProject
//
//  Created by liuny on 2018/4/10.
//  Copyright © 2018年 liuny. All rights reserved.
//

#import "RetainViewController.h"
#import "NSTimer+LTimer.h"

@interface RetainViewController ()
@property(nonatomic, strong)NSTimer *timer;
@end

@implementation RetainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self regularTimer];
//    [self planOne];
    [self planTwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [self invalidateTimer];
    NSLog(@"我被销毁了");
}

-(void)invalidateTimer{
    [_timer invalidate];
    _timer = nil;
}

-(void)regularTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    _timer = nil;
}

-(void)regularTimerTwo{
    _timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    //iOS10之后，系统提供了初始方法，可以避免循环引用
    /*
    __weak typeof(self)weakSelf = self;
    _timer = [NSTimer timerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf timerAction];
    }];
     */
}

-(void)planOne{
    __weak typeof(self)weakself = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:weakself selector:@selector(timerAction) userInfo:nil repeats:YES];
}

-(void)planTwo{
    __weak typeof(self)weakSelf = self;
    _timer = [NSTimer timerWithTimerInterval:1.f block:^{
        [weakSelf timerAction];
    } repeate:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

-(void)timerAction{
    NSLog(@"===timerAction!===");
}


@end
