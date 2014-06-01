//
//  PtFtViewManagerFilters.m
//  Pastel2
//
//  Created by SSC on 2014/06/01.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtFtViewManagerFilters.h"
#import "PtViewControllerFilters.h"

@implementation PtFtViewManagerFilters

- (void)viewDidLoad
{
    
    //// Wrapper
    _barWrapper = [[PtFtViewBarWrapper alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.width, [PtConfigFilters overlayBarHeight] + [PtConfigFilters artisticBarHeight] + [PtConfigFilters colorBarHeight])];
    [_barWrapper setY:self.view.height - _barWrapper.height - [PtSharedApp bottomNavigationBarHeight]];
    [self.view addSubview:_barWrapper];
    
    /// Bar
    _overlayBar = [[PtFtViewLayerBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.width, [PtConfigFilters overlayBarHeight])];
    _overlayBar.backgroundColor = [PtConfigFilters overlayBarBgColor];
    [_barWrapper addOverlayBar:_overlayBar];
    _artisticBar = [[PtFtViewLayerBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.width, [PtConfigFilters artisticBarHeight])];
    _artisticBar.backgroundColor = [PtConfigFilters artisticBarBgColor];
    [_barWrapper addArtisticBar:_artisticBar];
    _colorBar = [[PtFtViewLayerBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.width, [PtConfigFilters colorBarHeight])];
    _colorBar.backgroundColor = [PtConfigFilters colorBarBgColor];
    [_barWrapper addColorBar:_colorBar];
    
    
    
}
@end
