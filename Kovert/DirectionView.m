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

+ (CGFloat)height{
    return 56.f;
}

- (id)initWithFrame:(CGRect)frame andType:(DirectionViewType)type {
    self = [super initWithFrame:frame];
    if (self) {
        
        _defaultView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [DirectionView height], [DirectionView height])];
        [self addSubview:_defaultView];
        
        _type = type;
        NSInteger height = 16;
        NSMutableArray *indicators = [[NSMutableArray alloc] init];
        NSInteger numIndicators = 0;
        for (int i = 0; i < 4; i++) {
            UIImageView *indicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beat-indicator.png"]];
            NSInteger y = ((i * height) + (i * 4) + height);
            indicator.frame = CGRectMake([DirectionView height]+ 10, ([DirectionView height] * .5) - y, 22, 16);
            indicator.alpha = .15;
            [indicators addObject:indicator];
            [self addSubview:indicator];
        }
        switch (_type) {
            case DirectionViewLeft:
                _defaultView.image = [UIImage imageNamed:@"left"];
                numIndicators = 1;
                break;
            case DirectionViewStraight:
                _defaultView.image = [UIImage imageNamed:@"forward"];
                numIndicators = 2;
                break;
            case DirectionViewRight:
                _defaultView.image = [UIImage imageNamed:@"right"];
                numIndicators = 3;
                break;
            case DirectionViewArrived:
                _defaultView.image = [UIImage imageNamed:@"destination"];
                numIndicators = 4;
                break;
        }
        for (int i = 0; i < numIndicators; i++) {
            UIImageView *indicator = [indicators objectAtIndex:i];
            indicator.alpha = 1;
        }
//        _runloopConsilieri = [CADisplayLink displayLinkWithTarget:self selector:@selector(checkPosition)];
//        [_runloopConsilieri addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        
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

- (void)broadCast {
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

@end
