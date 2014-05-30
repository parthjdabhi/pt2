//
//  PtViewBarButton.h
//  Pastel2
//
//  Created by SSC on 2014/05/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PtViewBarButtonType){
    PtViewBarButtonTypeSaveToCameraRoll = 1,
    PtViewBarButtonTypeInstagram,
    PtViewBarButtonTypeTwitter,
    PtViewBarButtonTypeFacebook,
    PtViewBarButtonTypeOther,
    PtViewBarButtonTypeBackToCamera,
    PtViewBarButtonTypeFilters,
    PtViewBarButtonTypeSliders
};

@interface PtViewBarButton : UIButton

@property (nonatomic, assign) PtViewBarButtonType type;

- (id)initWithType:(PtViewBarButtonType)type;

@end
