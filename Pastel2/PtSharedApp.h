//
//  PtSharedApp.h
//  Pastel2
//
//  Created by SSC on 2014/05/27.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PtSharedApp : NSObject

+ (PtSharedApp*)instance;


+ (BOOL)didUnlockExtraEffects;
+ (void)unlockExtraEffects;

@end
