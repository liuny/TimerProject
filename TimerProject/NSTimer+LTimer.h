//
//  NSTimer+LTimer.h
//  TimerProject
//
//  Created by liuny on 2018/4/10.
//  Copyright © 2018年 liuny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (LTimer)
+(instancetype)timerWithTimerInterval:(NSTimeInterval)interval block:(void(^)(void))block repeate:(BOOL)repeat;
@end
