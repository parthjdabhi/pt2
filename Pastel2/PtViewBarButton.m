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
    CGRect frame = CGRectMake(0.0f, 0.0f, [PtSharedEditor topBarHeight], [PtSharedEditor topBarHeight]);
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
            
            break;
        case PtViewBarButtonTypeFilters:
            
            break;
        case PtViewBarButtonTypeSliders:
            
            break;
        case PtViewBarButtonTypeTwitter:
            
            break;
        case PtViewBarButtonTypeFacebook:
            
            break;
        case PtViewBarButtonTypeInstagram:
            
            break;
        case PtViewBarButtonTypeBackToCamera:
            
            break;
        default:
            break;
    }
}


@end
