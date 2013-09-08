//
//  ViewController.m
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import "KovertViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Buzzer.h"
#import "DirectionView.h"
#import "DirectionContainerView.h"

@interface KovertViewController () {

}

@end

@implementation KovertViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *indicatorArray = [NSArray arrayWithObjects:
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       [NSNumber numberWithInt:DirectionViewArrived], @"type", nil]
                     
                      ,[NSDictionary dictionaryWithObjectsAndKeys:
                       [NSNumber numberWithInt:DirectionViewLeft], @"type", nil]

                      ,[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:DirectionViewStraight], @"type", nil]

                      ,[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:DirectionViewRight], @"type", nil]

                      ,[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:DirectionViewRight], @"type", nil]

                      ,[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:DirectionViewStraight], @"type", nil]

                      ,[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:DirectionViewLeft], @"type", nil]

                      ,[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:DirectionViewLeft], @"type", nil]

                      ,[NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithInt:DirectionViewStraight], @"type", nil]
                      
                      , nil];
    
    //[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(buzz) userInfo:nil repeats:YES];
    //[[Buzzer current] buzzForRight];
    DirectionContainerView *dc = [[DirectionContainerView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - [DirectionView height]) * .5, 0, 0, [DirectionView height])
                                                                      andArray:indicatorArray];
    [self.view addSubview:dc];
    
    [dc increment];
}

- (void)buzz {
    //[[Buzzer current] buzzForRight];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
