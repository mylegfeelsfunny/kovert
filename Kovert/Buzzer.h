//
//  Buzzer.h
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Buzzer : NSObject

+ (Buzzer *)current;

- (void)buzzForRight;
- (void)buzzForLeft;
- (void)buzzForStraight;
- (void)buzzForArrived;

@end
