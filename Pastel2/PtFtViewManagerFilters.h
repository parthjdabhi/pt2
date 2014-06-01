//
//  PtFtViewManagerFilters.h
//  Pastel2
//
//  Created by SSC on 2014/06/01.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PtFtViewBarWrapper.h"
#import "PtFtViewLayerBar.h"

@class PtViewControllerFilters;

@interface PtFtViewManagerFilters : NSObject

@property (nonatomic, weak) UIView* view;
@property (nonatomic, weak) PtViewControllerFilters* delegate;
@property (nonatomic, strong) PtFtViewBarWrapper* barWrapper;
@property (nonatomic, strong) PtFtViewLayerBar* overlayBar;
@property (nonatomic, strong) PtFtViewLayerBar* artisticBar;
@property (nonatomic, strong) PtFtViewLayerBar* colorBar;

- (void)viewDidLoad;

@end
