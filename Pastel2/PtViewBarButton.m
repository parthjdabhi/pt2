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
    float length = [LmCmSharedCamera topBarHeight];
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
    UIColor* color = [UIColor colorWithWhite:0.95f alpha:1.0f];
    switch (_type) {
        case PtViewBarButtonTypeOther:
        {
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(35, 25)];
            [bezier2Path addLineToPoint: CGPointMake(32.12, 22.12)];
            [bezier2Path addLineToPoint: CGPointMake(25.73, 28.51)];
            [bezier2Path addLineToPoint: CGPointMake(21.49, 24.27)];
            [bezier2Path addLineToPoint: CGPointMake(27.88, 17.88)];
            [bezier2Path addLineToPoint: CGPointMake(25, 15)];
            [bezier2Path addLineToPoint: CGPointMake(35, 15)];
            [bezier2Path addLineToPoint: CGPointMake(35, 25)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(24, 18)];
            [bezier2Path addLineToPoint: CGPointMake(18, 18)];
            [bezier2Path addLineToPoint: CGPointMake(18, 32)];
            [bezier2Path addLineToPoint: CGPointMake(32, 32)];
            [bezier2Path addLineToPoint: CGPointMake(32, 26)];
            [bezier2Path addLineToPoint: CGPointMake(35, 29)];
            [bezier2Path addLineToPoint: CGPointMake(35, 35)];
            [bezier2Path addLineToPoint: CGPointMake(15, 35)];
            [bezier2Path addLineToPoint: CGPointMake(15, 18)];
            [bezier2Path addLineToPoint: CGPointMake(15, 15)];
            [bezier2Path addLineToPoint: CGPointMake(21, 15)];
            [bezier2Path addLineToPoint: CGPointMake(24, 18)];
            [bezier2Path closePath];
            [color setFill];
            [bezier2Path fill];
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
            [twitterPath moveToPoint: CGPointMake(34.14, 19.92)];
            [twitterPath addCurveToPoint: CGPointMake(34.16, 20.56) controlPoint1: CGPointMake(34.15, 20.13) controlPoint2: CGPointMake(34.16, 20.35)];
            [twitterPath addCurveToPoint: CGPointMake(20.73, 34.75) controlPoint1: CGPointMake(34.16, 27.16) controlPoint2: CGPointMake(29.41, 34.75)];
            [twitterPath addCurveToPoint: CGPointMake(13.5, 32.51) controlPoint1: CGPointMake(18.07, 34.75) controlPoint2: CGPointMake(15.59, 33.93)];
            [twitterPath addCurveToPoint: CGPointMake(14.63, 32.58) controlPoint1: CGPointMake(13.87, 32.56) controlPoint2: CGPointMake(14.24, 32.58)];
            [twitterPath addCurveToPoint: CGPointMake(20.49, 30.45) controlPoint1: CGPointMake(16.84, 32.58) controlPoint2: CGPointMake(18.87, 31.79)];
            [twitterPath addCurveToPoint: CGPointMake(16.08, 26.98) controlPoint1: CGPointMake(18.42, 30.41) controlPoint2: CGPointMake(16.68, 28.97)];
            [twitterPath addCurveToPoint: CGPointMake(16.97, 27.07) controlPoint1: CGPointMake(16.37, 27.04) controlPoint2: CGPointMake(16.66, 27.07)];
            [twitterPath addCurveToPoint: CGPointMake(18.21, 26.9) controlPoint1: CGPointMake(17.4, 27.07) controlPoint2: CGPointMake(17.81, 27.01)];
            [twitterPath addCurveToPoint: CGPointMake(14.42, 22.01) controlPoint1: CGPointMake(16.05, 26.44) controlPoint2: CGPointMake(14.42, 24.43)];
            [twitterPath addCurveToPoint: CGPointMake(14.42, 21.95) controlPoint1: CGPointMake(14.42, 21.99) controlPoint2: CGPointMake(14.42, 21.97)];
            [twitterPath addCurveToPoint: CGPointMake(16.56, 22.57) controlPoint1: CGPointMake(15.06, 22.32) controlPoint2: CGPointMake(15.79, 22.55)];
            [twitterPath addCurveToPoint: CGPointMake(14.46, 18.42) controlPoint1: CGPointMake(15.3, 21.68) controlPoint2: CGPointMake(14.46, 20.15)];
            [twitterPath addCurveToPoint: CGPointMake(15.1, 15.91) controlPoint1: CGPointMake(14.46, 17.51) controlPoint2: CGPointMake(14.7, 16.65)];
            [twitterPath addCurveToPoint: CGPointMake(24.83, 21.12) controlPoint1: CGPointMake(17.43, 18.93) controlPoint2: CGPointMake(20.91, 20.91)];
            [twitterPath addCurveToPoint: CGPointMake(24.71, 19.99) controlPoint1: CGPointMake(24.75, 20.76) controlPoint2: CGPointMake(24.71, 20.38)];
            [twitterPath addCurveToPoint: CGPointMake(29.43, 15) controlPoint1: CGPointMake(24.71, 17.23) controlPoint2: CGPointMake(26.82, 15)];
            [twitterPath addCurveToPoint: CGPointMake(32.87, 16.57) controlPoint1: CGPointMake(30.78, 15) controlPoint2: CGPointMake(32.01, 15.61)];
            [twitterPath addCurveToPoint: CGPointMake(35.87, 15.36) controlPoint1: CGPointMake(33.94, 16.35) controlPoint2: CGPointMake(34.95, 15.93)];
            [twitterPath addCurveToPoint: CGPointMake(33.79, 18.12) controlPoint1: CGPointMake(35.51, 16.53) controlPoint2: CGPointMake(34.76, 17.51)];
            [twitterPath addCurveToPoint: CGPointMake(36.5, 17.34) controlPoint1: CGPointMake(34.75, 18) controlPoint2: CGPointMake(35.66, 17.73)];
            [twitterPath addCurveToPoint: CGPointMake(34.14, 19.92) controlPoint1: CGPointMake(35.87, 18.34) controlPoint2: CGPointMake(35.07, 19.22)];
            [twitterPath closePath];
            twitterPath.miterLimit = 4;
            
            [color setFill];
            [twitterPath fill];
            

        }
            break;
        case PtViewBarButtonTypeFacebook:
        {
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(32.5, 18)];
            [bezier2Path addLineToPoint: CGPointMake(29.5, 18)];
            [bezier2Path addCurveToPoint: CGPointMake(26.5, 21) controlPoint1: CGPointMake(27.84, 18) controlPoint2: CGPointMake(26.5, 19.34)];
            [bezier2Path addLineToPoint: CGPointMake(26.5, 23.5)];
            [bezier2Path addLineToPoint: CGPointMake(24, 23.5)];
            [bezier2Path addLineToPoint: CGPointMake(24, 26.5)];
            [bezier2Path addLineToPoint: CGPointMake(26.5, 26.5)];
            [bezier2Path addLineToPoint: CGPointMake(26.5, 33.5)];
            [bezier2Path addLineToPoint: CGPointMake(29.5, 33.5)];
            [bezier2Path addLineToPoint: CGPointMake(29.5, 26.5)];
            [bezier2Path addLineToPoint: CGPointMake(32.5, 26.5)];
            [bezier2Path addLineToPoint: CGPointMake(32.5, 23.5)];
            [bezier2Path addLineToPoint: CGPointMake(29.5, 23.5)];
            [bezier2Path addLineToPoint: CGPointMake(29.5, 22)];
            [bezier2Path addCurveToPoint: CGPointMake(30.5, 21) controlPoint1: CGPointMake(29.5, 21.45) controlPoint2: CGPointMake(29.95, 21)];
            [bezier2Path addLineToPoint: CGPointMake(32.5, 21)];
            [bezier2Path addLineToPoint: CGPointMake(32.5, 18)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(35, 17)];
            [bezier2Path addLineToPoint: CGPointMake(35, 33)];
            [bezier2Path addCurveToPoint: CGPointMake(33, 35) controlPoint1: CGPointMake(35, 34.1) controlPoint2: CGPointMake(34.1, 35)];
            [bezier2Path addLineToPoint: CGPointMake(17, 35)];
            [bezier2Path addCurveToPoint: CGPointMake(15, 33) controlPoint1: CGPointMake(15.9, 35) controlPoint2: CGPointMake(15, 34.1)];
            [bezier2Path addLineToPoint: CGPointMake(15, 17)];
            [bezier2Path addCurveToPoint: CGPointMake(17, 15) controlPoint1: CGPointMake(15, 15.9) controlPoint2: CGPointMake(15.9, 15)];
            [bezier2Path addLineToPoint: CGPointMake(33, 15)];
            [bezier2Path addCurveToPoint: CGPointMake(35, 17) controlPoint1: CGPointMake(34.1, 15) controlPoint2: CGPointMake(35, 15.9)];
            [bezier2Path closePath];
            [color setFill];
            [bezier2Path fill];

        }
            break;
        case PtViewBarButtonTypeInstagram:
        {
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(32, 16.5)];
            [bezier2Path addLineToPoint: CGPointMake(31, 16.5)];
            [bezier2Path addCurveToPoint: CGPointMake(30, 17.5) controlPoint1: CGPointMake(30.45, 16.5) controlPoint2: CGPointMake(30, 16.95)];
            [bezier2Path addLineToPoint: CGPointMake(30, 18.5)];
            [bezier2Path addCurveToPoint: CGPointMake(31, 19.5) controlPoint1: CGPointMake(30, 19.05) controlPoint2: CGPointMake(30.45, 19.5)];
            [bezier2Path addLineToPoint: CGPointMake(32, 19.5)];
            [bezier2Path addCurveToPoint: CGPointMake(33, 18.5) controlPoint1: CGPointMake(32.55, 19.5) controlPoint2: CGPointMake(33, 19.05)];
            [bezier2Path addLineToPoint: CGPointMake(33, 17.5)];
            [bezier2Path addCurveToPoint: CGPointMake(32, 16.5) controlPoint1: CGPointMake(33, 16.95) controlPoint2: CGPointMake(32.55, 16.5)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(24.81, 21)];
            [bezier2Path addCurveToPoint: CGPointMake(22.17, 22.17) controlPoint1: CGPointMake(23.86, 21.05) controlPoint2: CGPointMake(22.91, 21.43)];
            [bezier2Path addCurveToPoint: CGPointMake(22.17, 27.83) controlPoint1: CGPointMake(20.61, 23.73) controlPoint2: CGPointMake(20.61, 26.27)];
            [bezier2Path addCurveToPoint: CGPointMake(27.83, 27.83) controlPoint1: CGPointMake(23.73, 29.39) controlPoint2: CGPointMake(26.27, 29.39)];
            [bezier2Path addCurveToPoint: CGPointMake(27.83, 22.17) controlPoint1: CGPointMake(29.39, 26.27) controlPoint2: CGPointMake(29.39, 23.73)];
            [bezier2Path addCurveToPoint: CGPointMake(24.83, 21) controlPoint1: CGPointMake(27, 21.35) controlPoint2: CGPointMake(25.91, 20.96)];
            [bezier2Path addLineToPoint: CGPointMake(24.81, 21)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(33, 21)];
            [bezier2Path addLineToPoint: CGPointMake(29.47, 21)];
            [bezier2Path addCurveToPoint: CGPointMake(29.24, 29.24) controlPoint1: CGPointMake(31.58, 23.36) controlPoint2: CGPointMake(31.51, 26.98)];
            [bezier2Path addCurveToPoint: CGPointMake(20.76, 29.24) controlPoint1: CGPointMake(26.9, 31.59) controlPoint2: CGPointMake(23.1, 31.59)];
            [bezier2Path addCurveToPoint: CGPointMake(20.53, 21) controlPoint1: CGPointMake(18.49, 26.98) controlPoint2: CGPointMake(18.42, 23.36)];
            [bezier2Path addLineToPoint: CGPointMake(17, 21)];
            [bezier2Path addLineToPoint: CGPointMake(17, 32)];
            [bezier2Path addCurveToPoint: CGPointMake(18, 33) controlPoint1: CGPointMake(17, 32.55) controlPoint2: CGPointMake(17.45, 33)];
            [bezier2Path addLineToPoint: CGPointMake(32, 33)];
            [bezier2Path addCurveToPoint: CGPointMake(33, 32) controlPoint1: CGPointMake(32.55, 33) controlPoint2: CGPointMake(33, 32.55)];
            [bezier2Path addLineToPoint: CGPointMake(33, 21)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(35, 17)];
            [bezier2Path addLineToPoint: CGPointMake(35, 33)];
            [bezier2Path addCurveToPoint: CGPointMake(33, 35) controlPoint1: CGPointMake(35, 34.1) controlPoint2: CGPointMake(34.1, 35)];
            [bezier2Path addLineToPoint: CGPointMake(17, 35)];
            [bezier2Path addCurveToPoint: CGPointMake(15, 33) controlPoint1: CGPointMake(15.9, 35) controlPoint2: CGPointMake(15, 34.1)];
            [bezier2Path addLineToPoint: CGPointMake(15, 17)];
            [bezier2Path addCurveToPoint: CGPointMake(17, 15) controlPoint1: CGPointMake(15, 15.9) controlPoint2: CGPointMake(15.9, 15)];
            [bezier2Path addLineToPoint: CGPointMake(33, 15)];
            [bezier2Path addCurveToPoint: CGPointMake(35, 17) controlPoint1: CGPointMake(34.1, 15) controlPoint2: CGPointMake(35, 15.9)];
            [bezier2Path closePath];
            [color setFill];
            [bezier2Path fill];
        }
            break;
        case PtViewBarButtonTypeBackToCamera:
            
            break;
        case PtViewBarButtonTypeSaveToCameraRoll:
        {
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(28, 22)];
            [bezierPath addLineToPoint: CGPointMake(33, 22)];
            [bezierPath addLineToPoint: CGPointMake(25, 30)];
            [bezierPath addLineToPoint: CGPointMake(17, 22)];
            [bezierPath addLineToPoint: CGPointMake(22, 22)];
            [bezierPath addLineToPoint: CGPointMake(22, 15)];
            [bezierPath addLineToPoint: CGPointMake(28, 15)];
            [bezierPath addLineToPoint: CGPointMake(28, 22)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(35, 35)];
            [bezierPath addLineToPoint: CGPointMake(15, 35)];
            [bezierPath addLineToPoint: CGPointMake(15, 25)];
            [bezierPath addLineToPoint: CGPointMake(18, 28)];
            [bezierPath addLineToPoint: CGPointMake(18, 32)];
            [bezierPath addLineToPoint: CGPointMake(32, 32)];
            [bezierPath addLineToPoint: CGPointMake(32, 28)];
            [bezierPath addLineToPoint: CGPointMake(35, 25)];
            [bezierPath addLineToPoint: CGPointMake(35, 35)];
            [bezierPath closePath];
            [color setFill];
            [bezierPath fill];
            
        }
            break;
        default:
            break;
    }
}


@end
