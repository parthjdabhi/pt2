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
    
    [self layoutButtons];
    
}

#pragma mark button layout

- (void)layoutButtons
{
    [self layoutColorButtons];
    [self layoutOverlayButtons];
    [self layoutArtisticButtons];
}

- (void)layoutOverlayButtons
{
    
    PtFtObjectFilterItem* item;
    CGSize size = [PtConfigFilters colorLayerButtonSize];
    
    _overlayButtonsDictionary = [NSMutableDictionary dictionary];
    NSMutableArray* items = [PtFtSharedFilterManager instance].overlayFilters;
    for (int i = 0; i < items.count; i++) {
        item = (PtFtObjectFilterItem*)[items objectAtIndex:i];
        if (item) {
            PtFtButtonLayerBar* button = [[PtFtButtonLayerBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
            button.maskColor = _colorBar.backgroundColor;
            button.previewColor = item.previewColor;
            button.title = item.name;
            button.maskRadius = [PtConfigFilters colorLayerButtonMaskRadius];
            button.delegate = self;
            button.titleColor = [PtConfigFilters artisticBarBgColor];
            button.selectionColor = item.selectionColor;
            button.group = item.effectGroup;
            button.effectId = item.effectId;
            [_overlayBar appendLayerButton:button];
            [_overlayButtonsDictionary setObject:button forKey:[NSString stringWithFormat:@"%d", (int)item.effectId]];
        }
    }

}

- (void)layoutColorButtons
{
    
    PtFtObjectFilterItem* item;
    CGSize size = [PtConfigFilters colorLayerButtonSize];
    
    _colorButtonsDictionary = [NSMutableDictionary dictionary];
    NSMutableArray* items = [PtFtSharedFilterManager instance].colorFilters;
    for (int i = 0; i < items.count; i++) {
        item = (PtFtObjectFilterItem*)[items objectAtIndex:i];
        if (item) {
            PtFtButtonLayerBar* button = [[PtFtButtonLayerBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
            button.maskColor = _colorBar.backgroundColor;
            button.previewColor = item.previewColor;
            button.title = item.name;
            button.maskRadius = [PtConfigFilters colorLayerButtonMaskRadius];
            button.delegate = self;
            button.titleColor = [PtConfigFilters artisticBarBgColor];
            button.selectionColor = item.selectionColor;
            button.group = item.effectGroup;
            button.effectId = item.effectId;
            [_colorBar appendLayerButton:button];
            [_colorButtonsDictionary setObject:button forKey:[NSString stringWithFormat:@"%d", (int)item.effectId]];
        }
    }
    
}

- (void)layoutArtisticButtons
{
    
}

#pragma mark delegate
#pragma mark layer button delegate

- (void)didLayerBarButtonTouchUpInside:(PtFtButtonLayerBar*)button
{
    
}


@end
