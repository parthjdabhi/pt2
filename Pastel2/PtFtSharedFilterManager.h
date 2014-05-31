//
//  PtFtSharedFilterManager.h
//  Pastel2
//
//  Created by SSC on 2014/05/31.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PtFtProcessQueue.h"
#import "PtFtObjectFilterItem.h"

@interface PtFtSharedFilterManager : NSObject
{
    NSMutableArray* _artisticFilters;
    NSMutableArray* _overlayFilters;
    NSMutableArray* _colorFilters;
}

+ (PtFtSharedFilterManager*)instance;
+ (UIImage*)applyEffect:(VnEffectId)effect ToImage:(UIImage*)image;
+ (NSMutableArray*)availableEffectQueues;

- (void)commonInit;
- (void)initColorFilters;
- (void)initOverlayFilters;
- (void)initArtisticFilters;

@end
