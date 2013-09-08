//
//  Buzzer.m
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import "Buzzer.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Buzzer () {
    @private
    NSTimer *_timer;
    NSInteger _maxTime;
    NSInteger _currentTime;
}

@end


@implementation Buzzer


+ (Buzzer *)current {
    static Buzzer *current = nil;
    if (current == nil) {
        current = [[super allocWithZone:nil] init];
    }
    return current;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self current];
}

- (id)init {
    if (self = [super init]) {
        _maxTime = 0;
        _currentTime = 0;

    }
    return self;
}

- (void)buzzWithIncrement {
    _timer = [NSTimer scheduledTimerWithTimeInterval:.8 target:self selector:@selector(buzz) userInfo:nil repeats:YES];
}

- (void)buzz {
    _currentTime++;
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    if (_currentTime  == _maxTime) {
        [_timer invalidate];
        _timer = nil;
        _currentTime = 0;
    }
}


- (void)buzzForRight {
    _maxTime = 3;
    [self buzzWithIncrement];
}

- (void)buzzForArrived {
    _maxTime = 10;
    [self buzzWithIncrement];
}

- (void)buzzForLeft {
    _maxTime = 1;
    [self buzzWithIncrement];
}

- (void)buzzForStraight {
    _maxTime = 2;
    [self buzzWithIncrement];
}

- (void)kill {
    [_timer invalidate];
    _timer = nil;
}

@end
