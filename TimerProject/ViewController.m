//
//  ViewController.m
//  TimerProject
//
//  Created by liuny on 2018/4/10.
//  Copyright © 2018年 liuny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

-(void)timerAction{
    NSLog(@"===timerAction!===");
}

-(void)invalidateTimer{
    [_timer invalidate];
    _timer = nil;
}

-(void)fireTiemr{
    [_timer fire];
}

-(void)threadTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    //子线程上调用invalidate
    [self performSelector:@selector(invalidateTimer) withObject:nil afterDelay:3.f];
    //runloop在子线程上 是需要你手动打开的
    [[NSRunLoop currentRunLoop] run];
    //如果在主线程上调用invalidate，下面的打印语句不会打印
    NSLog(@"==runloop exit==");
}

-(void)busyCalculate{
    NSUInteger count = 0xFFFFFFF;
    CGFloat num = 0.0;
    for(int i=0;i<count;i++){
        num = i/count;
    }
}

- (IBAction)timerOneAction:(id)sender {
    [self regularTimer];
}

- (IBAction)timerTwoAction:(id)sender {
    [self regularTimerTwo];
}

- (IBAction)invalidateAction:(id)sender {
    [self invalidateTimer];
}
- (IBAction)fireAction:(id)sender {
    [self fireTiemr];
}
- (IBAction)threadTimerAction:(id)sender {
    [NSThread detachNewThreadSelector:@selector(threadTimer) toTarget:self withObject:nil];
}

- (IBAction)busyAction:(id)sender {
    [self regularTimer];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self busyCalculate];
    });
}


@end
