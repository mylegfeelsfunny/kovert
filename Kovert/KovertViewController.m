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
#import <QuartzCore/QuartzCore.h>

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
    
    DirectionContainerView *dc = [[DirectionContainerView alloc] initWithFrame:CGRectMake(180, 0, 0, [DirectionView height])
                                                                      andArray:indicatorArray];
    [self.view addSubview:dc];
    
    CALayer *blackTop                           = [CALayer layer];
    blackTop.backgroundColor                    = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:.8f].CGColor;
    blackTop.frame                              = CGRectMake(0, self.view.frame.size.height - 160, 320, 160);
    [self.view.layer addSublayer:blackTop];
    
    CALayer *whiteLine                           = [CALayer layer];
    whiteLine.backgroundColor                    = [UIColor whiteColor].CGColor;
    whiteLine.frame                              = CGRectMake(0, blackTop.frame.origin.y, 320, 1);
    [self.view.layer addSublayer:whiteLine];
    
    UIImageView *youCarrot = [[UIImageView alloc] initWithFrame:CGRectMake(28, blackTop.frame.origin.y - 37, 45, 37)];
    youCarrot.image = [UIImage imageNamed:@"you"];
    [self.view addSubview:youCarrot];
    
    UIImageView *destination = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 162, 140)];
    destination.image = [UIImage imageNamed:@"destination_words"];
    [self.view addSubview:destination];
    
    UIButton *cancelButton                                               = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame                                                  = CGRectMake(320 - 40, 0, 40, 40);
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(popViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];

    [dc increment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
