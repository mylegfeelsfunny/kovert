//
//  DirectionView.m
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import "DirectionView.h"
#import <QuartzCore/QuartzCore.h>
#import "Globals.h"
#import "Buzzer.h"

@interface DirectionView () {
    @private
    UIImageView *_defaultView;
    CADisplayLink * _runloopConsilieri;
    DirectionViewType _type;
}

@end

@implementation DirectionView



- (id)initWithFrame:(CGRect)frame andType:(DirectionViewType)type {
    self = [super initWithFrame:frame];
    if (self) {
        
        _defaultView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_defaultView];
        
        _type = type;
        switch (_type) {
            case DirectionViewLeft:
                _defaultView.image = [UIImage imageNamed:@"DirectionViewLeft"];
                break;
            case DirectionViewStraight:
                _defaultView.image = [UIImage imageNamed:@"DirectionViewStraight"];
                break;
            case DirectionViewRight:
                _defaultView.image = [UIImage imageNamed:@"DirectionViewRight"];
                break;
            case DirectionViewArrived:
                _defaultView.image = [UIImage imageNamed:@"DirectionViewArrived"];
                break;
        }
        
        _runloopConsilieri = [CADisplayLink displayLinkWithTarget:self selector:@selector(checkPosition)];
        [_runloopConsilieri addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        
    }
    return self;
}

- (void)checkPosition {
    if (self.frame.origin.y > kMAXY) {
        _runloopConsilieri.paused = YES;
        [_runloopConsilieri invalidate];
        
        switch (_type) {
            case DirectionViewLeft:
                [[Buzzer current] buzzForLeft];
                break;
            case DirectionViewStraight:
                [[Buzzer current] buzzForStraight];
                break;
            case DirectionViewRight:
                [[Buzzer current] buzzForRight];
                break;
            case DirectionViewArrived:
                [[Buzzer current] buzzForArrived];
                break;
        }
    }
}

@end
