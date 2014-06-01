//
//  PtViewControllerFilters.m
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtViewControllerFilters.h"

@interface PtViewControllerFilters ()

@end

@implementation PtViewControllerFilters

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [PtConfigEditor bgColor];
    
    //// Managers
    _filtersManager = [[PtFtViewManagerFilters alloc] init];
    _filtersManager.delegate = self;
    _filtersManager.view = self.view;
    _slidersManager = [[PtFtViewManagerSliders alloc] init];
    _slidersManager.delegate = self;
    _slidersManager.view = self.view;
    _navigationManager = [[PtFtViewManagerNavigation alloc] init];
    _navigationManager.delegate = self;
    _navigationManager.view = self.view;
    
    //// Preview
    float restHeight = self.view.height - [PtConfigFilters colorBarHeight] - [PtConfigFilters overlayBarHeight] - [PtConfigFilters artisticBarHeight] - [PtSharedApp bottomNavigationBarHeight];
    float w, h;
    UIImage* image = [PtSharedApp instance].imageToProcess;
    if (image.size.width > image.size.height) {
        w = self.view.width;
        h = image.size.height * w / image.size.width;
    }else{
        h = restHeight - 40.0f;
        w = image.size.width * h / image.size.height;
    }
    _previewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, w, h)];
    _previewImageView.center = CGPointMake(self.view.width / 2.0f, restHeight / 2.0f + 20.0f);
    _previewImageView.image = image;
    [self.view addSubview:_previewImageView];
    
    [_filtersManager viewDidLoad];
    [_slidersManager viewDidLoad];
    [_navigationManager viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
