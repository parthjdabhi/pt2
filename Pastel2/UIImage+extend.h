//
//  UIImage+extend.h
//  Vintage
//
//  Created by SSC on 2014/02/16.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <ImageIO/ImageIO.h>

@interface UIImage (extend)

- (float)maxLength;
- (float)minsLength;
+ (UIImage *)resizedImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height;
+ (UIImage*)animatedGIFNamed:(NSString*)name;
+ (UIImage*)animatedGIFWithData:(NSData *)data;

- (UIImage*)animatedImageByScalingAndCroppingToSize:(CGSize)size;
+ (UIImage*)resizedImageUrl:(NSURL*)url ToSize:(CGSize)size;
+ (UIImage*)cropImageUrl:(NSURL*)url ToRect:(CGRect)rect MaxPixel:(float)size;
+ (UIImage *)croppedImage:(UIImage*)image ToSize:(CGRect)bounds;

- (UIImage *)croppedImage:(CGRect)bounds;
- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;
+ (UIImage*)resizeImage:(UIImage*)image AndConvertJpeg:(CGSize)size;
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImage:(CGSize)newSize
                transform:(CGAffineTransform)transform
           drawTransposed:(BOOL)transpose
     interpolationQuality:(CGInterpolationQuality)quality;
- (CGAffineTransform)transformForOrientation:(CGSize)newSize;
+ (UIImage *)fixOrientationOfImage:(UIImage *)image;
+ (NSMutableArray*)splitImageIn4Parts:(UIImage *)image;
+ (UIImage *)mergeSplitImage4:(NSMutableArray*)array WithSize:(CGSize)size;

+ (NSMutableArray*)splitImageIn9Parts:(NSURL*)url ImageSize:(CGSize)size;
+ (NSMutableArray*)splitImageIn9Parts:(UIImage *)image;

+ (UIImage *)mergeSplitImage9:(NSMutableArray*)array WithSize:(CGSize)size;

@end
