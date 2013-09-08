//
//  DirectionView.h
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DirectionViewLeft,
    DirectionViewStraight,
    DirectionViewRight,
    DirectionViewArrived
} DirectionViewType;

@interface DirectionView : UIView

+ (CGFloat)height;

- (id)initWithFrame:(CGRect)frame andType:(DirectionViewType)type;
- (void)broadCast;

@end
