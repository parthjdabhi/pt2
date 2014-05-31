//
//  LmCmViewPreviewLayer.m
//  Pastel2
//
//  Created by SSC on 2014/06/01.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "LmCmViewPreviewLayer.h"

@implementation LmCmViewPreviewLayer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)blackOut:(BOOL)enable
{
    if ([UIDevice isIOS6]) {
        if (enable) {
            self.backgroundColor = [UIColor blackColor];
        }else{
            self.backgroundColor = [UIColor clearColor];
        }
    }else{
        if (blurView == nil) {
            blurView = [[UIToolbar alloc] initWithFrame:self.bounds];
            blurView.hidden = YES;
            blurView.barStyle = UIBarStyleBlackTranslucent;
            [self addSubview:blurView];
        }
        blurView.hidden = !enable;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
