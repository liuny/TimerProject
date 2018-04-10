//
//  RootViewController.m
//  TimerProject
//
//  Created by liuny on 2018/4/10.
//  Copyright © 2018年 liuny. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    dispatch_source_t timer;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gcdTimer:(NSTimeInterval)interval repeat:(BOOL)repeat{
    dispatch_queue_t queue = dispatch_queue_create("timer", 0);
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        [self timerAction];
        if(!repeat){
            dispatch_cancel(timer);
        }
    });
    dispatch_resume(timer);
}

-(void)timerAction{
    NSLog(@"==timerAction==");
}

- (IBAction)otherTimerAction:(id)sender {
    [self gcdTimer:1.f repeat:YES];
}

@end
