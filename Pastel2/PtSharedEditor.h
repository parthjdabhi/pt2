//
//  PtSharedEditor.h
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PtSharedEditor : NSObject

+ (PtSharedEditor*)instance;

+ (float)topBarHeight;
+ (float)bottomBarHeight;
+ (UIColor*)topBarColor;
+ (UIColor*)bottomBarColor;
+ (UIColor*)bgColor;

@end
