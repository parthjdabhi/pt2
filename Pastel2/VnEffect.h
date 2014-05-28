//
//  VnEffect.h
//  Pastel2
//
//  Created by SSC on 2014/05/28.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImage.h"

@interface VnEffect : NSObject

@property (nonatomic, weak) UIImage* imageToProcess;
@property (nonatomic, assign) VnEffectId effectId;
@property (nonatomic, assign) CGFloat defaultOpacity;
@property (nonatomic, assign) CGFloat faceOpacity;
@property (nonatomic, strong) VnImageFilter* startFilter;
@property (nonatomic, strong) VnImageFilter* endFilter;

+ (UIImage*)processImage:(UIImage*)image WithStartFilter:(VnImageFilter*)startFilter EndFilter:(VnImageFilter*)endFilter;

- (void)makeFilterGroup;

@end
