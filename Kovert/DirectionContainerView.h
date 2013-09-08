//
//  DirectionContainerView.h
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectionContainerView : UIView

+ (UIImageView *)buffer:(NSInteger)y;

- (id)initWithFrame:(CGRect)frame andArray:(NSArray *)array;
- (void)increment;
- (void)kill;

@end
