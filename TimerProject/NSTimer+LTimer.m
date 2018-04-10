//
//  NSTimer+LTimer.m
//  TimerProject
//
//  Created by liuny on 2018/4/10.
//  Copyright © 2018年 liuny. All rights reserved.
//

#import "NSTimer+LTimer.h"

@implementation NSTimer (LTimer)
+(instancetype)timerWithTimerInterval:(NSTimeInterval)interval block:(void(^)(void))block repeate:(BOOL)repeat{
    return [NSTimer timerWithTimeInterval:interval target:self selector:@selector(timerAction:) userInfo:block repeats:repeat];
}

+(void)timerAction:(NSTimer *)timer{
    void(^block)(void) = timer.userInfo;
    if(block){
        block();
    }
}
@end
