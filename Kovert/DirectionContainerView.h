//
//  DirectionContainerView.h
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectionContainerView : UIView

- (id)initWithFrame:(CGRect)frame andArray:(NSArray *)array;
- (void)increment;
+ (UIImageView *)buffer:(NSInteger)y;

@end
