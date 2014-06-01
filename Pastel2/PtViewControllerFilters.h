//
//  PtViewControllerFilters.h
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PtFtViewNavigationBar.h"
#import "PtFtViewManagerFilters.h"
#import "PtFtViewManagerSliders.h"
#import "PtFtViewManagerNavigation.h"


@interface PtViewControllerFilters : UIViewController

@property (nonatomic, strong) PtFtViewManagerFilters* filtersManager;
@property (nonatomic, strong) PtFtViewManagerSliders* slidersManager;
@property (nonatomic, strong) PtFtViewManagerNavigation* navigationManager;
@property (nonatomic, strong) UIImageView* previewImageView;

@end
