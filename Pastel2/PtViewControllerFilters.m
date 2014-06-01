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
