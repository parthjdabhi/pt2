//
//  PtSharedApp.m
//  Pastel2
//
//  Created by SSC on 2014/05/27.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtSharedApp.h"

@implementation PtSharedApp

static PtSharedApp* sharedPtSharedApp = nil;

+ (PtSharedApp*)instance {
	@synchronized(self) {
		if (sharedPtSharedApp == nil) {
			sharedPtSharedApp = [[self alloc] init];
		}
	}
	return sharedPtSharedApp;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedPtSharedApp == nil) {
			sharedPtSharedApp = [super allocWithZone:zone];
			return sharedPtSharedApp;
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

#pragma mark lock

+ (BOOL)didUnlockExtraEffects
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    BOOL f = [ud boolForKey:@"unlocked"];
    if (f == YES) {
        return YES;
    }
    return NO;
}

+ (void)unlockExtraEffects
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:@"unlocked"];
    [ud synchronize];
    
}



@end
