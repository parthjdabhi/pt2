//
//  PtConfigFIlters.m
//  Pastel2
//
//  Created by SSC on 2014/06/01.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtConfigFilters.h"

@implementation PtConfigFilters

#pragma mark sizes


+ (CGSize)toolBarButtonSize
{
    return CGSizeMake(54.0f, [self toolBarHeight]);
}

+ (CGSize)colorLayerButtonSize
{
    return CGSizeMake(54.0f, [self colorBarHeight]);
}

+ (CGSize)artisticLayerButtonSize
{
    return CGSizeMake(60.0f, [self artisticBarHeight]);
}

+ (CGSize)overlayLayerButtonSize
{
    return CGSizeMake(54.0f, [self overlayBarHeight]);
}

#pragma mark color


+ (UIColor *)toolBarBgColor
{
    return [PtConfigEditor bgColor];
}

+ (UIColor *)colorBarBgColor
{
    return [UIColor colorWithWhite:0.12f alpha:1.0f];
}

+ (UIColor *)artisticBarBgColor
{
    return [UIColor colorWithRed:s255(245.0f) green:s255(245.0f) blue:s255(245.0f) alpha:1.0f];
}

+ (UIColor *)overlayBarBgColor
{
    return [UIColor colorWithWhite:0.12f alpha:1.0f];
}

#pragma mark height

+ (float)toolBarHeight
{
    return 44.0f;
}

+ (float)colorBarHeight
{
    return 50.0f;
}


+ (float)artisticBarHeight
{
    return 70.0f;
}

+ (float)overlayBarHeight
{
    return 50.0f;
}

#pragma mark mask

+ (float)colorLayerButtonMaskRadius
{
    return 10.0f;
}

+ (float)effectLayerButtonMaskRadius
{
    return 20.0f;
}

+ (float)overlayLayerButtonMaskRadius
{
    return 10.0f;
}


@end
