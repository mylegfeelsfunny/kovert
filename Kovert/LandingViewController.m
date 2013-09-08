//
//  LandingViewController.m
//  Kovert
//
//  Created by Scott on 9/7/13.
//  Copyright (c) 2013 haicontrast. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController () {
    @private
    UIButton *_imageOneView;
    UIButton *_imageTwoView;
    UIButton *_imageThreeView;
}

@end

@implementation LandingViewController

- (id)init
{
    self = [super init];
    if (self) {
        
        _imageOneView                                                   = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageOneView.frame                                             = self.view.bounds;
        [_imageOneView setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        [_imageOneView addTarget:self action:@selector(mapTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_imageOneView];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapTapped:(id)sender {

}

@end
