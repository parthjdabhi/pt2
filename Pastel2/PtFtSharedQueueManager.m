//
//  PtFtSharedQueueManager.m
//  Pastel2
//
//  Created by SSC on 2014/05/31.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtFtSharedQueueManager.h"

@implementation PtFtSharedQueueManager

static PtFtSharedQueueManager* sharedPtFtSharedQueueManager = nil;

+ (PtFtSharedQueueManager*)instance {
	@synchronized(self) {
		if (sharedPtFtSharedQueueManager == nil) {
			sharedPtFtSharedQueueManager = [[self alloc] init];
		}
	}
	return sharedPtFtSharedQueueManager;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedPtFtSharedQueueManager == nil) {
			sharedPtFtSharedQueueManager = [super allocWithZone:zone];
			return sharedPtFtSharedQueueManager;
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


- (BOOL)canceled
{
    if (_canceled) {
        LOG(@"CANCELED!!!!");
    }
    return _canceled;
}


@end
