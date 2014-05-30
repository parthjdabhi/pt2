//
//  PtViewBarButton.m
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtViewBarButton.h"

@implementation PtViewBarButton

- (id)initWithType:(PtViewBarButtonType)type
{
    float length = [PtSharedEditor topBarHeight];
    CGRect frame = CGRectMake(0.0f, 0.0f, length, length);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _type = type;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    CGAffineTransform move = CGAffineTransformMakeTranslation(rect.size.width / 2.0f, rect.size.height / 2.0f);
    
    UIColor* color = [UIColor colorWithWhite:0.95f alpha:1.0f];
    switch (_type) {
        case PtViewBarButtonTypeOther:
        {
            
            //// Other Drawing
            UIBezierPath* otherPath = [UIBezierPath bezierPath];
            [otherPath moveToPoint: CGPointMake(10, 0)];
            [otherPath addLineToPoint: CGPointMake(7.12, -2.88)];
            [otherPath addLineToPoint: CGPointMake(0.73, 3.51)];
            [otherPath addLineToPoint: CGPointMake(-3.51, -0.73)];
            [otherPath addLineToPoint: CGPointMake(2.88, -7.12)];
            [otherPath addLineToPoint: CGPointMake(0, -10)];
            [otherPath addLineToPoint: CGPointMake(10, -10)];
            [otherPath addLineToPoint: CGPointMake(10, 0)];
            [otherPath closePath];
            [otherPath moveToPoint: CGPointMake(-1, -7)];
            [otherPath addLineToPoint: CGPointMake(-7, -7)];
            [otherPath addLineToPoint: CGPointMake(-7, 7)];
            [otherPath addLineToPoint: CGPointMake(7, 7)];
            [otherPath addLineToPoint: CGPointMake(7, 1)];
            [otherPath addLineToPoint: CGPointMake(10, 4)];
            [otherPath addLineToPoint: CGPointMake(10, 10)];
            [otherPath addLineToPoint: CGPointMake(-10, 10)];
            [otherPath addLineToPoint: CGPointMake(-10, -7)];
            [otherPath addLineToPoint: CGPointMake(-10, -10)];
            [otherPath addLineToPoint: CGPointMake(-4, -10)];
            [otherPath addLineToPoint: CGPointMake(-1, -7)];
            [otherPath closePath];
            [otherPath applyTransform:move];
            [color setFill];
            [otherPath fill];
            

        }
            break;
        case PtViewBarButtonTypeFilters:
            
            break;
        case PtViewBarButtonTypeSliders:
            
            break;
        case PtViewBarButtonTypeTwitter:
        {
            //// Twitter Drawing
            UIBezierPath* twitterPath = [UIBezierPath bezierPath];
            [twitterPath moveToPoint: CGPointMake(9.14, -5.08)];
            [twitterPath addCurveToPoint: CGPointMake(9.16, -4.44) controlPoint1: CGPointMake(9.15, -4.87) controlPoint2: CGPointMake(9.16, -4.65)];
            [twitterPath addCurveToPoint: CGPointMake(-4.27, 9.75) controlPoint1: CGPointMake(9.16, 2.16) controlPoint2: CGPointMake(4.41, 9.75)];
            [twitterPath addCurveToPoint: CGPointMake(-11.5, 7.51) controlPoint1: CGPointMake(-6.93, 9.75) controlPoint2: CGPointMake(-9.41, 8.93)];
            [twitterPath addCurveToPoint: CGPointMake(-10.37, 7.58) controlPoint1: CGPointMake(-11.13, 7.56) controlPoint2: CGPointMake(-10.76, 7.58)];
            [twitterPath addCurveToPoint: CGPointMake(-4.51, 5.45) controlPoint1: CGPointMake(-8.16, 7.58) controlPoint2: CGPointMake(-6.13, 6.79)];
            [twitterPath addCurveToPoint: CGPointMake(-8.92, 1.98) controlPoint1: CGPointMake(-6.58, 5.41) controlPoint2: CGPointMake(-8.32, 3.97)];
            [twitterPath addCurveToPoint: CGPointMake(-8.03, 2.07) controlPoint1: CGPointMake(-8.63, 2.04) controlPoint2: CGPointMake(-8.34, 2.07)];
            [twitterPath addCurveToPoint: CGPointMake(-6.79, 1.9) controlPoint1: CGPointMake(-7.6, 2.07) controlPoint2: CGPointMake(-7.19, 2.01)];
            [twitterPath addCurveToPoint: CGPointMake(-10.58, -2.99) controlPoint1: CGPointMake(-8.95, 1.44) controlPoint2: CGPointMake(-10.58, -0.57)];
            [twitterPath addCurveToPoint: CGPointMake(-10.58, -3.05) controlPoint1: CGPointMake(-10.58, -3.01) controlPoint2: CGPointMake(-10.58, -3.03)];
            [twitterPath addCurveToPoint: CGPointMake(-8.44, -2.43) controlPoint1: CGPointMake(-9.94, -2.68) controlPoint2: CGPointMake(-9.21, -2.45)];
            [twitterPath addCurveToPoint: CGPointMake(-10.54, -6.58) controlPoint1: CGPointMake(-9.7, -3.32) controlPoint2: CGPointMake(-10.54, -4.85)];
            [twitterPath addCurveToPoint: CGPointMake(-9.9, -9.09) controlPoint1: CGPointMake(-10.54, -7.49) controlPoint2: CGPointMake(-10.3, -8.35)];
            [twitterPath addCurveToPoint: CGPointMake(-0.17, -3.88) controlPoint1: CGPointMake(-7.57, -6.07) controlPoint2: CGPointMake(-4.09, -4.09)];
            [twitterPath addCurveToPoint: CGPointMake(-0.29, -5.01) controlPoint1: CGPointMake(-0.25, -4.24) controlPoint2: CGPointMake(-0.29, -4.62)];
            [twitterPath addCurveToPoint: CGPointMake(4.43, -10) controlPoint1: CGPointMake(-0.29, -7.77) controlPoint2: CGPointMake(1.82, -10)];
            [twitterPath addCurveToPoint: CGPointMake(7.87, -8.43) controlPoint1: CGPointMake(5.78, -10) controlPoint2: CGPointMake(7.01, -9.39)];
            [twitterPath addCurveToPoint: CGPointMake(10.87, -9.64) controlPoint1: CGPointMake(8.94, -8.65) controlPoint2: CGPointMake(9.95, -9.07)];
            [twitterPath addCurveToPoint: CGPointMake(8.79, -6.88) controlPoint1: CGPointMake(10.51, -8.47) controlPoint2: CGPointMake(9.76, -7.49)];
            [twitterPath addCurveToPoint: CGPointMake(11.5, -7.66) controlPoint1: CGPointMake(9.75, -7) controlPoint2: CGPointMake(10.66, -7.27)];
            [twitterPath addCurveToPoint: CGPointMake(9.14, -5.08) controlPoint1: CGPointMake(10.87, -6.66) controlPoint2: CGPointMake(10.07, -5.78)];
            [twitterPath closePath];
            [twitterPath applyTransform:move];
            twitterPath.miterLimit = 4;
            
            [color setFill];
            [twitterPath fill];
        }
            break;
        case PtViewBarButtonTypeFacebook:
        {
            
            //// Facebook Drawing
            UIBezierPath* facebookPath = [UIBezierPath bezierPath];
            [facebookPath moveToPoint: CGPointMake(7.5, -7)];
            [facebookPath addLineToPoint: CGPointMake(4.5, -7)];
            [facebookPath addCurveToPoint: CGPointMake(1.5, -4) controlPoint1: CGPointMake(2.84, -7) controlPoint2: CGPointMake(1.5, -5.66)];
            [facebookPath addLineToPoint: CGPointMake(1.5, -1.5)];
            [facebookPath addLineToPoint: CGPointMake(-1, -1.5)];
            [facebookPath addLineToPoint: CGPointMake(-1, 1.5)];
            [facebookPath addLineToPoint: CGPointMake(1.5, 1.5)];
            [facebookPath addLineToPoint: CGPointMake(1.5, 8.5)];
            [facebookPath addLineToPoint: CGPointMake(4.5, 8.5)];
            [facebookPath addLineToPoint: CGPointMake(4.5, 1.5)];
            [facebookPath addLineToPoint: CGPointMake(7.5, 1.5)];
            [facebookPath addLineToPoint: CGPointMake(7.5, -1.5)];
            [facebookPath addLineToPoint: CGPointMake(4.5, -1.5)];
            [facebookPath addLineToPoint: CGPointMake(4.5, -3)];
            [facebookPath addCurveToPoint: CGPointMake(5.5, -4) controlPoint1: CGPointMake(4.5, -3.55) controlPoint2: CGPointMake(4.95, -4)];
            [facebookPath addLineToPoint: CGPointMake(7.5, -4)];
            [facebookPath addLineToPoint: CGPointMake(7.5, -7)];
            [facebookPath closePath];
            [facebookPath moveToPoint: CGPointMake(10, -8)];
            [facebookPath addLineToPoint: CGPointMake(10, 8)];
            [facebookPath addCurveToPoint: CGPointMake(8, 10) controlPoint1: CGPointMake(10, 9.1) controlPoint2: CGPointMake(9.1, 10)];
            [facebookPath addLineToPoint: CGPointMake(-8, 10)];
            [facebookPath addCurveToPoint: CGPointMake(-10, 8) controlPoint1: CGPointMake(-9.1, 10) controlPoint2: CGPointMake(-10, 9.1)];
            [facebookPath addLineToPoint: CGPointMake(-10, -8)];
            [facebookPath addCurveToPoint: CGPointMake(-8, -10) controlPoint1: CGPointMake(-10, -9.1) controlPoint2: CGPointMake(-9.1, -10)];
            [facebookPath addLineToPoint: CGPointMake(8, -10)];
            [facebookPath addCurveToPoint: CGPointMake(10, -8) controlPoint1: CGPointMake(9.1, -10) controlPoint2: CGPointMake(10, -9.1)];
            [facebookPath closePath];
            [facebookPath applyTransform:move];
            [color setFill];
            [facebookPath fill];


        }
            break;
        case PtViewBarButtonTypeInstagram:
        {
            
            //// Instagram Drawing
            UIBezierPath* instagramPath = [UIBezierPath bezierPath];
            [instagramPath moveToPoint: CGPointMake(7, -8.5)];
            [instagramPath addLineToPoint: CGPointMake(6, -8.5)];
            [instagramPath addCurveToPoint: CGPointMake(5, -7.5) controlPoint1: CGPointMake(5.45, -8.5) controlPoint2: CGPointMake(5, -8.05)];
            [instagramPath addLineToPoint: CGPointMake(5, -6.5)];
            [instagramPath addCurveToPoint: CGPointMake(6, -5.5) controlPoint1: CGPointMake(5, -5.95) controlPoint2: CGPointMake(5.45, -5.5)];
            [instagramPath addLineToPoint: CGPointMake(7, -5.5)];
            [instagramPath addCurveToPoint: CGPointMake(8, -6.5) controlPoint1: CGPointMake(7.55, -5.5) controlPoint2: CGPointMake(8, -5.95)];
            [instagramPath addLineToPoint: CGPointMake(8, -7.5)];
            [instagramPath addCurveToPoint: CGPointMake(7, -8.5) controlPoint1: CGPointMake(8, -8.05) controlPoint2: CGPointMake(7.55, -8.5)];
            [instagramPath closePath];
            [instagramPath moveToPoint: CGPointMake(-0.19, -4)];
            [instagramPath addCurveToPoint: CGPointMake(-2.83, -2.83) controlPoint1: CGPointMake(-1.14, -3.95) controlPoint2: CGPointMake(-2.09, -3.57)];
            [instagramPath addCurveToPoint: CGPointMake(-2.83, 2.83) controlPoint1: CGPointMake(-4.39, -1.27) controlPoint2: CGPointMake(-4.39, 1.27)];
            [instagramPath addCurveToPoint: CGPointMake(2.83, 2.83) controlPoint1: CGPointMake(-1.27, 4.39) controlPoint2: CGPointMake(1.27, 4.39)];
            [instagramPath addCurveToPoint: CGPointMake(2.83, -2.83) controlPoint1: CGPointMake(4.39, 1.27) controlPoint2: CGPointMake(4.39, -1.27)];
            [instagramPath addCurveToPoint: CGPointMake(-0.17, -4) controlPoint1: CGPointMake(2, -3.65) controlPoint2: CGPointMake(0.91, -4.04)];
            [instagramPath addLineToPoint: CGPointMake(-0.19, -4)];
            [instagramPath closePath];
            [instagramPath moveToPoint: CGPointMake(8, -4)];
            [instagramPath addLineToPoint: CGPointMake(4.47, -4)];
            [instagramPath addCurveToPoint: CGPointMake(4.24, 4.24) controlPoint1: CGPointMake(6.58, -1.64) controlPoint2: CGPointMake(6.51, 1.98)];
            [instagramPath addCurveToPoint: CGPointMake(-4.24, 4.24) controlPoint1: CGPointMake(1.9, 6.59) controlPoint2: CGPointMake(-1.9, 6.59)];
            [instagramPath addCurveToPoint: CGPointMake(-4.47, -4) controlPoint1: CGPointMake(-6.51, 1.98) controlPoint2: CGPointMake(-6.58, -1.64)];
            [instagramPath addLineToPoint: CGPointMake(-8, -4)];
            [instagramPath addLineToPoint: CGPointMake(-8, 7)];
            [instagramPath addCurveToPoint: CGPointMake(-7, 8) controlPoint1: CGPointMake(-8, 7.55) controlPoint2: CGPointMake(-7.55, 8)];
            [instagramPath addLineToPoint: CGPointMake(7, 8)];
            [instagramPath addCurveToPoint: CGPointMake(8, 7) controlPoint1: CGPointMake(7.55, 8) controlPoint2: CGPointMake(8, 7.55)];
            [instagramPath addLineToPoint: CGPointMake(8, -4)];
            [instagramPath closePath];
            [instagramPath moveToPoint: CGPointMake(10, -8)];
            [instagramPath addLineToPoint: CGPointMake(10, 8)];
            [instagramPath addCurveToPoint: CGPointMake(8, 10) controlPoint1: CGPointMake(10, 9.1) controlPoint2: CGPointMake(9.1, 10)];
            [instagramPath addLineToPoint: CGPointMake(-8, 10)];
            [instagramPath addCurveToPoint: CGPointMake(-10, 8) controlPoint1: CGPointMake(-9.1, 10) controlPoint2: CGPointMake(-10, 9.1)];
            [instagramPath addLineToPoint: CGPointMake(-10, -8)];
            [instagramPath addCurveToPoint: CGPointMake(-8, -10) controlPoint1: CGPointMake(-10, -9.1) controlPoint2: CGPointMake(-9.1, -10)];
            [instagramPath addLineToPoint: CGPointMake(8, -10)];
            [instagramPath addCurveToPoint: CGPointMake(10, -8) controlPoint1: CGPointMake(9.1, -10) controlPoint2: CGPointMake(10, -9.1)];
            [instagramPath closePath];
            [instagramPath applyTransform:move];
            [color setFill];
            [instagramPath fill];
        }
            break;
        case PtViewBarButtonTypeBackToCamera:
            
            break;
        case PtViewBarButtonTypeSaveToCameraRoll:
        {
            
            //// Cameraroll Drawing
            UIBezierPath* camerarollPath = [UIBezierPath bezierPath];
            [camerarollPath moveToPoint: CGPointMake(3, -3)];
            [camerarollPath addLineToPoint: CGPointMake(8, -3)];
            [camerarollPath addLineToPoint: CGPointMake(0, 5)];
            [camerarollPath addLineToPoint: CGPointMake(-8, -3)];
            [camerarollPath addLineToPoint: CGPointMake(-3, -3)];
            [camerarollPath addLineToPoint: CGPointMake(-3, -10)];
            [camerarollPath addLineToPoint: CGPointMake(3, -10)];
            [camerarollPath addLineToPoint: CGPointMake(3, -3)];
            [camerarollPath closePath];
            [camerarollPath moveToPoint: CGPointMake(10, 10)];
            [camerarollPath addLineToPoint: CGPointMake(-10, 10)];
            [camerarollPath addLineToPoint: CGPointMake(-10, 0)];
            [camerarollPath addLineToPoint: CGPointMake(-7, 3)];
            [camerarollPath addLineToPoint: CGPointMake(-7, 7)];
            [camerarollPath addLineToPoint: CGPointMake(7, 7)];
            [camerarollPath addLineToPoint: CGPointMake(7, 3)];
            [camerarollPath addLineToPoint: CGPointMake(10, 0)];
            [camerarollPath addLineToPoint: CGPointMake(10, 10)];
            [camerarollPath closePath];
            [camerarollPath applyTransform:move];
            [color setFill];
            [camerarollPath fill];

        }
            break;
        default:
            break;
    }
    
    
}


@end
