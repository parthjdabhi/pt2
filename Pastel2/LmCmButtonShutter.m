//
//  LmButtonShutter.m
//  Lumina
//
//  Created by SSC on 2014/05/22.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "LmCmButtonShutter.h"

@implementation LmCmButtonShutter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(didTouchDown:) forControlEvents:UIControlEventTouchDown];
        _holding = NO;
        _orientation = [MotionOrientation sharedInstance].deviceOrientation;
    }
    return self;
}

- (void)didTouchDown:(id)sender
{
    self.holding = YES;
}

- (void)setHolding:(BOOL)holding
{
    _holding = holding;
    [self setNeedsDisplay];
}

- (void)setSoundEnabled:(BOOL)soundEnabled
{
    _soundEnabled = soundEnabled;
    [self setNeedsDisplay];
}

- (void)setOrientation:(UIDeviceOrientation)orientation
{
    _orientation = orientation;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    float lineWidth = 3.0f;
    float radius = rect.size.width / 2.0f - 6.0f;
    UIColor* color = [UIColor whiteColor];
    UIColor* ovalColor = color;
    if (_holding) {
        ovalColor = [UIColor colorWithWhite:1.0f alpha:0.10f];
    }
    UIColor* pictColor = [LmCmSharedCamera bottomBarColor];
    
    //// Stroke Drawing
    UIBezierPath* strokePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(lineWidth / 2.0f, lineWidth / 2.0f, rect.size.width - lineWidth, rect.size.height - lineWidth)];
    [color setStroke];
    strokePath.lineWidth = lineWidth;
    [strokePath stroke];
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(rect.size.width / 2.0f - radius, rect.size.height / 2.0f - radius, radius * 2.0f, radius * 2.0f)];
    [ovalColor setFill];
    [ovalPath fill];
    
    if (!_soundEnabled && !_holding) {
        
        CGAffineTransform rot = CGAffineTransformMakeRotation([UIView angleByDeviceOrientation:_orientation]);
        CGAffineTransform move = CGAffineTransformMakeTranslation(rect.size.width / 2.0f, rect.size.height / 2.0f);
        CGAffineTransform complex = CGAffineTransformConcat(rot, move);
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(2.3, -4.74)];
        [bezier3Path addLineToPoint: CGPointMake(1.8, -4.24)];
        [bezier3Path addLineToPoint: CGPointMake(-1.83, -7.87)];
        [bezier3Path addLineToPoint: CGPointMake(2.3, -12)];
        [bezier3Path addLineToPoint: CGPointMake(2.3, -4.74)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(-2.44, -0)];
        [bezier3Path addLineToPoint: CGPointMake(-7.44, 5)];
        [bezier3Path addLineToPoint: CGPointMake(-11.7, 5)];
        [bezier3Path addLineToPoint: CGPointMake(-11.7, -5)];
        [bezier3Path addLineToPoint: CGPointMake(-7.44, -5)];
        [bezier3Path addLineToPoint: CGPointMake(-2.44, -0)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(2.3, 4.74)];
        [bezier3Path addLineToPoint: CGPointMake(2.3, 12)];
        [bezier3Path addLineToPoint: CGPointMake(-1.83, 7.87)];
        [bezier3Path addLineToPoint: CGPointMake(1.8, 4.24)];
        [bezier3Path addLineToPoint: CGPointMake(2.3, 4.74)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(1.8, -1.41)];
        [bezier3Path addLineToPoint: CGPointMake(10.29, -9.9)];
        [bezier3Path addLineToPoint: CGPointMake(11.7, -8.49)];
        [bezier3Path addLineToPoint: CGPointMake(3.21, -0)];
        [bezier3Path addLineToPoint: CGPointMake(11.7, 8.49)];
        [bezier3Path addLineToPoint: CGPointMake(10.29, 9.9)];
        [bezier3Path addLineToPoint: CGPointMake(1.8, 1.41)];
        [bezier3Path addLineToPoint: CGPointMake(-6.69, 9.9)];
        [bezier3Path addLineToPoint: CGPointMake(-8.1, 8.49)];
        [bezier3Path addLineToPoint: CGPointMake(0.39, 0)];
        [bezier3Path addLineToPoint: CGPointMake(-8.1, -8.49)];
        [bezier3Path addLineToPoint: CGPointMake(-6.69, -9.9)];
        [bezier3Path addLineToPoint: CGPointMake(1.8, -1.41)];
        [bezier3Path closePath];

        [bezier3Path applyTransform:complex];
        
        [pictColor setFill];
        [bezier3Path fill];
    }
}


@end
