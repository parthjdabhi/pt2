//
//  PtViewBottomBar.m
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "PtViewBottomBar.h"

@implementation PtViewBottomBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [PtConfigEditor bottomBarColor];
    }
    return self;
}

- (void)addBackToCameraButton:(PtViewBarButton*)button
{
    float x = button.width / 2.0f * 1.0f;
    button.center = CGPointMake(x, self.height / 2.0f);
    [self addSubview:button];
}
- (void)addFiltersButton:(PtViewBarButton*)button
{
    float x = button.width / 2.0f * 3.0f;
    button.center = CGPointMake(x, self.height / 2.0f);
    [self addSubview:button];
}
- (void)addSlidersButton:(PtViewBarButton*)button
{
    float x = button.width / 2.0f * 5.0f;
    button.center = CGPointMake(x, self.height / 2.0f);
    [self addSubview:button];
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
