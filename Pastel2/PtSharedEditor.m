//
//  PtSharedEditor.m
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtSharedEditor.h"

@implementation PtSharedEditor

static PtSharedEditor* sharedPtSharedEditor = nil;

+ (PtSharedEditor*)instance {
	@synchronized(self) {
		if (sharedPtSharedEditor == nil) {
			sharedPtSharedEditor = [[self alloc] init];
		}
	}
	return sharedPtSharedEditor;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedPtSharedEditor == nil) {
			sharedPtSharedEditor = [super allocWithZone:zone];
			return sharedPtSharedEditor;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone*)zone {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark settings

+ (float)topBarHeight
{
    if ([UIDevice isiPad]) {
        return 60.0f;
    }
    return [UIScreen width] / 5.0f;
}

+ (float)bottomBarHeight
{
    return [self topBarHeight];
}

+ (UIColor *)topBarColor
{
    return [UIColor colorWithWhite:0.14f alpha:1.0f];
}

+ (UIColor *)bottomBarColor
{
    return [self topBarColor];
}

+ (UIColor *)bgColor
{
    return [UIColor colorWithWhite:0.08f alpha:1.0f];
}

@end
