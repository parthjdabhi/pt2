//
//  PtFtSharedFilterManager.h
//  Pastel2
//
//  Created by SSC on 2014/05/31.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PtFtObjectProcessQueue.h"
#import "PtFtObjectFilterItem.h"

#import "VnEffectColorBronze.h"
#import "VnEffectColorLittleBlueSecret.h"
#import "VnEffectColorPurrr.h"
#import "VnEffectColorBronze.h"
#import "VnEffectColorOphelia.h"
#import "VnEffectColorPotion9.h"
#import "VnEffectColorPinkMilk.h"
#import "VnEffectColorPurePeach.h"
#import "VnEffectColorRosyVintage.h"
#import "VnEffectColorSerenity.h"
#import "VnEffectColorSummerSkin.h"
#import "VnEffectColorSunnyLight.h"
#import "VnEffectColorUrbanCandy.h"
#import "VnEffectColorWarmHaze.h"
#import "VnEffectColorWildHoney.h"

#import "VnEffectOverlayBlueHaze.h"
#import "VnEffectOverlayHazyLightWarmPink.h"
#import "VnEffectOverlayHazyLightWarmPink2.h"
#import "VnEffectOverlayLightBrightHaze.h"

@interface PtFtSharedFilterManager : NSObject

@property (nonatomic, strong) NSMutableArray* artisticFilters;
@property (nonatomic, strong) NSMutableArray* overlayFilters;
@property (nonatomic, strong) NSMutableArray* colorFilters;

+ (PtFtSharedFilterManager*)instance;
+ (UIImage*)applyEffect:(VnEffectId)effect ToImage:(UIImage*)image;
+ (NSMutableArray*)availableEffectQueues;

- (void)commonInit;
- (void)initColorFilters;
- (void)initOverlayFilters;
- (void)initArtisticFilters;

@end
