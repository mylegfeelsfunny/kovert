//
//  DirectionContainerView.m
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import "DirectionContainerView.h"
#import "DirectionView.h"
@interface DirectionContainerView () {
    @private
    NSInteger _currentIndex;
    NSArray *_indicatorsArray;
    NSInteger _blockHeight;
}

@end

@implementation DirectionContainerView

+ (UIImageView *)buffer:(NSInteger)y {
    UIImageView *buffer = [[UIImageView alloc] initWithFrame:CGRectMake(([DirectionView height] - 5) * .5, y, 5, 125)];
    buffer.image = [UIImage imageNamed:@"path-line"];
    return buffer;
}

- (id)initWithFrame:(CGRect)frame andArray:(NSArray *)array {
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *indicatorsArray = [[NSMutableArray alloc] init];
        DirectionView *directionView;
        NSInteger y = 0;
        UIImageView *b;
        _currentIndex = 0;
        for (int i = 0; i < [array count]; i++) {
            NSDictionary *dict = [array objectAtIndex:i];
            directionView = [[DirectionView alloc] initWithFrame:CGRectMake(0, y, [DirectionView height], [DirectionView height])
                                                         andType:[[dict objectForKey:@"type"] intValue]];
            [self addSubview:directionView];
            y = directionView.frame.origin.y + directionView.frame.size.height + 10;
            b = [DirectionContainerView buffer:y];
            [self addSubview:b];
            y = b.frame.origin.y + b.frame.size.height + 10;
            [indicatorsArray addObject:directionView];
        }
        
        _indicatorsArray = [[indicatorsArray reverseObjectEnumerator] allObjects];
        
        _blockHeight = ([DirectionView height] + 10) + (b.frame.size.height + 10);
        
        self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width, 360-y);
    }
    return self;
}

- (void)increment {
    if (_currentIndex > [_indicatorsArray count]-1) {
        return;
    }
    
    [UIView animateWithDuration:6
                          delay:3.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.frame = CGRectMake(self.frame.origin.x,
                                                 self.frame.origin.y + _blockHeight,
                                                 self.frame.size.width,
                                                 self.frame.size.height);
                     }
                     completion:^(BOOL fin){
                         DirectionView *directionView = [_indicatorsArray objectAtIndex:_currentIndex];
                         [directionView broadCast];
                         _currentIndex++;
                         [self increment];
                     }];

}
@end
