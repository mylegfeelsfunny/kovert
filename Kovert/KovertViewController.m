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

@interface KovertViewController () {

}

@end

@implementation KovertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
   
    //[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(buzz) userInfo:nil repeats:YES];
    //[[Buzzer current] buzzForRight];
    
    DirectionView *directionView;
    for (int i = 0; i < 3; i++) {
        directionView = [[DirectionView alloc] initWithFrame:CGRectMake(0, i * 70 + (i * 100), 70, 70) andType:i];
        [self.view addSubview:directionView];
        directionView.backgroundColor = [UIColor whiteColor];
    }
    
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
