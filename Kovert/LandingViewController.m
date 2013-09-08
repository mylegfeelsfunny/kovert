//
//  LandingViewController.m
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import "LandingViewController.h"
#import "KovertViewController.h"
#import "Buzzer.h"

@interface LandingViewController () {
    @private
    UIButton *_imageOneButton;
    UIButton *_imageTwoButton;
}

@end

@implementation LandingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _imageOneButton                                                   = [UIButton buttonWithType:UIButtonTypeCustom];
    _imageOneButton.frame                                             = CGRectMake(0,0,320,568);
    [_imageOneButton setImage:[UIImage imageNamed:@"map-1"] forState:UIControlStateNormal];
    [_imageOneButton setImage:[UIImage imageNamed:@"map-1"] forState:UIControlStateHighlighted];
    [_imageOneButton setImage:[UIImage imageNamed:@"map-1"] forState:UIControlStateSelected];
    [_imageOneButton addTarget:self action:@selector(mapTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_imageOneButton];
    
    _imageTwoButton                                                   = [UIButton buttonWithType:UIButtonTypeCustom];
    _imageTwoButton.frame                                             = CGRectMake(0,0,320,568);
    [_imageTwoButton setImage:[UIImage imageNamed:@"map-2"] forState:UIControlStateNormal];
    [_imageTwoButton setImage:[UIImage imageNamed:@"map-2"] forState:UIControlStateHighlighted];
    [_imageTwoButton setImage:[UIImage imageNamed:@"map-2"] forState:UIControlStateSelected];
    [_imageTwoButton addTarget:self action:@selector(mapTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_imageTwoButton];
    
}

- (void)viewWillAppear:(BOOL)animated {
    _imageTwoButton.hidden = YES;
    _imageTwoButton.enabled = NO;

    [[Buzzer current] kill];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapTapped:(id)sender {
    if (_imageTwoButton.hidden) {
        _imageTwoButton.alpha = 0;
        _imageTwoButton.hidden = NO;
        _imageTwoButton.enabled = YES;

        [UIView animateWithDuration:.6
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             _imageTwoButton.alpha = 1;
                         }
                         completion:^(BOOL fin){
                         }];
    } else {
        KovertViewController *kovertViewController = [[KovertViewController alloc] init];
        [self.navigationController pushViewController:kovertViewController animated:YES];
    }
}

@end
